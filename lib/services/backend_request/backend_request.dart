import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:http/http.dart' as http;
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:ntisa_burgers/model/error_model.dart';

class BackendRequest {
  static String? baseUrl = 'https://app.acres.pro/api/gatepass';

  static String? bearerToken;

  static final NetworkError _connectionError = NetworkError(
      {'message': 'Request not sent. Check your internet connection'});

  static Future<Either<ErrorModel, List<ProductModel>>> getData(
      String email, String password) async {
    try {
      http.Response response;
      Uri url = Uri.parse('$baseUrl/auth');
      response = await http.get(url);

      /// convert the string to a json map
      List result = jsonDecode(response.body);

      /// check if the request returned an error
      if (response.statusCode != 200) {
        return Left(RequestError(jsonDecode(response.body)));
      }

      List<ProductModel> resultModels =
          result.map((e) => ProductModel.fromMap(e)).toList();

      return Right(resultModels);
    } catch (e) {
      return Left(_connectionError);
    }
  }
}
