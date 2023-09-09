import 'package:dio/dio.dart';
import 'package:pasto_hoy/data/remote/dto/credential_dto.dart';
import 'package:pasto_hoy/data/remote/dto/user_dto.dart';
import 'package:retrofit/http.dart';

import '../dto/token_dto.dart';

part 'auth_api.g.dart';

@RestApi()
abstract class AuthApi {
  factory AuthApi(Dio dio, {String baseUrl}) = _AuthApi;

  @POST("/auth/login")
  Future<TokenDto> login(@Body() CredentialDto credential);

  @POST("/auth/signIn")
  Future<TokenDto> signIn(@Body() UserDto user);
}