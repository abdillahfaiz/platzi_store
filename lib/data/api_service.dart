import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:platzi_store/data/model/product_model.dart';

class ApiService {
  static const String baseUrl = 'https://api.escuelajs.co/api/v1';

  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    try {
      var response = await http.get(Uri.parse('$baseUrl/products'));

      var data = jsonDecode(response.body) as List<dynamic>;

      if (response.statusCode == 200) {
        return Right(
            data.map((index) => ProductModel.fromJson(index)).toList());
      } else {
        return Left('Gagal Mendapatkan Data');
      }
    } catch (e) {
      return Left('Terjadi Kesalahan, Error : ${e.toString()}');
    }
  }
}
