class TripDAO {
  int id;
  double distance;
  double? fuelConsumption;
  int carFK;

  TripDAO({
    this.id = 0,
    required this.distance,
    this.fuelConsumption,
    required this.carFK,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != 0) "ID": id,
      "Distance": distance,
      "FuelConsumption": fuelConsumption,
      "CarFK": carFK,
    };
  }

  @override
  String toString() {
    return 'TripDAO{'
        'id: $id, '
        'distance: $distance, '
        'fuelConsumption: $fuelConsumption, '
        'carFK: $carFK, '
        '}';
  }
}
