import 'package:dio/dio.dart';
import 'package:pasto_hoy/data/remote/dtos/credential_dto.dart';
import 'package:pasto_hoy/data/remote/dtos/user_dto.dart';
import 'package:retrofit/http.dart';

import '../dtos/token_dto.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/auth/login")
  Future<TokenDto> login(@Body() CredentialDto credentials);

  @POST("/auth/signin")
  Future<TokenDto> signIn(@Body() UserDto user);
}