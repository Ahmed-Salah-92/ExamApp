sealed class AuthLoginEvent {}
class LoginEvent extends AuthLoginEvent {}
class RememberMeEvent extends AuthLoginEvent {}
class SingUpEvent extends AuthLoginEvent {}
class ForgetPasswordEvent extends AuthLoginEvent {}