import '../../data/models/profile_model.dart';

abstract class UserState {}

class UserInitial extends UserState {}

class UserLoading extends UserState {}

class UserSuccess extends UserState {
  final ProfileModel user;
  UserSuccess({required this.user});
}

class UserFailure extends UserState {
  final String errorMessage;
  UserFailure({required this.errorMessage});
}

class UserUpdating extends UserState {}

class UserUpdateSuccess extends UserState {
  final ProfileModel updatedUser;
  UserUpdateSuccess({required this.updatedUser});
}