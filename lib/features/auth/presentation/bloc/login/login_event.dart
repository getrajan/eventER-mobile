part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();

  @override
  List<Object> get props => [];
}

class EmailChangedEvent extends LoginEvent {
  final String email;
  EmailChangedEvent(this.email);
}

class PasswordChangedEveneet extends LoginEvent {
  final String password;
  PasswordChangedEveneet(this.password);
}

class LoginSubmitedEvent extends LoginEvent {
  final Map<String, dynamic> loginData;

  LoginSubmitedEvent({required this.loginData});
}
