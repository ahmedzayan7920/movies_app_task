import 'package:flutter_bloc/flutter_bloc.dart';

import '../repos/auth_repository.dart';
import 'login_event.dart';
import 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository _authRepository;

  LoginBloc({required AuthRepository authRepository})
      : _authRepository = authRepository,
        super(LoginInitialState()) {
    on<LoginRequestEvent>(_onLoginRequested);
    on<LogoutRequestEvent>(_onLogoutRequested);
    on<CheckLoginStatusEvent>(_onCheckLoginStatus);
  }

  Future<void> _onLoginRequested(
      LoginRequestEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    final result = await _authRepository.login(event.email, event.password);
    result.fold(
      (failure) => emit(LoginFailureState(failure.message)),
      (_) => emit(LoginSuccessState()),
    );
  }

  Future<void> _onLogoutRequested(
      LogoutRequestEvent event, Emitter<LoginState> emit) async {
    emit(LoginLoadingState());
    final result = await _authRepository.logout();
    result.fold(
      (failure) => emit(LoginFailureState(failure.message)),
      (_) => emit(LoginInitialState()),
    );
  }

  Future<void> _onCheckLoginStatus(
      CheckLoginStatusEvent event, Emitter<LoginState> emit) async {
    final isLoggedIn = await _authRepository.isLoggedIn();
    emit(isLoggedIn ? LoginSuccessState() : LoginInitialState());
  }
}
