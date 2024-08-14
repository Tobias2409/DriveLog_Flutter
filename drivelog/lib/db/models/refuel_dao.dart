class RefuelDAO {
  int id;
  double fuelAmount;
  double? distance;
  int carFK;
  DateTime dateAdded;

  RefuelDAO({
    this.id = 0,
    required this.fuelAmount,
    this.distance,
    required this.carFK,
    DateTime? dateAdded,
  }) : dateAdded = dateAdded ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      if (id != 0) "ID": id,
      "FuelAmount": fuelAmount,
      "Distance": distance,
      "CarFK": carFK,
      "DateAdded": dateAdded.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'RefuelDAO{'
        'id: $id, '
        'fuelAmount: $fuelAmount, '
        'distance: $distance, '
        'carFK: $carFK, '
        'dateAdded: $dateAdded, '
        '}';
  }
}
