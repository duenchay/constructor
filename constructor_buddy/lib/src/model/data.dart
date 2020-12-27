import 'package:constructor_buddy/src/model/category.dart';
import 'package:constructor_buddy/src/model/product.dart';
// import 'package:flutter_ecommerce_app/src/model/category.dart';
// import 'package:flutter_ecommerce_app/src/model/product.dart';

class AppData {
  static List<Product> productList = [
    Product(
        id: 1,
        name: 'สกรูดำ C&T 1 THE TREE',
        price: 59.00,
        isSelected: true, 
        isliked: false,
        image: 'assets/1.jpeg',
        category: ""),
    Product(
        id: 2,
        name: 'ปูนแดง ปอร์ตแลนด์ DURAONE',
        price: 150.00,
        isliked: false,
        image: 'assets/2.jpeg',
        category: ""),
    Product(
        id: 3,
        name: 'น๊อตตัวเมีย PAN SIAM',
        price: 30.00,
        isliked: false,
        image: 'assets/3.jpeg',
        category: ""),
  ];
  static List<Product> cartList = [
    Product(
        id: 1,
        name: 'สกรูดำ C&T 1 THE TREE',
        price: 59.00,
        isSelected: true,
        isliked: false,
        image: 'assets/1.jpeg',
        category: ""),
    Product(
        id: 2,
        name: 'ปูนแดง ปอร์ตแลนด์ DURAONE',
        price: 190.00,
        isliked: false,
        image: 'assets/2.jpeg',
        category: ""),
    Product(
        id: 1,
        name: 'น๊อตตัวเมีย PAN SIAM ',
        price: 30.00,
        isliked: false,
        image: 'assets/3.jpeg',
        category: ""),
    Product(
        id: 2,
        name: 'คีมล๊อคปากตรง GIANT KINGKONG PRO',
        price: 199.00,
        isSelected: true,
        isliked: false,
        image: 'assets/4.jpeg',
        category: ""),
    // Product(
    //     id:1,
    //     name: 'Nike Air Max 97',
    //     price: 190.00,
    //     isliked: false,
    //     image: 'assets/small_tilt_shoe_2.png',
    //     category: "Trending Now"),
  ];
  static List<Category> categoryList = [
    Category(),
    // Category(
    //     id: 1,
    //     name: "เครื่องมือไฟฟ้า",
    //     image: 'assets/shoe_thumb_2.png',
    //     isSelected: true),
    Category(id: 1, name: "เครื่องมือช่าง", image: 'assets/settings.png' , isSelected: true),
    Category(id: 2, name: "อุปกรณ์ยึดติด", image: 'assets/nails.png'),
    Category(id: 3, name: "เคมีภัณฑ์ก่อสร้าง", image: 'assets/cement.png'),
    Category(id: 4, name: "วัสดุเทพื้น", image: 'assets/shovel.png'),
  ];
  // static List<String> showThumbnailList = [
  //   "assets/shoe_thumb_5.png",
  //   "assets/shoe_thumb_1.png",
  //   "assets/shoe_thumb_4.png",
  //   "assets/shoe_thumb_3.png",
  // ];
  static String description =
      "Clean lines, versatile and timeless—the people shoe returns with the Nike Air Max 90. Featuring the same iconic Waffle sole, stitched overlays and classic TPU accents you come to love, it lets you walk among the pantheon of Air. ßNothing as fly, nothing as comfortable, nothing as proven. The Nike Air Max 90 stays true to its OG running roots with the iconic Waffle sole, stitched overlays and classic TPU details. Classic colours celebrate your fresh look while Max Air cushioning adds comfort to the journey.";
}
