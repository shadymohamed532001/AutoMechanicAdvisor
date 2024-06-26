import 'dart:developer';
import 'package:auto_mechanic_advisor/core/error/servier_failure.dart';
import 'package:auto_mechanic_advisor/core/networking/api_services.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/networking/local_services.dart';
import 'package:auto_mechanic_advisor/feature/home/data/models/user.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  User? userData;

  Future<void> getUserData() async {
    emit(GetUserDataLoading());
    try {
      String token = await LocalServices.getData(key: 'token');
      var response = await ApiServices.getData(
        token: token,
        endpoint: userendpoint,
      );
      userData = User.fromJson(response);
      saveUserDataToLocalStorage(userData!);
      emit(GetUserDataSuccess(userData: userData!));
    } catch (e) {
      if (e is DioException) {
        log(e.error.toString());
        emit(GetUserDataError(
          error: ServerFailure.fromDioException(e).errMessage,
        ));
      } else {
        log(e.toString());
        emit(
          GetUserDataError(error: ServerFailure(e.toString()).errMessage),
        );
      }
    }
  }

  void saveUserDataToLocalStorage(User userData) {
    LocalServices.saveData(key: 'name', value: userData.data!.fullName);
    LocalServices.saveData(key: 'image', value: userData.data!.image);
  }
}
