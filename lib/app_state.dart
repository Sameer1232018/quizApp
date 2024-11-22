import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  int _totalScore = 0;
  int get totalScore => _totalScore;
  set totalScore(int value) {
    _totalScore = value;
  }

  int _adsProgress = 0;
  int get adsProgress => _adsProgress;
  set adsProgress(int value) {
    _adsProgress = value;
  }

  int _coinsApp = 0;
  int get coinsApp => _coinsApp;
  set coinsApp(int value) {
    _coinsApp = value;
  }

  int _Rank = 0;
  int get Rank => _Rank;
  set Rank(int value) {
    _Rank = value;
  }
}
