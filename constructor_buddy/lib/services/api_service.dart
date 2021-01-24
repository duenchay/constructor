import 'dart:convert';

// import 'package:flutter_restapi/models/cases.dart';
import 'package:constructor_buddy/model/cases.dart';
import 'package:http/http.dart';

class ApiService {
  final String apiUrl = "https://constructor.pythonanywhere.com/api/Product/";

  Future<List<Cases>> getCases() async {
    Response res = await get(apiUrl);

    if (res.statusCode == 200) {
      List<dynamic> body = jsonDecode(res.body);
      List<Cases> cases = body.map((dynamic item) => Cases.fromJson(item)).toList();
      return cases;
    } else {
      throw "Failed to load cases list";
    }
  }

  Future<Cases> getCaseById(String id) async {
    final response = await get('$apiUrl/$id');

    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load a case');
    }
  }

  Future<Cases> createCase(Cases cases) async {
    Map data = {
      'id': cases.id,
      'product_name': cases.product_name,
      'product_price': cases.product_price,
      'product_detail': cases.product_detail,
      'product_img': cases.product_img,
      'product_amount': cases.product_amount,
      'product_type': cases.product_type,
      'product_status': cases.product_status
    };

    final Response response = await post(
      apiUrl,
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to post cases');
    }
  }
 
  Future<Cases> updateCases(String id, Cases cases) async {
    Map data = {
      'id': cases.id,
      'product_name': cases.product_name,
      'product_price': cases.product_price,
      'product_detail': cases.product_detail,
      'product_img': cases.product_img,
      'product_amount': cases.product_amount,
      'product_type': cases.product_type,
      'product_status': cases.product_status
    };

    final Response response = await put(
      '$apiUrl/$id',
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(data),
    );
    if (response.statusCode == 200) {
      return Cases.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to update a case');
    }
  }

  Future<void> deleteCase(String id) async {
    Response res = await delete('$apiUrl/$id');

    if (res.statusCode == 200) {
      print("Case deleted");
    } else {
      throw "Failed to delete a case.";
    }
  }

}
