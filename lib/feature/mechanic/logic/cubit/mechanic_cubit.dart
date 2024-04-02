// ignore_for_file: use_build_context_synchronously

import 'dart:developer';
import 'package:auto_mechanic_advisor/core/error/servier_failure.dart';
import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/networking/api_services.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/networking/local_services.dart';
import 'package:auto_mechanic_advisor/feature/mechanic/data/mechanic_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';

part 'mechanic_state.dart';

class MechanicCubit extends Cubit<MechanicState> {
  MechanicCubit() : super(MechanicInitial());
  List<MechanicModel>? mechanicInfoResult = <MechanicModel>[];
  Future<void> getMechanic() async {
    emit(GetMechanicDataLoading());
    try {
      String token = await LocalServices.getData(key: 'token');
      Map<String, dynamic> response = await ApiServices.getData(
        endpoint: mechanicendpoint,
        token: token,
      );
      if (response.containsKey('data')) {
        List<MechanicModel> mechanicInfo = [];
        for (var mechanicData in response['data']) {
          mechanicInfo.add(MechanicModel.fromJson(mechanicData));
        }
        mechanicInfoResult = mechanicInfo;
        emit(GetMechanicDataSuccess(mechanicInfo: mechanicInfoResult!));
      } else {
        emit(const GetMechanicDataError(error: 'No Mechanic Found'));
      }
    } catch (e) {
      if (e is DioException) {
        emit(GetMechanicDataError(
          error: ServerFailure.fromDioException(e).errMessage,
        ));
      } else {
        log(e.toString());
        emit(GetMechanicDataError(
            error: ServerFailure(e.toString()).errMessage));
      }
    }
  }

  void launchWhatsApp(
      {required String phoneNumber, required BuildContext context}) async {
    emit(LunchWhatsAppLoading());
    try {
      Uri url = Uri.parse(
        'https://wa.me/$phoneNumber',
      );
      bool launched = await launchUrl(url);

      if (launched) {
        emit(LunchWhatsAppSuccess());
      } else {
        context.pop();
      }
    } catch (e) {
      if (e is DioException) {
        emit(LunchWhatsAppError(
          error: ServerFailure.fromDioException(e).errMessage,
        ));
      } else {
        log(e.toString());
        emit(LunchWhatsAppError(error: ServerFailure(e.toString()).errMessage));
      }
    }
  }

  void launchphone(
      {required String phoneNumber, required BuildContext context}) async {
    emit(LunchPhoneLoading());
    try {
      Uri url = Uri(
        scheme: 'tel',
        path: phoneNumber,
      );
      bool launched = await launchUrl(url);

      if (launched) {
        emit(LunchPhoneSuccess());
      } else {
        context.pop();
      }
    } catch (e) {
      if (e is DioException) {
        emit(LunchWhatsAppError(
          error: ServerFailure.fromDioException(e).errMessage,
        ));
      } else {
        log(e.toString());
        emit(
          LunchPhoneError(
            error: ServerFailure(e.toString()).errMessage,
          ),
        );
      }
    }
  }
}
