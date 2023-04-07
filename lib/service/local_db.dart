import 'package:hive/hive.dart';

class LocalDB {
  static const String dbName = "hive_example";
  static Box? appBox;
  static openBox() async {
    appBox = await Hive.openBox(dbName);
  }

  static setName(String name) {
    appBox!.put('name', name);
  }
}
