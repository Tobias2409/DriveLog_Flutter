
import 'package:drivelog/db/models/car_dao.dart';
import 'package:drivelog/db/models/refuel_dao.dart';
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

  addCar(CarDAO car) async{
    var db = await _dbService;
    await db.insert(car);
    notify();
  }

  addTrip(TripDAO dao) async{
    var db = await _dbService;
    await db.insert(dao);
    notify();
  }

  addRefuel(RefuelDAO dao) async {
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

    var carDistance = ((await db.query("SELECT StartMileage FROM Car WHERE ID = ?", [carID]))[0]["StartMileage"] as num?)?.toDouble() ?? 0;
    var trips = await db.query("SELECT IFNULL(SUM(Distance),0.0) d FROM Refuel WHERE CarFK = ?", [carID]);

    return carDistance + (trips[0]['d'] as num).toDouble();
  }

  Future<List<Event>> getEvents(int carID) async{
    var db = await _dbService;

    //var result = await db.query('SELECT * FROM (SELECT "Trip" Type, DateAdded, FuelConsumption Fuel, Distance FROM Trip WHERE CarFK = ? UNION SELECT "Refuel" Type, DateAdded, FuelAmount Fuel, Distance FROM Refuel WHERE CarFK = ?) ORDER BY DateAdded DESC;', [carID, carID]);
    var result = await db.query('SELECT "Refuel" Type, DateAdded, FuelAmount Fuel, Distance FROM Refuel WHERE CarFK = ? ORDER BY DateAdded DESC;', [carID]);


    List<Event> events = [];

    for(var event in result){
      events.add(Event(event["Type"] as String == "Trip" ? EventType.trip : EventType.refuel, DateTime.parse(event['DateAdded'] as String) , (event["Distance"] as num?)?.toDouble(), (event["Fuel"] as num?)?.toDouble()));
    }

    return events;
  }


}