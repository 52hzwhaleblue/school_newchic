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
var productID_cart;
var productName_cart;
var productPrice_cart;
var productImage_cart;
var quantity_cart;
var sub_total_cart;
var isAdd;

var product_status = true;
var product_type;
var quantity_product;

// khi sản phẩm đã có trong giỏ hàng, cập nhật trạng thái sản phẩm = true (default = false)

bool allCheck = false;

// số lượng sản  phẩm trong giỏ hàng
var itemsQuantity = 1;
var totalCart = 0;

var i1;
var i2;
var i3;
var i4;
var i5;
var i6;
var i7;
