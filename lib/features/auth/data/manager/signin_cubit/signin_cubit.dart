import 'package:bloc/bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api/api_services.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api/app_link.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/shared_preferences_services.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/features/auth/data/models/user_model.dart';
import 'package:meta/meta.dart';

part 'signin_state.dart';

class SigninCubit extends Cubit<SigninState> {
  SigninCubit() : super(SigninInitial());

  Future<void> login({
    required String username,
    required String password,
  }) async {
    emit(SigninLoading());

    try {
      final response = await ApiServices.postData(
        baseUrl: AppLink.authBaseUrl,
        endpoint: AppLink.loginApi,

        body: {"username": username, "password": password},
      );
      if (response != null) {
        final user = UserModel.fromJson(response);
        await SharedPreferencesServices.saveAccessToken(user.accessToken);

        emit(SigninSuccess(user));
      }
    } catch (e) {
      emit(SigninError(e.toString()));
    }
  }
}
