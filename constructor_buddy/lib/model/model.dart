// import 'dart:ffi';

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
  String product_type;
  // ignore: non_constant_identifier_names
  String product_status;

  Product(
    this.product_name, 
    this.product_price, 
    this.product_detail, 
    this.product_img, 
    this.product_amount,
    this.product_type,
    this.product_status,

    );

  factory Product.fromMap(Map<String, dynamic> json) {
    // print('Product.fromJson("$json")');
    return Product(
      json['product_name'], 
      json['product_price'], 
      json['product_detail'],
      json['product_img'], 
      json['product_amount'], 
      json['product.type'],
      json['product_status'], 

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