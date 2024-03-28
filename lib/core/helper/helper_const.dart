import 'dart:developer';

import 'package:auto_mechanic_advisor/core/networking/local_services.dart';
import 'package:flutter/material.dart';

String? usertoken;
bool? onBording;

String? fullname;

Future<Map<String, dynamic>> fetchDataFromLocalStorage() async {
  onBording = await LocalServices.getData(key: 'onbording');
  usertoken = await LocalServices.getData(key: 'token');
  fullname = await LocalServices.getData(key: 'name');
  log('UserToken : $usertoken');
  log('onBording : $onBording');
  log('name : $fullname');

  return {'onBording': onBording, 'token': usertoken};
}

void showCustomSnackBar(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(message),
    ),
  );
}
