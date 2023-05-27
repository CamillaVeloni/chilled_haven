import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import 'api_constants.dart';
import '../models/product_rest_model.dart';
import '../models/user_rest_model.dart';

part 'rest_client.g.dart';

@RestApi(baseUrl: Constants.baseUrl)
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @POST(Constants.registrationUrl)
  Future<void> registrationUser(@Body() UserRestModel user);

  @POST(Constants.loginUrl)
  Future<String> loginUser(@Body() Map<String, String> login);

  @GET(Constants.userUrl)
  Future<UserRestModel> getUser();

  @GET(Constants.productsUrl)
  Future<List<ProductRestModel>> getAllProducts(@Query("isHotSale") bool? isHotSale, @Query("category") String? category);
}