class VenderModel {
  String? address;
  String? contact;
  String? email;
  String? id;
  String? image;
  String? name;
  int? password;

  VenderModel(
      {this.address,
      this.contact,
      this.email,
      this.id,
      this.image,
      this.name,
      this.password});

  VenderModel.fromJson(Map<String, dynamic> json) {
    address = json['address'];
    contact = json['contact'];
    email = json['email'];
    id = json['id'];
    image = json['image'];
    name = json['name'];
    password = json['password'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address'] = address;
    data['contact'] = contact;
    data['email'] = email;
    data['id'] = id;
    data['image'] = image;
    data['name'] = name;
    data['password'] = password;
    return data;
  }
}
