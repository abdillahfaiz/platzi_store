import 'package:flutter/material.dart';
import 'package:platzi_store/data/model/login_model.dart';
import 'package:platzi_store/data/service/api_service.dart';
import 'package:platzi_store/data/service/local_storage.dart';

class LoginProvider extends ChangeNotifier {
  LoginModel? responseSuccesLogin;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> doLogin(String email, String password) async {
    isLoading = true;
    notifyListeners();

    var resData = await ApiService().login(email, password);

    if (resData.isRight) {
      responseSuccesLogin = resData.right;
      await LocalStorage().saveToken(resData.right.accesToken ?? '');
    } else {
      errorMessage = resData.left;
    }

    isLoading = false;
    notifyListeners();
  }
}
