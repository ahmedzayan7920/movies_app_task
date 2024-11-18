import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/auth_repository.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final AuthRepository _authRepository;

  LoginCubit({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitialState());

  Future<void> login({
    required String email,
    required String password,
  }) async {
    emit(LoginLoadingState());
    final result = await _authRepository.login(email, password);
    result.fold(
      (failure) => emit(LoginFailureState(failure.message)),
      (_) => emit(LoginSuccessState()),
    );
  }

  Future<void> logout() async {
    emit(LoginLoadingState());
    final result = await _authRepository.logout();
    result.fold(
      (failure) => emit(LoginFailureState(failure.message)),
      (_) => emit(LoginInitialState()),
    );
  }

  Future<void> checkLoginStatus() async {
    final isLoggedIn = await _authRepository.isLoggedIn();
    emit(isLoggedIn ? LoginSuccessState() : LoginInitialState());
  }
}
