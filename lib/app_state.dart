import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _user = prefs.getString('ff_user') ?? _user;
    });
    _safeInit(() {
      _password = prefs.getString('ff_password') ?? _password;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

  String _user = '';
  String get user => _user;
  set user(String value) {
    _user = value;
    prefs.setString('ff_user', value);
  }

  String _password = '';
  String get password => _password;
  set password(String value) {
    _password = value;
    prefs.setString('ff_password', value);
  }

  bool _HideValues = false;
  bool get HideValues => _HideValues;
  set HideValues(bool value) {
    _HideValues = value;
  }
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
