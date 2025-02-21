import 'package:flutter/material.dart';
import 'package:platzi_store/data/model/product_model.dart';
import 'package:platzi_store/data/service/api_service.dart';

class CreateProductProvider extends ChangeNotifier {
  ProductModel? responseCreateProduct;
  bool isLoading = false;
  String errorMessage = '';

  Future<void> addProduct(String title, int price, String desc, int categoryId,
      String images) async {
    isLoading = true;
    notifyListeners();

    var res = await ApiService()
        .createNewProduct(title, price, desc, categoryId, images);

    if (res.isRight) {
      responseCreateProduct = res.right;
    } else {
      errorMessage = res.left;
    }

    isLoading = false;
    notifyListeners();
  }
}
