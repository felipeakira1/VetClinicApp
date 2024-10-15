import 'package:flutter_bloc/flutter_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String email;
  final String password;

  LoginButtonPressed({required this.email, required this.password});
}

class LoggedOut extends LoginEvent {}

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginFailed extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginInitial()) {
    on<LoginButtonPressed>((event, emit) async {
      emit(LoginLoading());
      final bool isAuthenticated = await _mockLogin();
      if(isAuthenticated) {
        emit(LoginSuccess());
      } else {
        emit(LoginFailed());
      }
    });
    on<LoggedOut>((event, emit) async {
      emit(LoginInitial());
    });
  }

  Future<bool> _mockLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    return true;
  }
}