class Cart_API {
  String productName;
  int price;
  String image;

  Cart_API({
    this.productName,
    this.price,
    this.image,
  });

  factory Cart_API.fromJson(Map<String, dynamic> json) {
    return Cart_API(
      productName: json['Product Name'],
      price: json['Price'],
      image: json['Image'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();

    data['Product Name'] = this.productName;
    data['Price'] = this.price;
    data['Image'] = this.image;

    return data;
  }
}
