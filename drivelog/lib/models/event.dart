
class Event{

  Event(this.eventType, this.dateAdded, this.distance, this.fuelConsumption);

  EventType eventType;
  DateTime dateAdded;
  double? distance;
  double? fuelConsumption;
}

enum EventType{
  refuel,
  trip,
}