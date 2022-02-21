// ignore: camel_case_types
class Cart_API {
  String userEmail;
  String productSKU;
  String productImage;
  int productPrice;
  String productSize;
  String productColor;
  int quantity;
  int status;

  Cart_API({
    this.userEmail,
    this.productSKU,
    this.productImage,
    this.productPrice,
    this.productSize,
    this.productColor,
    this.quantity,
    this.status,
  });

  factory Cart_API.fromJson(Map<String, dynamic> json) {
    return Cart_API(
      userEmail: json['userEmail'],
      productSKU: json['productSKU'],
      productImage: json['image'],
      productPrice: json['price'],
      productSize: json['size'],
      productColor: json['color'],
      quantity: json['quantity'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userEmail'] = this.userEmail;
    data['productSKU'] = this.productSKU;
    data['image'] = this.productImage;
    data['price'] = this.productPrice;
    data['size'] = this.productSize;
    data['color'] = this.productColor;
    data['quantity'] = this.quantity;
    data['status'] = this.status;

    return data;
  }
}
