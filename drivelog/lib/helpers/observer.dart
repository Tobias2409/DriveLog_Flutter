class Observer {
  final Function() _callback;

  Observer(this._callback);

  void notify(){
    _callback();
  }
}