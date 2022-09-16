import 'package:dio/dio.dart';
import 'package:medicine/Model/response/message.dart';
import 'package:retrofit/http.dart';
import 'package:medicine/Base/base_uri.dart';

part 'login_service.g.dart';

@RestApi(baseUrl: BaseUrl.uri)
abstract class LoginService {
  factory LoginService(Dio dio, {String baseUrl}) = _LoginService;

  @GET('api/Medicine/StaffLogin')
  Future<Message> doLogin(
      @Query('UserName') String username, @Query('Password') String password);
}
