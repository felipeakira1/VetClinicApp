import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AuthenticationEvents {}

class AppStarted extends AuthenticationEvents {}

// Evento para fins de teste
class LoggedIn extends AuthenticationEvents {}

class LoggedOut extends AuthenticationEvents {}

abstract class AuthenticationStates {}

class AuthenticationInitial extends AuthenticationStates {}

// Autenticado
class AuthenticationAuthenticated extends AuthenticationStates {}

// Não autenticado
class AuthenticationUnauthenticated extends AuthenticationStates {}

class AuthenticationLoading extends AuthenticationStates {}
// Não autorizado
class AuthenticationFailed extends AuthenticationStates {}

class AuthenticationBloc extends Bloc<AuthenticationEvents, AuthenticationStates> {
  AuthenticationBloc() : super(AuthenticationInitial()) {
    on<AppStarted>((event, emit) async {
      final bool isAuthenticated = await _checkIfAuthenticated();
      if(isAuthenticated) {
        emit(AuthenticationAuthenticated());
      } else {
        emit(AuthenticationUnauthenticated());
      }
    });
    on<LoggedIn> ((event, emit) async {
      emit(AuthenticationAuthenticated());
    });
    on<LoggedOut> ((event, emit) async {
      emit(AuthenticationUnauthenticated());
    });
  }

  Future<bool> _checkIfAuthenticated() async {
    // FirebaseAuth
    return false;
  }
}