import 'dart:io';
import 'package:auto_mechanic_advisor/core/error/servier_failure.dart';
import 'package:auto_mechanic_advisor/core/networking/api_services.dart';
import 'package:auto_mechanic_advisor/core/networking/end_boint.dart';
import 'package:auto_mechanic_advisor/feature/login/models/user_model.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';

part 'sign_up_state.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit() : super(SignUpInitial());

  Future<void> userSignUpUser({
    required String email,
    required String password,
    required String fullName,
    required String city,
    required String phoneNumber,
  }) async {
    emit(SignUpLoading());

    try {
      if (image == null) {
        throw Exception('Image is not selected.');
      }

      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: 'photo_${DateTime.now().millisecondsSinceEpoch}.jpg',
          contentType: MediaType('image', 'jpg'),
        ),
        'email': email,
        'password': password,
        'fullName': fullName,
      });

      var response = await ApiServices.postFormData(
        endpoint: registerendPoint,
        formData: formData,
      );

      final UserModel user = UserModel.fromJson(response);

      emit(SignUpSuccess(registerModel: user));
    } catch (e) {
      if (e is DioException) {
        emit(SignUpError(
          errorMessage: ServerFailure.fromDioException(e).errMessage.toString(),
        ));
      } else {
        emit(const SignUpError(
          errorMessage: 'Please upload your image',
        ));
      }
    }
  }

  Future<File?> uploadImageFromGalleryModel({
    required ImagePicker picker,
  }) async {
    try {
      XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);

      if (pickedFile != null) {
        image = File(pickedFile.path);
        emit(UploadImageFromGallerySuccessState(image: pickedFile));
        return image; // Return the image file
      } else {
        emit(const UploadImageErrorState(errorMessage: "No image picked"));
        return null;
      }
    } catch (e) {
      emit(UploadImageErrorState(errorMessage: e.toString()));
      return null;
    }
  }

  File? image;
  void userSignUpMechanic({
    required String email,
    required String password,
    required String fullName,
    required String address,
    required String phoneNumber,
  }) async {
    emit(SignUpLoading());

    try {
      if (image == null) {
        throw Exception('Image is not selected.');
      }

      FormData formData = FormData.fromMap({
        'image': await MultipartFile.fromFile(
          image!.path,
          filename: image!.path.split('/').last,
        ),
        'email': email,
        'password': password,
        'fullName': fullName,
        'phoneNumber': phoneNumber,
        'address': address,
        'userType': 'mechanic'
      });

      var response = await ApiServices.postFormData(
        endpoint: registerendPoint,
        formData: formData,
      );

      final UserModel user = UserModel.fromJson(response);

      emit(SignUpSuccess(registerModel: user));
    } catch (e) {
      if (e is DioException) {
        emit(SignUpError(
          errorMessage: ServerFailure.fromDioException(e).errMessage.toString(),
        ));
      } else {
        emit(const SignUpError(
          errorMessage: 'Please upload your image',
        ));
      }
    }
  }

  var formKey = GlobalKey<FormState>();

  AutovalidateMode? autovalidateMode = AutovalidateMode.disabled;

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController addressController = TextEditingController();
}
