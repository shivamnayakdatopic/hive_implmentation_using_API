import 'dart:async';
import 'dart:convert';
import 'package:hive/hive.dart';
import 'package:hive_with_bloc/hive/hive_database.dart';
import 'package:hive_with_bloc/model/marital_list.dart';
import 'package:http/http.dart' as http;

class AuthServices {
  Future<List<FamilyStatus>> fetchMaritalList() async {
    final box = await HiveDB().openFamilyStatusBox();
    // For Iterate value and store inside list.
    final listData = box.values.toList().cast<FamilyStatus>();

    if (listData.isNotEmpty) {
      return listData;
    } else {
      // print("API Execute");
      try {
        await Future.delayed(Duration(seconds: 4));
        const url = 'http://54.90.99.24:8000/api/v1/getMaritalStatusList';
        final uri = Uri.parse(url);
        final response = await http.get(uri);

        if (response.statusCode == 200) {
          final parsedJson = json.decode(response.body);
          final list = parsedJson['family_status'] as List;
          final value =
              list.map((item) => FamilyStatus.fromJson(item)).toList();
          await box.clear();
          await box.addAll(value);
          return value;
        } else {
          throw Exception('Failed to load marital status list');
        }
      } catch (e) {
        throw Exception('Something went wrong');
      }
    }
  }
}
