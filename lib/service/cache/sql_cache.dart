import 'package:tonder/model/partner.dart';
import 'package:tonder/service/cache/cache.dart';
import 'package:sqflite/sqflite.dart';
import 'package:tonder/util/constants.dart';

class SqlCache extends Cache {
  late Database db;

  @override
  Future<void> init() async {
    db = await openDatabase('tonder_db.db', version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE ${Constants.likeTable} (id TEXT PRIMARY KEY, name TEXT, age INTEGER, gender INTEGER, status INTEGER, image STRING)');
      await db.execute(
          'CREATE TABLE ${Constants.passTable} (id TEXT PRIMARY KEY, name TEXT, age INTEGER, gender INTEGER, status INTEGER, image STRING)');
        });
  }

  @override
  Future<bool> addToFavorite(Partner partner) {
    // TODO: implement addToFavorite
    throw UnimplementedError();
  }

  @override
  Future<bool> addToLike(Partner partner) {
    return db
        .insert(
      Constants.likeTable,
      partner.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      return true;
    });
  }

  @override
  Future<List<Partner>> getFavorites() {
    // TODO: implement getFavorites
    throw UnimplementedError();
  }

  @override
  Future<List<Partner>> getLikes() {
    return db.query(Constants.likeTable).then(
          (list) => list.map((p) => Partner.fromJson(p)).toList(),
        );
  }

  @override
  Future<bool> removeLike(Partner partner) {
    return db.delete(
      Constants.likeTable,
      where: 'id = ?',
      whereArgs: [partner.id],
    ).then((value) => true);
  }

  @override
  Future<bool> addToPass(Partner partner) {
    return db
        .insert(
      Constants.passTable,
      partner.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    )
        .then((value) {
      return true;
    });
  }

  @override
  Future<List<Partner>> getPass() {
    return db.query(Constants.passTable).then(
          (list) => list.map((p) => Partner.fromJson(p)).toList(),
    );
  }

  @override
  Future<bool> removePass(Partner partner) {
    return db.delete(
      Constants.passTable,
      where: 'id = ?',
      whereArgs: [partner.id],
    ).then((value) => true);
  }
}
