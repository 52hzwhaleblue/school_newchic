class api_productMen {
  int id;
  String name;
  int price;
  int quantity;
  String image;
  bool status;

  api_productMen(
      {this.id, this.name, this.price, this.quantity, this.image, this.status});

  api_productMen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['status'] = this.status;
    return data;
  }
}
