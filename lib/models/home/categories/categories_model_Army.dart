import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CategoryModel_Army {
  final int id;
  String image;
  Color color;
  String name;
  CategoryModel_Army({
    this.id,
    this.image,
    this.color,
    this.name,
  });
}

List<CategoryModel_Army> categoriesArmy = [
  // Top
  CategoryModel_Army(
    id: 1,
    name: "Tops",
    image: "assets/category/Army/top.jpg",
    color: Colors.grey[350],
  ),
  // Shirts
  CategoryModel_Army(
    id: 2,
    name: "Shirts",
    image: "assets/category/Army/shirt.jpg",
    color: Colors.grey[350],
  ),

  // Bottom
  CategoryModel_Army(
    id: 3,
    name: "Bottoms",
    image: "assets/category/Army/bottom.jpg",
    color: Colors.grey[350],
  ),

  // Hoodie
  CategoryModel_Army(
    id: 4,
    name: "Hoodies",
    image: "assets/category/Army/hoodie.jpg",
    color: Colors.grey[350],
  ),

  // Rainwear
  CategoryModel_Army(
    id: 5,
    name: "Rainwears",
    image: "assets/category/Army/rainwear.jpg",
    color: Colors.grey[350],
  ),

  // Shoes
  CategoryModel_Army(
    id: 6,
    name: "Shoes",
    image: "assets/category/Army/shoes.jpg",
    color: Colors.grey[350],
  ),

  // Backpack
  CategoryModel_Army(
    id: 7,
    name: "Backpacks",
    image: "assets/category/Army/backpack.jpg",
    color: Colors.grey[350],
  ),

  // Accesories
  CategoryModel_Army(
    id: 8,
    name: "Accesories",
    image: "assets/category/Army/accessory.jpg",
    color: Colors.grey[350],
  ),
];
