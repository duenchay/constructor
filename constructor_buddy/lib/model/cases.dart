// import 'package:flutter/foundation.dart';

// import 'package:flutter/cupertino.dart';

class Cases { 
  final String id;
  // ignore: non_constant_identifier_names
  final String product_name;
  // ignore: non_constant_identifier_names
  final double product_price;
  // ignore: non_constant_identifier_names
  final String product_detail;

  // ignore: non_constant_identifier_names
  final String product_img;
  // ignore: non_constant_identifier_names
  final int product_amount;
  // ignore: non_constant_identifier_names
  final String product_type;
  // ignore: non_constant_identifier_names
  final String product_status;

  // ignore: non_constant_identifier_names
  Cases({ this.id, this.product_name, this.product_price, this.product_detail, this.product_img, this.product_amount, this.product_type, this.product_status});

  factory Cases.fromJson(Map<String, dynamic> json) {
    return Cases(
      id: json['_id'] as String,
      product_name: json['product_name'] as String,
      product_price: json['product_price'] as double,
      product_detail: json['product_detail'] as String,
      product_img: json['product_img'] as String,
      product_amount: json['product_amount'] as int,
      product_type: json['product_type'] as String,
      product_status: json['product_status'] as String
      // status: json['status'] as String,
      // updated: json['updated'] as String,
    );
  }

  @override
  String toString() {
    return 'Trans{id: $id, product_name: $product_name, product_detail: $product_detail}';
  }
}