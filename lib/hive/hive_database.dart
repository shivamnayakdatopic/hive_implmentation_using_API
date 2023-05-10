import 'package:hive/hive.dart';
import 'package:hive_with_bloc/model/marital_list.dart';

class HiveDB {
  Future<Box<FamilyStatus>> openFamilyStatusBox() async {
    await Hive.openBox<FamilyStatus>('family_status');
    return Hive.box<FamilyStatus>('family_status');
  }

  Future<void> closeFamilyStatusBox() async {
    final box = Hive.box<FamilyStatus>('family_status');
    if (box.isOpen) {
      await box.close();
    }
  }
}
