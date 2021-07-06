part of 'login_bloc.dart';

class LoginState {
  const LoginState({
    required this.email,
    required this.password,
    required this.formSubmissionStatus,
  });

  final String email;
  bool get isEmailValid => RegExp(emailReg).hasMatch(email);
  final String password;
  bool get isPasswordValid => password.length >= 6;
  final FormSubmissionStatus formSubmissionStatus;

  LoginState copyWith({
    String? email,
    String? password,
    FormSubmissionStatus? formSubmissionStatus,
  }) {
    return LoginState(
      email: email ?? this.email,
      password: password ?? this.password,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
    );
  }
}
