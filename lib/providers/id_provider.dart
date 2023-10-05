import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IdProvider with ChangeNotifier {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  static String _custId = "";
  late String docId;
  String get getData {
    return _custId;
  }

  setCustId(User user) async {
    final SharedPreferences pref = await _prefs;
    pref.setString('custid', user.uid).whenComplete(() => _custId = user.uid);
    notifyListeners();
  }

  clearCustId() async {
    final SharedPreferences pref = await _prefs;
    pref.setString('custid', '').whenComplete(() => _custId = '');
    notifyListeners();
  }

  Future<String> getDocumentId() {
    return _prefs.then((SharedPreferences prefs) {
      return prefs.getString('custid') ?? '';
    });
  }

  getDocId() async {
    await getDocumentId().then((value) => _custId = value);
    notifyListeners();
  }
}
