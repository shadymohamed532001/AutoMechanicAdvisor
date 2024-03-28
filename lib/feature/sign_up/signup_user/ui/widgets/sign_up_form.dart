import 'package:auto_mechanic_advisor/core/helper/validators_helper.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/utils/app_styles.dart';
import 'package:auto_mechanic_advisor/core/widgets/app_text_formfield.dart';
import 'package:auto_mechanic_advisor/feature/sign_up/signup_user/logic/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Form(
      key: signUpCubit.formKey,
      autovalidateMode: context.read<SignUpCubit>().autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'name',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            fillColor: ColorManager.darkGreyColor,
            obscureText: false,
            hintText: 'Full Name',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.nameController,
            validator: (text) {
              return MyValidatorsHelper.displayNamevalidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Email address',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            fillColor: ColorManager.darkGreyColor,
            obscureText: false,
            hintText: 'Email address',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.emailController,
            validator: (text) {
              return MyValidatorsHelper.emailValidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'Password',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            fillColor: ColorManager.darkGreyColor,
            obscureText: ispassword,
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  ispassword = !ispassword;
                });
              },
              child: ispassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            hintText: 'Min 6 Cyfr',
            keyboardType: TextInputType.visiblePassword,
            controller: signUpCubit.passwordController,
            validator: (text) {
              return MyValidatorsHelper.passwordValidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'City',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            hintText: 'city',
            fillColor: ColorManager.darkGreyColor,
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.cityController,
            validator: (text) {
              return MyValidatorsHelper.cityValidator(text);
            },
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            'phone',
            style: AppStyle.font16blacksemibold,
          ),
          SizedBox(
            height: 5.h,
          ),
          CustomTextFormFiled(
            obscureText: false,
            fillColor: ColorManager.darkGreyColor,
            hintText: 'phone Number',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.phoneController,
            validator: (text) {
              return MyValidatorsHelper.phoneValidator(text);
            },
          ),
        ],
      ),
    );
  }
}
