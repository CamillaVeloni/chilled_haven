import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../models/result_cep.dart';
import 'api_constants.dart';

part 'via_cep_client.g.dart';

@RestApi()
abstract class ViaCepClient {
  factory ViaCepClient(Dio dio, {String baseUrl}) = _ViaCepClient;

  @GET(Constants.viaCepUrl)
  Future<ResultCep> getUserCep(@Path("cep") String cep,);

}