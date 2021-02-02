import 'dart:async';
// import 'package:constructor_buddy/src/brand_model.dart';
// import 'package:constructor_buddy/src/home_item_model.dart';
// import 'package:constructor_buddy/src/item_model.dart';
import 'package:rxdart/rxdart.dart';
class ProductTypeModel {
  int id;
  String image;
  String name;
  // String type;

  ProductTypeModel({
    this.id,
    this.image,
    this.name,
    // this.type,
  });
}

class ItemModel {
  int id;
  String image;
  String companyImage;
  String name;
  String type;
  int price;

  ItemModel({
    this.id,
    this.image,
    this.companyImage,
    this.name,
    this.type,
    this.price,
  });
}


class HomeItemModel {
  // List<ItemModel> justDropped;
  // List<ItemModel> mostPopular;
  List<ItemModel> recommended;
  // List<ItemModel> newLowest;
  List<ItemModel> newHighest;
  List<ProductTypeModel> productType;

  HomeItemModel({
    // this.justDropped,
    // this.mostPopular,
    this.recommended,
    // this.newLowest,
    this.newHighest,
    this.productType,
  });
}
 

class HomeBloc {
 
  List<ItemModel> _recommended = [
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
  ];
  
  List<ItemModel> _newHighest = [
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
    ItemModel(
      id: 0,
      image: "assets/img/j_nike.png",
      companyImage: "assets/images/nike.svg",
      name: "Nike ISPA Overreact Sail Multi",
      type: "Lowest Ask",
      price: 233,
    ),
    ItemModel(
      id: 1,
      image: "assets/img/j_adidas.png",
      companyImage: "assets/images/adidas.svg",
      name: "adidas Yeezy Boost 700 MNVN Bone",
      type: "Lowest Ask",
      price: 373,
    ),
    ItemModel(
      id: 3,
      image: "assets/img/j_jordan.png",
      companyImage: "assets/images/jordan.svg",
      name: "Jordan 11 Retro Low White Concord (W)",
      type: "Lowest Ask",
      price: 194,
    ),
  ];
 
  List<ProductTypeModel> _productType = [
    ProductTypeModel(
      image: "assets/images/a1.svg",
      name: "เครื่องมือช่าง"
      // type: "All 601",
    ),
    ProductTypeModel(
      image: "assets/images/a2.svg",
      name: "วัสดุเทพื้น",
      // type: "All 601",
    ),
     ProductTypeModel(
      image: "assets/images/a3.svg",
      name: "ปูน",
      // type: "All 601",
    ),
    ProductTypeModel(
      image: "assets/images/a4.svg",
      name: "ท่อ",
      // type: "All 601",
    ),
    ProductTypeModel(
      image: "assets/images/a5.svg",
      name: "เสา",
      // type: "All 601",
    ),
    ProductTypeModel(
      image: "assets/images/a6.svg",
      name: "อิฐ",
      // type: "All 601",
    ),
  ];

  final _homeFetcher = PublishSubject<HomeItemModel>();

  Observable<HomeItemModel> get allHome => _homeFetcher.stream;

  fetchAllHome() async {
    Timer(Duration(seconds: 1), () {
      _homeFetcher.sink.add(HomeItemModel(
        // justDropped: _justDropped,
        // mostPopular: _mostPopular,
        recommended: _recommended,
        // newLowest: _newLowest,
        newHighest: _newHighest,
        productType: _productType,
      ));
    });
  }

  dispose() {
    _homeFetcher.close();
  }
}

HomeBloc homeBloc = HomeBloc();
