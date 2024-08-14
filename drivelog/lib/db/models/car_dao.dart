class CarDAO {
  int id;
  String name;
  String image;
  String? manufacturer;
  String? model;
  int? year;
  String? engineType;
  String? transmissionType;
  String? fuelType;
  double? mileage;
  String? color;
  double? price;
  String? vin;
  int? numberOfDoors;
  int? seatingCapacity;
  int? horsepower;
  double? torque;
  String? driveType;
  double? safetyRating;
  String? features;
  String? description;
  DateTime dateAdded;

  CarDAO({
    this.id = 0,
    required this.name,
    required this.image,
    this.manufacturer,
    this.model,
    this.year,
    this.engineType,
    this.transmissionType,
    this.fuelType,
    this.mileage,
    this.color,
    this.price,
    this.vin,
    this.numberOfDoors,
    this.seatingCapacity,
    this.horsepower,
    this.torque,
    this.driveType,
    this.safetyRating,
    this.features,
    this.description,
    DateTime? dateAdded,
  }) : dateAdded = dateAdded ?? DateTime.now();

  Map<String, dynamic> toMap() {
    return {
      if (id != 0) "ID": id,
      "Name": name,
      "Image": image,
      "Manufacturer": manufacturer,
      "Model": model,
      "Year": year,
      "EngineType": engineType,
      "TransmissionType": transmissionType,
      "FuelType": fuelType,
      "Mileage": mileage,
      "Color": color,
      "Price": price,
      "VIN": vin,
      "NumberOfDoors": numberOfDoors,
      "SeatingCapacity": seatingCapacity,
      "Horsepower": horsepower,
      "Torque": torque,
      "DriveType": driveType,
      "SafetyRating": safetyRating,
      "Features": features,
      "Description": description,
      "DateAdded": dateAdded.toIso8601String(),
    };
  }

  factory CarDAO.fromMap(Map<String, dynamic> map) {
    return CarDAO(
      id: map['ID'] ?? 0,
      name: map['Name'] ?? '',
      image: map['Image'] ?? '',
      manufacturer: map['Manufacturer'],
      model: map['Model'],
      year: map['Year'],
      engineType: map['EngineType'],
      transmissionType: map['TransmissionType'],
      fuelType: map['FuelType'],
      mileage: map['Mileage']?.toDouble(),
      color: map['Color'],
      price: map['Price']?.toDouble(),
      vin: map['VIN'],
      numberOfDoors: map['NumberOfDoors'],
      seatingCapacity: map['SeatingCapacity'],
      horsepower: map['Horsepower'],
      torque: map['Torque']?.toDouble(),
      driveType: map['DriveType'],
      safetyRating: map['SafetyRating']?.toDouble(),
      features: map['Features'],
      description: map['Description'],
      dateAdded: DateTime.parse(map['DateAdded']),
    );
  }

  @override
  String toString() {
    return 'CarDAO{'
        'id: $id, '
        'name: $name, '
        'image: $image, '
        'manufacturer: $manufacturer, '
        'model: $model, '
        'year: $year, '
        'engineType: $engineType, '
        'transmissionType: $transmissionType, '
        'fuelType: $fuelType, '
        'mileage: $mileage, '
        'color: $color, '
        'price: $price, '
        'vin: $vin, '
        'numberOfDoors: $numberOfDoors, '
        'seatingCapacity: $seatingCapacity, '
        'horsepower: $horsepower, '
        'torque: $torque, '
        'driveType: $driveType, '
        'safetyRating: $safetyRating, '
        'features: $features, '
        'description: $description, '
        'dateAdded: $dateAdded, '
        '}';
  }
}
