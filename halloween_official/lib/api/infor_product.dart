// To parse this JSON data, do
//
//     final photos = photosFromJson(jsonString);

import 'dart:convert';

Message photosFromJson(String str) => Message.fromJson(json.decode(str));

String photosToJson(Message data) => json.encode(data.toJson());

class Message {
    Message({
       required this.success,
       required this.message,
       required this.data,
    });

    bool success;
    String message;
    List<Information> data;

    factory Message.fromJson(Map<dynamic, dynamic> json) => Message(
        success: json["success"],
        message: json["message"],
        data: List<Information>.from(json["data"].map((x) => Information.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "success": success,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toJson())),
    };
}

class Information {
    Information({
       required this.name,
       required this.code,
       required this.type,
       required this.price,
       required this.image,
    });

    String name;
    String code;
    String type;
    String price;
    String image;

    factory Information.fromJson(Map<dynamic, dynamic> json) => Information(
        name: json["name"],
        code: json["code"],
        type: json["type"],
        price: json["price"],
        image: json["image"],
    );

    Map<dynamic, dynamic> toJson() => {
        "name": name,
        "code": code,
        "type": type,
        "price": price,
        "image": image,
    };
}
