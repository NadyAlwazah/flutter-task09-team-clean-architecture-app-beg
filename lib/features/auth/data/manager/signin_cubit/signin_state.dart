part of 'signin_cubit.dart';

@immutable
sealed class SigninState {}

final class SigninInitial extends SigninState {}

final class SigninLoading extends SigninState {}

final class SigninSuccess extends SigninState {
  final dynamic data;
  SigninSuccess(this.data);
}

final class SigninError extends SigninState {
  final String message;
  SigninError(this.message);
}
