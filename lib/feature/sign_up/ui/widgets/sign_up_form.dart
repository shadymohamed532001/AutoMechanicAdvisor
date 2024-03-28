import 'package:auto_mechanic_advisor/feature/sign_up/logic/sign_up_cubit.dart';
import 'package:auto_mechanic_advisor/feature/sign_up/ui/widgets/custom_dropdown_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:auto_mechanic_advisor/core/widgets/app_text_formfield.dart';
import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/core/helper/validators_helper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({super.key});

  @override
  State<SignUpForm> createState() => _SignUpFormState();

  static String get selectedRole =>
      _SignUpFormState.selectedRole; // Getter to access selectedRole
}

class _SignUpFormState extends State<SignUpForm> {
  bool isPassword = true;
  static String selectedRole = 'User'; // Default value

  @override
  Widget build(BuildContext context) {
    var signUpCubit = BlocProvider.of<SignUpCubit>(context);
    return Form(
      key: signUpCubit.formKey,
      autovalidateMode: context.read<SignUpCubit>().autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 30.h,
          ),
          CustomDropdownButton<String>(
            value: selectedRole,
            onChanged: (newValue) {
              setState(() {
                selectedRole = newValue!;
              });
            },
            items: ['User', 'Mechanic'].map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            icon: Icons.arrow_drop_down,
            iconSize: 30,
            dropdownColor: ColorManager.darkGreyColor,
          ),
          selectedRole == 'User'
              ? SizedBox(height: 30.h)
              : SizedBox(height: 30.h),
          CustomTextFormField(
            fillColor: ColorManager.darkGreyColor,
            obscureText: false,
            hintText: 'Full Name',
            keyboardType: TextInputType.name,
            controller: signUpCubit.nameController,
            validator: (text) {
              return MyValidatorsHelper.displayNamevalidator(text);
            },
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            fillColor: ColorManager.darkGreyColor,
            obscureText: false,
            hintText: 'Email address',
            keyboardType: TextInputType.emailAddress,
            controller: signUpCubit.emailController,
            validator: (text) {
              return MyValidatorsHelper.emailValidator(text);
            },
          ),
          SizedBox(height: 20.h),
          CustomTextFormField(
            fillColor: ColorManager.darkGreyColor,
            obscureText: isPassword,
            suffixIcon: InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  isPassword = !isPassword;
                });
              },
              child: isPassword
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
            hintText: 'Min 6 Characters',
            keyboardType: TextInputType.visiblePassword,
            controller: signUpCubit.passwordController,
            validator: (text) {
              return MyValidatorsHelper.passwordValidator(text);
            },
          ),
          SizedBox(height: 20.h),
          if (selectedRole == 'Mechanic')
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomTextFormField(
                  fillColor: ColorManager.darkGreyColor,
                  obscureText: false,
                  hintText: 'Address',
                  keyboardType: TextInputType.text,
                  controller: signUpCubit.addressController,
                  validator: (text) {
                    return MyValidatorsHelper.addressValidator(text);
                  },
                ),
                SizedBox(height: 20.h),
                CustomTextFormField(
                  fillColor: ColorManager.darkGreyColor,
                  obscureText: false,
                  hintText: 'Phone Number',
                  keyboardType: TextInputType.phone,
                  controller: signUpCubit.phoneController,
                  validator: (text) {
                    return MyValidatorsHelper.phoneValidator(text);
                  },
                ),
              ],
            ),
          selectedRole == 'User'
              ? SizedBox(height: 80.h)
              : SizedBox(height: 0.h),
        ],
      ),
    );
  }
}
