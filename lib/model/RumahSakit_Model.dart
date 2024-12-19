// To parse this JSON data, do
//
//     final rumahSakit = rumahSakitFromJson(jsonString);

import 'dart:convert';

RumahSakit rumahSakitFromJson(String str) => RumahSakit.fromJson(json.decode(str));

String rumahSakitToJson(RumahSakit data) => json.encode(data.toJson());

class RumahSakit {
    String name;
    String address;
    String region;
    String phone;
    String province;

    RumahSakit({
        required this.name,
        required this.address,
        required this.region,
        required this.phone,
        required this.province,
    });

    factory RumahSakit.fromJson(Map<String, dynamic> json) => RumahSakit(
        name: json["name"],
        address: json["address"],
        region: json["region"],
        phone: json["phone"],
        province: json["province"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "address": address,
        "region": region,
        "phone": phone,
        "province": province,
    };
}

