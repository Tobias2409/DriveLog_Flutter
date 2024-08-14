
import 'package:flutter/cupertino.dart';

import 'observer.dart';

class Observable {

  final List<Observer> _observers = [];

  void subscribe(Observer observer) {
    _observers.add(observer);
  }

  void unsubscribe(Observer observer) {
    _observers.remove(observer);
  }


  @protected
  void notify() {
    for (Observer observer in _observers) {
      observer.notify();
    }
  }
}