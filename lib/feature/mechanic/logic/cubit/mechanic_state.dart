part of 'mechanic_cubit.dart';

sealed class MechanicState extends Equatable {
  const MechanicState();

  @override
  List<Object> get props => [];
}

final class MechanicInitial extends MechanicState {}

final class GetMechanicDataLoading extends MechanicState {}

final class GetMechanicDataError extends MechanicState {
  final String error;

  const GetMechanicDataError({required this.error});
}

final class GetMechanicDataSuccess extends MechanicState {
  final List<MechanicModel> mechanicInfo;

  const GetMechanicDataSuccess({required this.mechanicInfo});
}

final class LunchWhatsAppLoading extends MechanicState {}

final class LunchWhatsAppSuccess extends MechanicState {}

final class LunchWhatsAppError extends MechanicState {
  final String error;

  const LunchWhatsAppError({required this.error});
}

final class LunchPhoneLoading extends MechanicState {}

final class LunchPhoneSuccess extends MechanicState {}

final class LunchPhoneError extends MechanicState {
  final String error;

  const LunchPhoneError({required this.error});
}
