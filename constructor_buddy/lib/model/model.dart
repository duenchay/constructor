// import 'dart:ffi';

// import 'package:flutter/cupertino.dart';

class User {
  String username;
  String email;
  String password;
  String role;

  User(
    this.username, 
    this.email, 
    this.password, 
    this.role, 
    );

  factory User.fromMap(Map<String, dynamic> json) {
    // ignore: unnecessary_brace_in_string_interps
    print('User.fromJson("${json}")');
    return User(
      json['username'], 
      json['email'], 
      json['password'],
      json['role'], 
      );
  }

  String toString() {
    return '${this.username} โทรศัพท์: ${this.email} ที่อยู่ ${this.password}';
  }
}

class Product {
  // ignore: non_constant_identifier_names
  String product_name;
  // ignore: non_constant_identifier_names
  double product_price;
  // ignore: non_constant_identifier_names
  String product_detail;
  // ignore: non_constant_identifier_names
  String product_img;
  // ignore: non_constant_identifier_names
  int product_amount;
  // ignore: non_constant_identifier_names
  Product_Type product_type;
  // ignore: non_constant_identifier_names
  // String product_status;

  Product(
    this.product_name, 
    this.product_price, 
    this.product_detail, 
    this.product_img, 
    this.product_amount,
    this.product_type,
    // this.product_status,

    );

  factory Product.fromMap(Map<String, dynamic> json) {
    // print('Product.fromJson("$json")');
    return Product(
      json['product_name'], 
      json['product_price'], 
      json['product_detail'],
      json['product_img'], 
      json['product_amount'], 
      Product_Type.fromMap(json['product_type']),
      // json['product_status'], 

      );
  }

  String toString() {
    return '${this.product_name}  รายละเอียด ${this.product_detail} ${this.product_type}';
  }
}

// ignore: camel_case_types
class Product_Type {
  // ignore: non_constant_identifier_names
  String product_type;

  Product_Type(
    this.product_type
    );

  factory Product_Type.fromMap(Map<String, dynamic> json) {
    // print('Product.fromJson("$json")');
    return Product_Type(
      json['product_type'], 
    

      );
  }

  String toString() {
    return '${this.product_type} ';
  }
}


class Mechanic {
  // ignore: non_constant_identifier_names
  String mechanic_fname;
  // ignore: non_constant_identifier_names
  String mechanic_lname;
  // ignore: non_constant_identifier_names
  String mechanic_phone;
  // ignore: non_constant_identifier_names
  String mechanic_email;
  // ignore: non_constant_identifier_names
  String avatar;
  // ignore: non_constant_identifier_names
  String mechanic_img;
  // ignore: non_constant_identifier_names
  // String product_status;
  // ignore: non_constant_identifier_names
  String mechanic_detail;
  // ignore: non_constant_identifier_names
  Mechanic_Type mechanic_type;

  Mechanic(
    this.mechanic_fname, 
    this.mechanic_lname, 
    this.mechanic_phone, 
    this.mechanic_email, 
    this.avatar,
    this.mechanic_img,
    this.mechanic_detail,
    this.mechanic_type,

    );

  factory Mechanic.fromMap(Map<String, dynamic> json) {
    // print('Product.fromJson("$json")');
    return Mechanic(
      json['mechanic_fname'], 
      json['mechanic_lname'], 
      json['mechanic_phone'],
      json['mechanic_email'], 
      json['avatar'], 
      json['mechanic_img'],
      json['mechanic_detail'],
      Mechanic_Type.fromMap(json['mechanic_type']),
      // json['product_status'], 

      );
  }

  String toString() {
    return '${this.mechanic_fname} ';
  }
}


// ignore: camel_case_types
class Mechanic_Type {
  // ignore: non_constant_identifier_names
  String mechanic_type;

  Mechanic_Type(
    this.mechanic_type
    );

  factory Mechanic_Type.fromMap(Map<String, dynamic> json) {
    // print('Product.fromJson("$json")');
    return Mechanic_Type(
      json['mechanic_type'], 
    

      );
  }

  String toString() {
    return '${this.mechanic_type} ';
  }
}