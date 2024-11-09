import 'package:flutter/material.dart';
import '../repos/auth_repository.dart';
import 'login_state.dart';

class LoginProvider extends ChangeNotifier {
  final AuthRepository _authRepository;

  LoginProvider({required AuthRepository authRepository})
      : _authRepository = authRepository {
    checkLoginStatus();
  }

  LoginState _state = LoginInitialState();
  LoginState get state => _state;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void _setState(LoginState state) {
    _state = state;
    notifyListeners();
  }

  Future<void> login(String email, String password) async {
    _setState(LoginLoadingState());
    final result = await _authRepository.login(email, password);
    result.fold(
      (failure) => _setState(LoginFailureState(failure.message)),
      (success) {
        _isLoggedIn = true;
        _setState(LoginSuccessState());
      },
    );
  }

  Future<void> logout() async {
    _setState(LoginLoadingState());
    final result = await _authRepository.logout();
    result.fold(
      (failure) => _setState(LoginFailureState(failure.message)),
      (_) {
        _isLoggedIn = false;
        _setState(LoginInitialState());
      },
    );
  }

  Future<void> checkLoginStatus() async {
    _isLoggedIn = await _authRepository.isLoggedIn();
    _setState(_isLoggedIn ? LoginSuccessState() : LoginInitialState());
  }
}
