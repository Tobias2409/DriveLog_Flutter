
import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/helpers/observable.dart';

import '../db/db_service.dart';

class CarService extends Observable{
  static CarService? _instance;

  static CarService getInstance(){
    return _instance ??= CarService._();
  }

  CarService._();




  final Future<DBService> _dbService = DBService.getInstance();


  Future<bool> anyCars() async {
    var db = await _dbService;

    var result = await db.query("SELECT COUNT(*) c FROM Car;", []);
    int count = result[0]['c'] as int;

    return count > 0;
  }

  Future<void> addCar(CarDAO car) async{
    var db = await _dbService;
    await db.insert(car);
    notify();
  }
}