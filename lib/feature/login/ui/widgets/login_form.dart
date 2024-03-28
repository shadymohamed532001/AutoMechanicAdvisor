import 'package:auto_mechanic_advisor/core/utils/app_colors.dart';
import 'package:auto_mechanic_advisor/feature/login/logic/login_cubit.dart';
import 'package:auto_mechanic_advisor/core/widgets/app_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/helper/validators_helper.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool ispassword = true;

  @override
  Widget build(BuildContext context) {
    var loginCubite = BlocProvider.of<LoginCubit>(context);
    return Form(
      key: loginCubite.formKey,
      autovalidateMode: context.read<LoginCubit>().autovalidateMode,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 40.h,
          ),
          CustomTextFormField(
            obscureText: false,
            fillColor: ColorManager.darkGreyColor,
            hintText: 'Email',
            keyboardType: TextInputType.emailAddress,
            controller: loginCubite.emailController,
            validator: (text) {
              return MyValidatorsHelper.emailValidator(text);
            },
          ),
          SizedBox(
            height: 30.h,
          ),
          CustomTextFormField(
            obscureText: ispassword,
            fillColor: ColorManager.darkGreyColor,
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
            controller: loginCubite.passwordController,
            validator: (text) {
              return MyValidatorsHelper.passwordValidator(text);
            },
          ),
          const SizedBox(
            height: 5,
          ),
        ],
      ),
    );
  }
}
