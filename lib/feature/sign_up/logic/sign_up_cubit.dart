import 'package:auto_mechanic_advisor/core/error/servier_failure.dart';
import 'package:auto_mechanic_advisor/core/networking/api_services.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/feature/login/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

part 'sign_up_state.dart';

// Create a Cubit to manage the sign-up state
class SignUpCubit extends Cubit<SignUpState> {
  // Constructor for SignUpCubit, initializes with SignUpInitial state
  SignUpCubit() : super(SignUpInitial());

  // Method to handle user sign-up
  void userSignUpUser({
    required String email,
    required String password,
    required String fullName,
    required String city,
    required String phoneNumber,
  }) async {
    emit(
        SignUpLoading()); // Emit a loading state while sign-up process is ongoing

    try {
      // Create form data for API request
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image!.path),
        'email': email,
        'password': password,
        'fullName': fullName,
      });

      // Send post request to sign-up endpoint
      var response = await ApiServices.postFormData(
        endpoint: registerendPoint,
        formData: formData,
      );

      // Parse the response into a UserModel object
      final UserModel user = UserModel.fromJson(response);

      // Emit a success state with the UserModel object
      emit(SignUpSuccess(registerModel: user));
    } catch (e) {
      // Handle errors that occur during sign-up process
      if (e is DioException) {
        emit(SignUpError(
          // Emit an error state with the error message
          errorMessage: ServerFailure.fromDioException(e).errMessage.toString(),
        ));
      } else {
        emit(const SignUpError(
          // Emit an error state with the error message
          errorMessage: 'please upload your image',
        ));
      }
    }
  }

  void userSignUpMechanic({
    required String email,
    required String password,
    required String fullName,
    required String address,
    required String phoneNumber,
  }) async {
    emit(
        SignUpLoading()); // Emit a loading state while sign-up process is ongoing

    try {
      // Create form data for API request
      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(image!.path),
        'email': email,
        'password': password,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'address': address,
        'userType': 'mechanic'
      });

      // Send post request to sign-up endpoint
      var response = await ApiServices.postFormData(
        endpoint: registerendPoint,
        formData: formData,
      );

      // Parse the response into a UserModel object
      final UserModel user = UserModel.fromJson(response);

      // Emit a success state with the UserModel object
      emit(SignUpSuccess(registerModel: user));
    } catch (e) {
      // Handle errors that occur during sign-up process
      if (e is DioException) {
        emit(SignUpError(
          // Emit an error state with the error message
          errorMessage: ServerFailure.fromDioException(e).errMessage.toString(),
        ));
      } else {
        emit(const SignUpError(
          // Emit an error state with the error message
          errorMessage: 'please upload your image',
        ));
      }
    }
  }

  XFile? image;

  Future<void> uploadImageFromGalleryModel(
      {required ImagePicker picker}) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        // Image picked, proceed with upload
        image = pickedFile;
        emit(UploadImageFromGallerySuccessState(image: image!));

        // Here, you can call the method to upload the image to the server
        // Example: uploadImageToServer(image!);
      } else {
        // No image picked, emit error state
        emit(const UploadImageErrorState(errorMessage: "No image picked"));
      }
    } catch (e) {
      // Error occurred during image picking, emit error state
      emit(UploadImageErrorState(errorMessage: e.toString()));
    }
  }

  // Global key for the sign-up form
  var formKey = GlobalKey<FormState>();

  // Autovalidate mode for form validation
  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  // Controller for the name input field
  TextEditingController nameController = TextEditingController();

  // Controller for the email input field
  TextEditingController emailController = TextEditingController();

  // Controller for the password input field
  TextEditingController passwordController = TextEditingController();

  // Controller for the phone number input field
  TextEditingController phoneController = TextEditingController();

  // Controller for the city input field
  TextEditingController addressController = TextEditingController();
}
