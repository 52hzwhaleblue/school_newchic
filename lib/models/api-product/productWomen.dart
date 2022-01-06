class api_productWomen {
  int id;
  String name;
  int price;
  int quantity;
  String image;
  String type;
  bool status;

  api_productWomen({
    this.id,
    this.name,
    this.price,
    this.quantity,
    this.image,
    this.type,
    this.status,
  });

  api_productWomen.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    quantity = json['quantity'];
    image = json['image'];
    type = json['type'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['price'] = this.price;
    data['quantity'] = this.quantity;
    data['image'] = this.image;
    data['type'] = this.type;
    data['status'] = this.status;
    return data;
  }
}
