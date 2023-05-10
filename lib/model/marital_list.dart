import 'package:hive/hive.dart';

part 'marital_list.g.dart'; // This is we have to write inside model and after run this command-- " flutter packages pub run build_runner build" in terminal 

@HiveType(typeId: 0) // This is unique in whole project.
class FamilyStatus extends HiveObject {
  @HiveField(0) // This is also unique inside this model class.
  int? id;

  @HiveField(1)
  String? value;

  @HiveField(2)
  String? labelType;

  FamilyStatus({
    this.id,
    this.value,
    this.labelType,
  });

  factory FamilyStatus.fromJson(Map<String, dynamic> json) {
    return FamilyStatus(
      id: json['id'],
      value: json['value'],
      labelType: json['label_type'],
    );
  }

  @override
  String toString() {
    return 'FamilyStatus(id:$id, value: $value, labelType:$labelType)';
  }
}
