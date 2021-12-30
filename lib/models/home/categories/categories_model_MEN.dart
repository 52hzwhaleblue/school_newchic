import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel_MEN {
  final int id;
  String image;
  Color color;
  String name;
  CategoryModel_MEN({
    this.id,
    this.image,
    this.color,
    this.name,
  });
}

List<CategoryModel_MEN> categoriesMEN = [
  // sơ mi
  CategoryModel_MEN(
    id: 1,
    name: "Shirts",
    image: "assets/category/Men/shirt.jpg",
    color: Colors.grey[350],
  ),
  // áo thun
  CategoryModel_MEN(
    id: 2,
    name: "T-Shirts",
    image: "assets/category/Men/T-shirt.jpg",
    color: Colors.grey[350],
  ),

  // Pants
  CategoryModel_MEN(
    id: 3,
    name: "Pants",
    image: "assets/category/Men/pant.jpg",
    color: Colors.grey[350],
  ),

  // Two Pieces
  CategoryModel_MEN(
    id: 4,
    name: "Two Piec",
    image: "assets/category/Men/2piece.jpg",
    color: Colors.grey[350],
  ),

  // Hoodie
  CategoryModel_MEN(
    id: 5,
    name: "Hoodie",
    image: "assets/category/Men/hoodie.jpg",
    color: Colors.grey[350],
  ),

  // Shoes
  CategoryModel_MEN(
    id: 6,
    name: "Shoes",
    image: "assets/category/Men/shoes.jpg",
    color: Colors.grey[350],
  ),

  // Bag
  CategoryModel_MEN(
    id: 7,
    name: "Bag",
    image: "assets/category/Men/bag.jpg",
    color: Colors.grey[350],
  ),

  // Accesories
  CategoryModel_MEN(
    id: 8,
    name: "Accesories",
    image: "assets/category/Men/accesories.jpg",
    color: Colors.grey[350],
  ),

  //sds
];
