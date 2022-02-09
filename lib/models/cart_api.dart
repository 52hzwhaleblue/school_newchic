// ignore: camel_case_types
class Cart_API {
  int productID;
  String productName;
  int price;
  String image;
  int quantity = 1;
  // ignore: non_constant_identifier_names
  int sub_total;
  bool isAdd = false;

  Cart_API({
    this.productID,
    this.productName,
    this.price,
    this.image,
    this.quantity,
    // ignore: non_constant_identifier_names
    this.sub_total,
    this.isAdd,
  });

  factory Cart_API.fromJson(Map<String, dynamic> json) {
    return Cart_API(
      productID: json['Product ID'],
      productName: json['Product Name'],
      price: json['Price'],
      image: json['Image'],
      quantity: json['Quantity'],
      sub_total: json['Sub Total'],
      isAdd: json['isAdd'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Product ID'] = this.productID;

    data['Product Name'] = this.productName;
    data['Price'] = this.price;
    data['Image'] = this.image;
    data['Quantity'] = this.quantity;
    data['Sub Total'] = this.sub_total;
    data['isAdd'] = this.isAdd;

    return data;
  }
}
