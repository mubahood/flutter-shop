import 'package:mshop/models/AppConfig.dart';
import 'package:mshop/models/Utils.dart';
import 'package:sqflite/sqflite.dart';

class MovieModel {
  static const String TABLE_NAME = 'movies';
  int id = 0;
  int rating = 0;
  String title = "";
  String actor = "";
  String category = "";

  tableCreate() async {
    var db = await openDatabase(AppConfig.LOCAL_DB_PATH);

    if (!db.isOpen) {
      Utils.toast("Failed to open database");
      return;
    }

    try {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS ${MovieModel.TABLE_NAME} (id INTEGER PRIMARY KEY autoincrement, title TEXT, actor TEXT, category TEXT)');
      print("TABLE CREATED SUCCESSFULLY!");
    } catch (e) {
      print("failed to created table because ${e.toString()}");
    }
  }
}
