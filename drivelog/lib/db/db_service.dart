
import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/db/models/refuel_dao.dart';
import 'package:drivelog/db/models/trip_dao.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DBService {
  static DBService? _instance;

  static Future<DBService> getInstance() async {
    _instance ??= DBService._();
    while (!_instance!._isInitialized) {
      await Future.delayed(const Duration(milliseconds: 100));
    }
    return _instance!;
  }

  bool _isInitialized = false;
  late final Database _db;

  DBService._() {
    WidgetsFlutterBinding.ensureInitialized();
    _initDB();
    getDatabasesPath().then((value) => debugPrint("DB-Path: $value"));
  }

  _initDB() async {
    _db = await openDatabase(
      join(await getDatabasesPath(), 'drivelog.db'),
      onCreate: (db, version) {
        rootBundle.loadString('assets/db.sql').then((value) {
          debugPrint("DB-Init: $value");
          var split = value.split(";");
          split.sublist(0, split.length - 1).forEach((element) {
            db.execute(element);
          });
        });
      },
      version: 2,
    );
    _isInitialized = true;
  }

  Future<void> execute(String query) async {
    _db.execute(query);
  }

  Future<List<Map<String, Object?>>> query(String query, List<Object> args) async {
    return await _db.rawQuery(query, args);
  }

  Future<void> insert(dynamic dao) async {
    switch (dao.runtimeType) {
      case const (CarDAO):
        _insertCar(dao);
      case const (TripDAO):
        _insertTrip(dao);
      case const (RefuelDAO):
        _insertRefuel(dao);
      default:
        throw Exception("Unknown DAO");
    }
  }

  Future<void> _insertCar(CarDAO dao) async {
    await _db.insert(
      'Car',
      dao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<void> _insertTrip(TripDAO dao) async {
    await _db.insert(
      'Trip',
      dao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );


  }Future<void> _insertRefuel(RefuelDAO dao) async {
    await _db.insert(
      'Refuel',
      dao.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }
}