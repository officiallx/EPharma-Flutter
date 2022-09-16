// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      name: json['name'] as String?,
      imagePath: json['imagePath'] as String?,
      billingAddress: json['billingAddress'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      quantity: json['quantity'] as int?,
      availableQuantity: json['availableQuantity'] as int?,
      price: json['price'] as int?,
      id: json['id'] as int?,
      productId: json['productId'] as int?,
      userId: json['userId'] as String?,
      remarks: json['remarks'] as String?,
      productName: json['productName'] as String?,
      isApproved: json['isApproved'] as int?,
      isDelivered: json['isDelivered'] as int?,
      approveStatus: json['approveStatus'] as int?,
      deliveredStatus: json['deliveredStatus'] as int?,
      sn: json['sn'] as int?,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'name': instance.name,
      'imagePath': instance.imagePath,
      'billingAddress': instance.billingAddress,
      'phoneNumber': instance.phoneNumber,
      'quantity': instance.quantity,
      'availableQuantity': instance.availableQuantity,
      'price': instance.price,
      'id': instance.id,
      'productId': instance.productId,
      'userId': instance.userId,
      'remarks': instance.remarks,
      'productName': instance.productName,
      'isApproved': instance.isApproved,
      'isDelivered': instance.isDelivered,
      'approveStatus': instance.approveStatus,
      'deliveredStatus': instance.deliveredStatus,
      'sn': instance.sn,
    };
