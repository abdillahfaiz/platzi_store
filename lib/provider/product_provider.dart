import 'package:flutter/material.dart';
import 'package:platzi_store/data/model/product_model.dart';

import '../data/service/api_service.dart';

class ProductProvider extends ChangeNotifier {
  List<ProductModel> data = []; // handle state getProductsData
  bool isLoading = false;
  String errorMessage = '';

  Future<void> getProducts() async {
    isLoading = true;
    notifyListeners();

    var either = await ApiService().getAllProduct();

    if (either.isRight) {
      data = either.right;
    } else {
      errorMessage = either.left;
    }

    isLoading = false;
    notifyListeners();
  }

}
