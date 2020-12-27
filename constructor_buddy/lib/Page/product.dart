import 'package:flutter/material.dart';

class Product {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  Product({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });

  static of(BuildContext context) {}
}

List<Product> products = [
  Product(
      id: 1,
      title: "สกรูดำ C&T 1 THE TREE",
      price: 59,
      size: 12,
      description: dummyText,
      image: "assets/1.jpeg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 2, 
      title: "ปูนแดง ปอร์ตแลนด์ DURAONE",
      price: 150,
      size: 8,
      description: dummyText,
      image: "assets/2.jpeg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 3,
      title: " น๊อตตัวเมีย PAN SIAM",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/3.jpeg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 4,
      title: "คีมล๊อคปากตรง GIANT KINGKONG PRO",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/4.jpeg",
      color: Color(0xFFFFFFFF)),
  Product(
      id: 5,
      title: "สกรูดำ C&T 1 THE TREE",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/1.jpeg",
      color: Color(0xFFFFFFFFF)),
  Product(
    id: 6,
    title: "ปูนแดง ปอร์ตแลนด์ DURAONE",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/2.jpeg",
    color: Color(0xFFFFFFFF),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
