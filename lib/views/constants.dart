import 'dart:math';

import 'package:flutter/material.dart';

// ignore: constant_identifier_names
const KTextColor = Color(0xFF535353);
// ignore: constant_identifier_names
const KTextLightColor = Color(0xFFACACAC);

// ignore: constant_identifier_names
const KDefaultPadding = 20.0;

bool isCliked = true;
bool isCliked_Men = true;
bool isCliked_Women = false;
bool isCliked_Army = false;

bool isDisableButton_army = true;

// khi user nhấn mua hàng, thêm thông tin sản phẩm vào giỏ hàng
var idCart;
var userEmailCart;
var productSKUCart;

var quantityCart;

var status;

var productStatus = true;
var productType;
var quantityProduct;

// khi sản phẩm đã có trong giỏ hàng, cập nhật trạng thái sản phẩm = true (default = false)

bool allCheck = false;

// số lượng sản  phẩm trong giỏ hàng
var itemsQuantity = 1;
var totalCart = 0;

// đăng ký
final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
final TextEditingController phoneController = TextEditingController();
final TextEditingController fullNameController = TextEditingController();

var fullname;
var phone;
var email;
var password;
