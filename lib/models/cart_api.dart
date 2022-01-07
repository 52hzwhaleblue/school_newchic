class Cart_API {
  String productName;
  int price;

  Cart_API({
    this.productName,
    this.price,
  });

  factory Cart_API.fromJson(Map<String, dynamic> json) {
    return Cart_API(
      productName: json['Product Name'],
      price: json['Price'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Product Name'] = this.productName;
    data['Price'] = this.price;

    return data;
  }
}
