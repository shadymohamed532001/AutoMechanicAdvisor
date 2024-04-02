import 'package:auto_mechanic_advisor/core/error/servier_failure.dart';
import 'package:auto_mechanic_advisor/core/networking/api_services.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/core/networking/local_services.dart';
import 'package:auto_mechanic_advisor/feature/information/data/models/information_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'information_state.dart';

class InformationCubit extends Cubit<InformationState> {
  InformationCubit() : super(InformationInitial());
  List<InformationModel> informationResult = [];

  Future<void> getInformationData() async {
    emit(GetInformationDataLoading());
    try {
      String token = await LocalServices.getData(key: 'token');
      Map<String, dynamic> response = await ApiServices.getData(
        endpoint: exploreendpoint,
        token: token,
      );
      if (response.containsKey('data')) {
        List<InformationModel> informations = [];
        for (var mechanicData in response['data']) {
          informations.add(InformationModel.fromJson(mechanicData));
        }
        informationResult = informations;
        emit(GetInformationDataSuccess(informationModel: informationResult));
      } else {
        emit(const GetInformationDataError(error: 'No Mechanic Found'));
      }
    } catch (e) {
      if (e is DioException) {
        emit(GetInformationDataError(
          error: ServerFailure.fromDioException(e).errMessage,
        ));
      } else {
        print(e.toString());

        emit(GetInformationDataError(
            error: ServerFailure(e.toString()).errMessage));
      }
    }
  }
}
