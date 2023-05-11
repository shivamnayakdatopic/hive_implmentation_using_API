// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:hive_with_bloc/hive/hive_database.dart';
import 'package:hive_with_bloc/model/marital_list.dart';
import 'package:hive_with_bloc/services/auth_services.dart';

class AuthRepositories {
  final AuthServices authServices;
  AuthRepositories({
    required this.authServices,
  });
  //patient login

  Future<List> maritalStatusList() async {
    final box = await HiveDB().openFamilyStatusBox();
    // For Iterate value and store inside list.
    final listData = box.values.toList().cast<FamilyStatus>();
    if (listData.isNotEmpty) {
      print("##############----  hive execute");
      return listData;
    }

    try {
      return await authServices.fetchMaritalList();
    } catch (e) {
      throw "Something wrong";
    }
  }
}
