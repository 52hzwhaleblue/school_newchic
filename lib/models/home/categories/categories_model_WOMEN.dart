// ignore_for_file: camel_case_types

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel_WOMEN {
  final int id;
  String image;
  Color color;
  String name;
  CategoryModel_WOMEN({
    this.id,
    this.image,
    this.color,
    this.name,
  });
}

List<CategoryModel_WOMEN> categoriesWomen = [
  // Tops
  CategoryModel_WOMEN(
    id: 1,
    name: "Tops",
    image: "assets/category/Women/top.jpg",
    color: Colors.grey[350],
  ),
  // Bottoms
  CategoryModel_WOMEN(
    id: 2,
    name: "Bottoms",
    image: "assets/category/Women/bottom.jpg",
    color: Colors.grey[350],
  ),

  // Dresses
  CategoryModel_WOMEN(
    id: 3,
    name: "Dresses",
    image: "assets/category/Women/dresses.jpg",
    color: Colors.grey[350],
  ),

  // Lingeries
  CategoryModel_WOMEN(
    id: 4,
    name: "Lingeries",
    image: "assets/category/Women/lingerie.jpg",
    color: Colors.grey[350],
  ),

  // Shoes
  CategoryModel_WOMEN(
    id: 5,
    name: "Shoes",
    image: "assets/category/Women/shoes.jpg",
    color: Colors.grey[350],
  ),

  // Bags
  CategoryModel_WOMEN(
    id: 6,
    name: "Bags",
    image: "assets/category/Women/bag.jpg",
    color: Colors.grey[350],
  ),

  // Acc & Beauty
  CategoryModel_WOMEN(
    id: 7,
    name: "Acc",
    image: "assets/category/Women/accessory01.jpg",
    color: Colors.grey[350],
  ),

  // Home
  CategoryModel_WOMEN(
    id: 8,
    name: "Home",
    image: "assets/category/Women/home.jpg",
    color: Colors.grey[350],
  ),
];
