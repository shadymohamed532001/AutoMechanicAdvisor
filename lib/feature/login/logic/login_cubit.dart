// Import necessary packages and files
import 'package:auto_mechanic_advisor/feature/login/models/user_model.dart';
import 'package:auto_mechanic_advisor/core/error/servier_failure.dart';
import 'package:auto_mechanic_advisor/core/networking/api_services.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Import the login state file
part 'login_state.dart';

// Create a Cubit to manage the login state
class LoginCubit extends Cubit<LoginState> {
  // Constructor for LoginCubit, initializes with LoginInitial state
  LoginCubit() : super(LoginInitial());

  // Method to handle user sign-in
  void userSignIn({
    required String email,
    required String password,
    String? lang,
  }) async {
    emit(
        LoginLoading()); // Emit a loading state while sign-in process is ongoing

    try {
      // Send post request to sign-in endpoint
      var response = await ApiServices.postData(
        endpoint: loginendpoint,
        data: {
          'email': email,
          'password': password,
        },
      );

      // Parse the response into a UserModel object
      final UserModel user = UserModel.fromJson(response);

      // Emit a success state with the UserModel object
      emit(LoginSuccess(loginModel: user));
    } catch (e) {
      // Handle errors that occur during sign-in process
      if (e is DioException) {
        emit(LoginError(
          // Emit an error state with the error message
          error: ServerFailure.fromDioException(e).errMessage.toString(),
        ));
      } else {
        emit(LoginError(
          // Emit an error state with the error message
          error: ServerFailure(e.toString()).errMessage.toString(),
        ));
      }
    }
  }

  // Global key for the login form
  var formKey = GlobalKey<FormState>();

  // Controller for the email input field
  var emailController = TextEditingController();

  // Controller for the password input field
  var passwordController = TextEditingController();

  // Autovalidate mode for form validation
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;
}
