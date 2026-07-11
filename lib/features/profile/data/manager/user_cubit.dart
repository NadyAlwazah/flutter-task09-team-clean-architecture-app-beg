import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api/api_services.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api/app_link.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/profile/data/models/profile_model.dart';

import 'user_state.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitial());

  ProfileModel? currentUser;

  Future<void> getUserProfile() async {
    emit(UserLoading());
    try {
      final response = await ApiServices.getData(AppLink.profileApi);
      currentUser = ProfileModel.fromJson(response);
      emit(UserSuccess(user: currentUser!));
    } catch (e) {
      emit(UserFailure(errorMessage: e.toString()));
    }
  }

  Future<void> updateUserProfile({
    required String name,
    required String email,
    required String password,
  }) async {
    if (currentUser == null) return;

    emit(UserUpdating());
    try {
      final updatedModel = ProfileModel(
        name: name,
        email: email,
        password: password,
        image: currentUser!.image,
      );

      final response = await ApiServices.postData(
        baseUrl: AppLink.authBaseUrl,
        endpoint: "users/1",
        body: updatedModel.toJson(),
      );

      currentUser = ProfileModel.fromJson(response);
      emit(UserUpdateSuccess(updatedUser: currentUser!));
      emit(UserSuccess(user: currentUser!));
    } catch (e) {
      emit(UserFailure(errorMessage: e.toString()));
    }
  }
}
