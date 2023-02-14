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

  static Future<List<MovieModel>> getItems() async {
    List<MovieModel> items = [];
    var db = await openDatabase(AppConfig.LOCAL_DB_PATH);
    if (!db.isOpen) {
      return items;
    }
    List<Map> maps = await db.query(TABLE_NAME);

    for (var element in maps) {
      MovieModel m = MovieModel();
      m.id = int.parse(element['id'].toString());
      m.title = element['title'].toString();
      m.actor = element['actor'].toString();
      m.category = element['category'].toString();
      items.add(m);
    }

    return items;
  }

  Future<bool> save() async {
    bool success = false;
    await tableCreate();
    var db = await openDatabase(AppConfig.LOCAL_DB_PATH);
    if (!db.isOpen) {
      return success;
    }

    try {
      int dbId = await db.insert(TABLE_NAME, toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace
      );
      print("MOVIE SAVED SUCCESSFULLY! with ID =>>$dbId<<===");
      success = true;
    } catch (e) {
      success = false;
      print("FAILED TO SAVE MOVIE! because ${e.toString()}");
    }

    return success;
  }

  toJson() {
    return {
      'id': this.id,
      'title': this.title,
      'actor': this.actor,
      'category': this.category,
    };
  }

  deleteItem() async {
    var db = await openDatabase(AppConfig.LOCAL_DB_PATH);
    if (!db.isOpen) {
      print("Failed to open db.");
      return;
    }
    try {
      await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [id]);
      print("Successfully deleted");
    } catch (e) {
      print("FAILED TO DELETE BECAUSE ${e.toString()}");
    }
  }

  tableCreate() async {
    var db = await openDatabase(AppConfig.LOCAL_DB_PATH);

    if (!db.isOpen) {
      Utils.toast("Failed to open database");
      return;
    }

    try {
      await db.execute(
          'CREATE TABLE IF NOT EXISTS ${MovieModel.TABLE_NAME} (id INTEGER PRIMARY KEY autoincrement, title TEXT, actor TEXT, category TEXT)');
      //print("TABLE CREATED SUCCESSFULLY!");
    } catch (e) {
      print("failed to created table because ${e.toString()}");
    }
  }
}
