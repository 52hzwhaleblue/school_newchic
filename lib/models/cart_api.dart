// ignore: camel_case_types
class Cart_API {
  String userEmail;
  String productSKU;
  int quantity;
  int status;

  Cart_API({
    this.userEmail,
    this.productSKU,
    this.quantity,
    this.status,
  });

  factory Cart_API.fromJson(Map<String, dynamic> json) {
    return Cart_API(
      userEmail: json['User Email'],
      productSKU: json['Product SKU'],
      quantity: json['Quantity'],
      status: json['status'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['User Email'] = this.userEmail;
    data['Product ID'] = this.productSKU;
    data['Quantity'] = this.quantity;
    data['status'] = this.status;

    return data;
  }
}
