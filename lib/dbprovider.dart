/*
import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'alibimodel.dart';

class DBProvider {
  static Database _database;
  static final DBProvider db = DBProvider._();
  DBProvider._();
  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, 'AlibiDB.db');
    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
      await db.execute('CREATE TABLE Alibi('
          'utcid INTEGER PRIMARY KEY,'
          'rawalibi TEXT'
          ')');
    });
  }
/*
  createAlibi(Alibi newAlibi) async {
    await deleteAllAlibi();
    final db = await database;
    final res = await db.insert('Alibi', newAlibi.toJson());

    return res;
  }

  Future<int> deleteAllAlibi() async {
    final db = await database;
    final res = await db.rawDelete('DELETE FROM Alibi');
    return res;
  }

  Future<List<Alibi>> getAllAlibi() async {
    final db = await database;
    final res = await db.rawQuery("SELECT * FROM ALIBI");
    List<Alibi> list =
        res.isNotEmpty ? res.map((c) => Alibi.fromJson(c)).toList() : [];
    return list;
  }*/
}
*/
