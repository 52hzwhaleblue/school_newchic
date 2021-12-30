import 'package:flutter/material.dart';

class ProductWomen {
  final String image, title, description;
  final int price, size, id;
  final Color color;
  ProductWomen({
    this.id,
    this.image,
    this.title,
    this.price,
    this.description,
    this.size,
    this.color,
  });
}

List<ProductWomen> productWomen = [
  ProductWomen(
      id: 1,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/products/shirt/1.png",
      color: const Color(0xFF3D82AE)),
  ProductWomen(
      id: 2,
      title: "Belt Bag",
      price: 234,
      size: 8,
      description: dummyText,
      image: "assets/products/shirt/2.png",
      color: const Color(0xFFD3A984)),
  ProductWomen(
      id: 3,
      title: "Hang Top",
      price: 234,
      size: 10,
      description: dummyText,
      image: "assets/products/shirt/3.png",
      color: const Color(0xFF989493)),
  ProductWomen(
      id: 4,
      title: "Old Fashion",
      price: 234,
      size: 11,
      description: dummyText,
      image: "assets/products/shirt/4.png",
      color: const Color(0xFFE6B398)),
  ProductWomen(
      id: 5,
      title: "Office Code",
      price: 234,
      size: 12,
      description: dummyText,
      image: "assets/products/shirt/5.png",
      color: const Color(0xFFFB7883)),
  ProductWomen(
    id: 6,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/shirt/6.png",
    color: const Color(0xFFAEAEAE),
  ),
  ProductWomen(
    id: 7,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/shirt/6.png",
    color: const Color(0xFFAEAEAE),
  ),
  ProductWomen(
    id: 8,
    title: "Office Code",
    price: 234,
    size: 12,
    description: dummyText,
    image: "assets/products/shirt/6.png",
    color: const Color(0xFFAEAEAE),
  ),
];

String dummyText =
    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since. When an unknown printer took a galley.";
