class DataModel {
  bool? success;
  String? message;
  List<Data>? dataa;

  DataModel({this.success, this.message, this.dataa});

  DataModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      dataa = <Data>[];
      json['data'].forEach((v) {
        dataa!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['message'] = this.message;
    if (this.dataa != null) {
      data['data'] = this.dataa!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? name;
  String? code;
  String? type;
  String? price;
  String? image;

  Data({this.name, this.code, this.type, this.price, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    code = json['code'];
    type = json['type'];
    price = json['price'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['code'] = this.code;
    data['type'] = this.type;
    data['price'] = this.price;
    data['image'] = this.image;
    return data;
  }

  toMap() {}

  static fromMap(Map<String, dynamic> map) {}
}
