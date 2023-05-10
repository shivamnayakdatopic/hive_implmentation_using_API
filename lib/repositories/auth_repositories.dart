// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_with_bloc/services/auth_services.dart';



class AuthRepositories {
  final AuthServices authServices;
  AuthRepositories({
    required this.authServices,
  });
  //patient login



  Future<List> maritalStatusList() async {
    try {
      return await authServices.fetchMaritalList();
    }  catch (e) {
      throw "Something wrong";
    }
  }

  
}
