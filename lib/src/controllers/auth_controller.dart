import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../enum/enum.dart';

class AuthController with ChangeNotifier {
  static void initialize() {
    GetIt.instance.registerSingleton<AuthController>(AuthController());
  }

  static AuthController get instance => GetIt.instance<AuthController>();

  static AuthController get I => GetIt.instance<AuthController>();

  AuthState state = AuthState.unauthenticated;
  SimulatedAPI api = SimulatedAPI();

  login(String userName, String password) async {
    bool isLoggedIn = await api.login(userName, password);
    if (isLoggedIn) {
      state = AuthState.authenticated;
      notifyListeners();
    }
  }
}

class SimulatedAPI {
  Map<String, String> users = {"testUser": "123456789ABCabc!"};

  Future<bool> login(String userName, String password) async {
    await Future.delayed(const Duration(seconds: 4));
    if (users[userName] == null) throw Exception("User does not exist");
    return users[userName] == password;
  }
}
