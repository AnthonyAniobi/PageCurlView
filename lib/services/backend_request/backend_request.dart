import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:ntisa_burgers/model/product_model.dart';
import 'package:ntisa_burgers/model/error_model.dart';

class BackendRequest {
  static String baseUrl = dotenv.env['BASE_URL'].toString();

  static String? bearerToken;

  static final NetworkError _connectionError = NetworkError(
      {'message': 'Request not sent. Check your internet connection'});

  static Future<Either<ErrorModel, List<ProductModel>>> getData() async {
    try {
      http.Response response;
      Uri url = Uri.parse(baseUrl);
      response = await http.get(url);

      /// convert the string to a json map
      List result;

      /// check if the request returned an error
      if (response.statusCode != 200) {
        Map message = jsonDecode(response.body);
        if (message.isEmpty) {
          message = {'message': '${response.statusCode} error occured'};
        }
        return Left(RequestError(message));
      } else {
        result = jsonDecode(response.body);
      }

      List<ProductModel> resultModels =
          result.map((e) => ProductModel.fromMap(e)).toList();

      return Right(resultModels);
    } catch (e) {
      return Left(_connectionError);
    }
  }
}
