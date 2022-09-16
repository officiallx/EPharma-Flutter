import 'package:json_annotation/json_annotation.dart';
import 'package:medicine/Model/response/data_response.dart';

part 'order_response.g.dart';

@JsonSerializable()
class OrdersResponse {
  List<Data>? data;
  bool? succeeded;

  OrdersResponse({this.data, this.succeeded});

  OrdersResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
    succeeded = json['succeeded'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['succeeded'] = succeeded;
    return data;
  }
}
