
import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/db/models/trip_dao.dart';
import 'package:drivelog/helpers/observable.dart';
import 'package:drivelog/models/event.dart';
import 'package:flutter/cupertino.dart';

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

  Future<void> addTrip(TripDAO dao) async{
    var db = await _dbService;
    await db.insert(dao);
    notify();
  }

  Future<List<CarDAO>> getCars() async {
    var db = await _dbService;
    List<CarDAO> list = [];

    var result = await db.query("SELECT * FROM Car", []);

    for (var x in result) {
      list.add(CarDAO.fromMap(x));
    }

    return list;
  }

  Future<double> getMileage(int carID) async{
    var db = await _dbService;

    var trips = await db.query("SELECT IFNULL(SUM(Distance),0.0) d FROM Trip WHERE CarFK = ?", [carID]);

    return trips[0]['d'] as double;
  }

  Future<List<Event>> getEvents(int carID) async{
    var db = await _dbService;

    var trips = await db.query("SELECT * FROM Trip WHERE CarFK = ? ORDER BY DateAdded DESC", [carID]);
    //var refuels = await db.query("SELECT * FROM Trip WHERE CarFK = ? ", [carID]);

    List<Event> events = [];

    for(var trip in trips){
      events.add(Event(EventType.trip, DateTime.parse(trip['DateAdded'] as String) , (trip["Distance"] as num).toDouble(), (trip["FuelConsumption"] as num?)?.toDouble()));
    }

    return events;

  }


}