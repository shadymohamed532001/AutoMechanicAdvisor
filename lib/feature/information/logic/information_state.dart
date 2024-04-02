part of 'information_cubit.dart';

sealed class InformationState extends Equatable {
  const InformationState();

  @override
  List<Object> get props => [];
}

final class InformationInitial extends InformationState {}

final class GetInformationDataLoading extends InformationState {}

final class GetInformationDataSuccess extends InformationState {
  final List<InformationModel> informationModel;

  const GetInformationDataSuccess({required this.informationModel});
}

final class GetInformationDataError extends InformationState {
  final String error;

  const GetInformationDataError({required this.error});
}
