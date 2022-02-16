// ignore: camel_case_types
class api_product_details {
  String id;
  String productID;
  String SKU;
  int price;
  int quantity;
  String size;
  String color;
  String image;
  String typeID;
  String providerID;
  int status;

  api_product_details({
    this.id,
    this.productID,
    this.SKU,
    this.price,
    this.quantity,
    this.size,
    this.color,
    this.image,
    this.typeID,
    this.providerID,
    this.status,
  });

  api_product_details.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productID = json['productID'];
    SKU = json['SKU'];
    price = json['price'];
    quantity = json['quantity'];
    size = json['size'];
    color = json['color'];
    image = json['image'];
    typeID = json['typeID'];
    providerID = json['providerID'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['productID'] = this.productID;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['size'] = this.size;
    data['color'] = this.color;
    data['image'] = this.image;
    data['typeID'] = this.typeID;
    data['providerID'] = this.providerID;
    data['status'] = this.status;
    return data;
  }
}
