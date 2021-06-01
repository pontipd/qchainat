import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../models/patient.dart';

class AppProvider extends ChangeNotifier {
  /// Internal, private state of the cart.
  bool _isLoggedIn = false;
  Patient _patient;
  User _user;
  bool isTouchID = false;

  AppProvider() {
    init();
  }

  Future<void> init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isTouchID = prefs.getBool('openTouchID') ?? false;
  }

  void setCurrentUser(User user) {
    _user = user;
    notifyListeners();
  }

  void setPatient(Patient patient) {
    _patient = patient;
    notifyListeners();
  }

  void setLoginState(bool isLoggedIn) {
    _isLoggedIn = isLoggedIn;
  }

  Patient get patientInfo => _patient;
  User get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  // void init() {
  //   FirebaseAuth.instance.authStateChanges().listen((User user) {
  //     if (user == null) {
  //       print('User is currently signed out!');
  //     } else {
  //       print('User is signed in!');
  //     }
  //   });
  // }

  // /// The current total price of all items (assuming all items cost $42).
  // int get totalPrice => _items.length * 42;

  // /// Adds [item] to cart. This and [removeAll] are the only ways to modify the
  // /// cart from the outside.
  // void add(Item item) {
  //   _items.add(item);
  //   // This call tells the widgets that are listening to this model to rebuild.
  //   notifyListeners();
  // }

  // /// Removes all items from the cart.
  // void removeAll() {
  //   _items.clear();
  //   // This call tells the widgets that are listening to this model to rebuild.
  //   notifyListeners();
  // }

  void openTouchID(bool isOpen) async {
    isTouchID = isOpen;
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('openTouchID', isOpen);
    notifyListeners();
  }
}
