part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}

// GetUserDataLoading state indicating that user data is being fetched
final class GetUserDataLoading extends HomeState {}

// GetUserDataSuccess state indicating successful retrieval of user data
final class GetUserDataSuccess extends HomeState {
  final User userData; // User data retrieved successfully

  // Constructor for GetUserDataSuccess state with required userData parameter
  const GetUserDataSuccess({required this.userData});
}

// GetUserDataError state indicating an error occurred while fetching user data
final class GetUserDataError extends HomeState {
  final String error; // Error message describing the issue

  // Constructor for GetUserDataError state with required error parameter
  const GetUserDataError({required this.error});
}
