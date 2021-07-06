part of 'register_bloc.dart';

class RegisterState {
  const RegisterState({
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.name,
    required this.formSubmissionStatus,
    required this.isTermsConditionCheck,
  });

  final String email;
  bool get isEmailValid => RegExp(emailReg).hasMatch(email);
  final String password;
  bool get isPasswordValid => password.length >= 6;
  final String confirmPassword;
  bool get isConfirmPasswordValid =>
      confirmPassword.isNotEmpty && password == confirmPassword;
  final String name;
  bool get isNameValid => name.isNotEmpty;
  final bool isTermsConditionCheck;
  final FormSubmissionStatus formSubmissionStatus;

  RegisterState copyWith(
      {String? email,
      String? password,
      String? confirmPassword,
      String? name,
      bool? isTermsConditionCheck,
      FormSubmissionStatus? formSubmissionStatus}) {
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      name: name ?? this.name,
      formSubmissionStatus: formSubmissionStatus ?? this.formSubmissionStatus,
      isTermsConditionCheck:
          isTermsConditionCheck ?? this.isTermsConditionCheck,
    );
  }
}
