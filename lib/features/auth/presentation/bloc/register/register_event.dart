part of 'register_bloc.dart';

abstract class RegisterEvent extends Equatable {
  const RegisterEvent();

  @override
  List<Object> get props => [];
}

class RegisterEmailChangedEvent extends RegisterEvent {
  final String email;
  RegisterEmailChangedEvent({required this.email});
}

class RegisterPasswordChangedEvent extends RegisterEvent {
  final String password;
  RegisterPasswordChangedEvent({required this.password});
}

class RegisterNameChangedEvent extends RegisterEvent {
  final String name;
  RegisterNameChangedEvent({required this.name});
}

class RegisterConfirmPasswordChangedEvent extends RegisterEvent {
  final String confirmPassword;
  RegisterConfirmPasswordChangedEvent({required this.confirmPassword});
}

class RegisterTermsConditionCheckedEvent extends RegisterEvent {
  final bool isCheck;
  RegisterTermsConditionCheckedEvent({required this.isCheck});
}

class SubmitRegisterEvent extends RegisterEvent {}
