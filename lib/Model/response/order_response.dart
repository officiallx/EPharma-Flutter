import 'package:json_annotation/json_annotation.dart';

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

class Data {
  String? name;
  String? imagePath;
  String? billingAddress;
  String? phoneNumber;
  int? quantity;
  int? availableQuantity;
  int? price;
  int? id;
  int? productId;
  String? userId;
  String? remarks;
  String? productName;
  int? isApproved;
  int? isDelivered;
  int? approveStatus;
  int? deliveredStatus;
  int? sn;

  Data(
      {this.name,
      this.imagePath,
      this.billingAddress,
      this.phoneNumber,
      this.quantity,
      this.availableQuantity,
      this.price,
      this.id,
      this.productId,
      this.userId,
      this.remarks,
      this.productName,
      this.isApproved,
      this.isDelivered,
      this.approveStatus,
      this.deliveredStatus,
      this.sn});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    imagePath = json['imagePath'];
    billingAddress = json['billingAddress'];
    phoneNumber = json['phoneNumber'];
    quantity = json['quantity'];
    availableQuantity = json['availableQuantity'];
    price = json['price'];
    id = json['id'];
    productId = json['productId'];
    userId = json['userId'];
    remarks = json['remarks'];
    productName = json['productName'];
    isApproved = json['isApproved'];
    isDelivered = json['isDelivered'];
    approveStatus = json['approveStatus'];
    deliveredStatus = json['deliveredStatus'];
    sn = json['sn'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['imagePath'] = imagePath;
    data['billingAddress'] = billingAddress;
    data['phoneNumber'] = phoneNumber;
    data['quantity'] = quantity;
    data['availableQuantity'] = availableQuantity;
    data['price'] = price;
    data['id'] = id;
    data['productId'] = productId;
    data['userId'] = userId;
    data['remarks'] = remarks;
    data['productName'] = productName;
    data['isApproved'] = isApproved;
    data['isDelivered'] = isDelivered;
    data['approveStatus'] = approveStatus;
    data['deliveredStatus'] = deliveredStatus;
    data['sn'] = sn;
    return data;
  }
}
