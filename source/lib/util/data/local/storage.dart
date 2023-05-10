import 'package:hive_flutter/adapters.dart';

///Local Storage
class LocalStorage {
  ///Boxes
  static final _boxes = [
    "spotify",
  ];

  ///Open Boxes
  static Future<void> openBoxes() async {
    for (final box in _boxes) {
      await Hive.openBox(box);
    }
  }

  ///Store Data
  static Future<void> saveData({
    required String box,
    required Map<dynamic, dynamic> data,
  }) async {
    //Local Box
    final localBox = Hive.box(box);

    //Save Data
    try {
      localBox.putAll(data);
    } on HiveError catch (error) {
      print(error.message);
    }
  }
}
