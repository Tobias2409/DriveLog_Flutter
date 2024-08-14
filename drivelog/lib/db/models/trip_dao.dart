class TripDAO {
  int id;
  double distance;
  double? fuelConsumption;
  int carFK;
  DateTime dateAdded;

  TripDAO({
    this.id = 0,
    required this.distance,
    this.fuelConsumption,
    required this.carFK,
    DateTime? dateAdded,
  }) : dateAdded = dateAdded ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      if (id != 0) "ID": id,
      "Distance": distance,
      "FuelConsumption": fuelConsumption,
      "CarFK": carFK,
      "DateAdded": dateAdded.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'TripDAO{'
        'id: $id, '
        'distance: $distance, '
        'fuelConsumption: $fuelConsumption, '
        'carFK: $carFK, '
        'dateAdded: $dateAdded, '
      '}';
  }
}
