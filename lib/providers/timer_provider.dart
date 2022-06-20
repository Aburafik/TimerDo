import 'package:flutter/cupertino.dart';

class Timer extends ChangeNotifier {
  int _initialTimer = 0;

  get initiaTimer => _initialTimer;

  setInCreasetimer() {
    _initialTimer++;

    notifyListeners();
  }

  setDecreasetimer() {
    if (_initialTimer != 0) {
      _initialTimer--;
    }

    notifyListeners();
  }
}
