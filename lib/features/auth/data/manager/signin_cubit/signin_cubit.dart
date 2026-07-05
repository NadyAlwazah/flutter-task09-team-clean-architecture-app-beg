import 'package:bloc/bloc.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/api_services.dart';
import 'package:flutter_task09_team_clean_architecture_app_beg/core/services/app_link.dart';
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

      emit(SigninSuccess(response));
    } catch (e) {
      emit(SigninError(e.toString()));
    }
  }
}
