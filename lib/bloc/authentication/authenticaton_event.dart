part of 'authenticaton_bloc.dart';

sealed class AuthenticatonEvent {}

final class RegisterEvent extends AuthenticatonEvent {
  String userName;
  String userEmailId;
  String userPassword;
  RegisterEvent(
      {required this.userName,
      required this.userEmailId,
      required this.userPassword});
}

final class LoginEvent extends AuthenticatonEvent {
  String userEmailId;
  String userPassword;
  LoginEvent({required this.userEmailId, required this.userPassword});
}

final class ForgotPasswordEvent extends AuthenticatonEvent{
  String email;
  String password;
  String confirm;
  ForgotPasswordEvent({required this.email , required this.password , required this.confirm,});
}
