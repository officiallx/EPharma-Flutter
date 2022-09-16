import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:medicine/Base/base_uri.dart';

import '../Model/response/order_response.dart';

part 'order_service.g.dart';

@RestApi(baseUrl: BaseUrl.uri)
abstract class OrderService {
  factory OrderService(Dio dio, {String baseUrl}) = _OrderService;

  @GET('api/Medicine/GetAllUserOrder')
  Future<OrdersResponse> getAllOrders();
}
