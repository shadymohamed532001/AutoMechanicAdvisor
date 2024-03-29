import 'dart:convert';
import 'dart:io';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:auto_mechanic_advisor/core/helper/naviagtion_extentaions.dart';
import 'package:auto_mechanic_advisor/core/networking/local_services.dart';
import 'package:auto_mechanic_advisor/core/routing/routes.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_image_assets.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/core/widgets/app_bottom.dart';
import 'package:auto_mechanic_advisor/core/widgets/shows_toust_color.dart';
import 'package:auto_mechanic_advisor/feature/login/models/user_model.dart';
import 'package:auto_mechanic_advisor/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:auto_mechanic_advisor/feature/sign_up/ui/widgets/sign_up_form.dart';
import 'package:image_picker/image_picker.dart';

class SignUpViewBody extends StatefulWidget {
  const SignUpViewBody({super.key});

  @override
  State<SignUpViewBody> createState() => _SignUpViewBodyState();
}

class _SignUpViewBodyState extends State<SignUpViewBody> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SignUpCubit, SignUpState>(
      listener: (context, state) {
        if (state is SignUpLoading) {
          showDialog(
            context: context,
            builder: (_) => Center(
              child: CircularProgressIndicator(
                color: ColorManager.whiteColor,
              ),
            ),
          );
        }
        if (state is SignUpSuccess) {
          if (state.registerModel.status == true) {
            Navigator.of(context).pop();
            showTouster(
              massage: state.registerModel.message!,
              state: ToustState.SUCCESS,
            );
            saveUserData(state.registerModel.data!);

            LocalServices.saveData(
              key: 'token',
              value: state.registerModel.data!.token,
            ).then(
              (value) {
                context.navigateTo(
                  routeName: Routes.homeViewsRoute,
                );
              },
            );
          }
        }
        if (state is SignUpError) {
          Navigator.of(context).pop();
          showTouster(
            massage: state.errorMessage,
            state: ToustState.ERROR,
          );
        }
      },
      builder: (context, state) {
        var signUpCubite = BlocProvider.of<SignUpCubit>(context);
        return Padding(
          padding:
              EdgeInsets.symmetric(horizontal: 18.w, vertical: 40.h).copyWith(
            bottom: 0,
          ),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SafeArea(
                    child: Image.asset(
                      ImagesAssetsManager.applogoImage,
                      width: 120.w,
                      height: 40.h,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'We ‘re happy to see you back again',
                    style: AppStyle.font16Greyregular,
                  ),
                  SizedBox(height: 20.h),
                  GestureDetector(
                    onTap: () async {
                      await signUpCubite.uploadImageFromGalleryModel(
                        picker: ImagePicker(),
                      );
                    },
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: ColorManager.darkGreyColor,
                      backgroundImage: signUpCubite.image != null
                          ? FileImage(File(signUpCubite.image!.path))
                          : null,
                      child: signUpCubite.image == null
                          ? const Icon(Icons.add_photo_alternate)
                          : null,
                    ),
                  ),
                  FadeInDown(
                    child: const SignUpForm(),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  CustomBottom(
                    bottomtext: 'Sign Up',
                    textBottomStyle: AppStyle.font16Whitesemibold,
                    onPressed: () {
                      if (signUpCubite.formKey.currentState!.validate()) {
                        if (SignUpForm.selectedRole == 'User') {
                          signUpUser(context);
                        } else if (SignUpForm.selectedRole == 'Mechanic') {
                          userSignUpMechanic(context);
                        }
                      } else {
                        signUpCubite.autovalidateMode = AutovalidateMode.always;
                        setState(() {});
                      }
                    },
                    backgroundColor: ColorManager.primaryColor,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Text(
                    'I have account ?',
                    style: AppStyle.font16Greyregular,
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      context.navigateAndReplacement(
                          newRoute: Routes.loginViewsRoute);
                    },
                    child: Text(
                      'Login',
                      style: AppStyle.font14Primarysemibold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  void signUpUser(BuildContext context) {
    BlocProvider.of<SignUpCubit>(context).userSignUpUser(
      email: context.read<SignUpCubit>().emailController.text,
      password: context.read<SignUpCubit>().passwordController.text,
      city: context.read<SignUpCubit>().addressController.text,
      fullName: context.read<SignUpCubit>().nameController.text,
      phoneNumber: context.read<SignUpCubit>().passwordController.text,
    );
  }

  void userSignUpMechanic(BuildContext context) {
    BlocProvider.of<SignUpCubit>(context).userSignUpMechanic(
      email: context.read<SignUpCubit>().emailController.text,
      password: context.read<SignUpCubit>().passwordController.text,
      address: context.read<SignUpCubit>().addressController.text,
      fullName: context.read<SignUpCubit>().nameController.text,
      phoneNumber: context.read<SignUpCubit>().passwordController.text,
    );
  }

  void saveUserData(Data data) {
    UserModel userModel = UserModel(data: data);
    String userJson = jsonEncode(userModel.toJson());
    LocalServices.saveData(key: 'userData', value: userJson);
  }
}
