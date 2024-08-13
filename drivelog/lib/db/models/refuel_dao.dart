class RefuelDAO {
  int id;
  double fuelAmount;
  double? distance;
  int carFK;

  RefuelDAO({
    this.id = 0,
    required this.fuelAmount,
    this.distance,
    required this.carFK,
  });

  Map<String, dynamic> toMap() {
    return {
      if (id != 0) "ID": id,
      "FuelAmount": fuelAmount,
      "Distance": distance,
      "CarFK": carFK,
    };
  }

  @override
  String toString() {
    return 'RefuelDAO{'
        'id: $id, '
        'fuelAmount: $fuelAmount, '
        'distance: $distance, '
        'carFK: $carFK, '
        '}';
  }
}
