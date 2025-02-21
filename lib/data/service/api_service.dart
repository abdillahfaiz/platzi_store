import 'package:dio/dio.dart';
import 'package:either_dart/either.dart';
import 'package:platzi_store/data/model/login_model.dart';
import 'package:platzi_store/data/model/product_model.dart';

class ApiService {
  final dio = Dio(BaseOptions(baseUrl: 'https://api.escuelajs.co/api/v1'));

  Future<Either<String, List<ProductModel>>> getAllProduct() async {
    try {
      var response = await dio.get('/products');

      var resData = response.data as List;

      return Right(
        resData
            .map((itemProductPerIndex) =>
                ProductModel.fromJson(itemProductPerIndex))
            .toList(),
      );
    } on DioException catch (e) {
      if (e.response != null) {
        //! Handle error response from backend
        return Left('Tidak dapat mengambil data');
      } else {
        //! Handle error unhandle or Handle undefine error from backend
        return Left('Terjadi Kesalahan : $e');
      }
    }
    // try {
    //   var res = await dio.get('$baseUrl/products');

    //   List resData = res.data;

    //   return Right(
    //       resData.map((index) => ProductModel.fromJson(index)).toList());
    // } on DioException catch (e) {
    //   if (e.response != null) {
    //     return Left(e.response?.data['message']);
    //   } else {
    //     return Left('Terjadi Kesalahan : $e');
    //   }
    // }
  }

  Future<Either<String, ProductModel>> getDetailProduct(int id) async {
    try {
      var res = await dio.get('/products/$id');

      var resData = res.data;

      return Right(ProductModel.fromJson(resData));
    } on DioException catch (e) {
      if (e.response != null) {
        return Left(e.response?.data['message']);
      } else {
        return Left('Terjadi Kesalahan : $e');
      }
    }
  }

  Future<Either<String, ProductModel>> createNewProduct(String title, int price,
      String desc, int categoryId, String images) async {
    try {
      var response = await dio.post(
        '/products/',
        data: {
          "title": title,
          "price": price,
          "description": desc,
          "categoryId": categoryId,
          "images": [images]
        },
      );

      return Right(ProductModel.fromJson(response.data));
    } on DioException catch (e) {
      //! error response dari BE
      // {
      //   'message' : 'Nama terlalu pende';
      // }

      if (e.response != null) {
        return Left(e.response?.data['message']);
      } else {
        return Left('Terjadi Kesalahan : $e');
      }
    }
  }

  Future<Either<String, LoginModel>> login(
      String email, String password) async {
    try {
      var response = await dio.post('/auth/login', data: {
        "email": email,
        "password": password,
      });

      return Right(LoginModel.fromJson(response.data));
      
    } on DioException catch (e) {
      if (e.response != null) {
        return Left("Email atau Password salah");
      } else {
        return Left('Terjadi Kesalahan : $e');
      }
    }
  }
}
