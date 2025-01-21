import 'package:flutter/cupertino.dart';

class UsersModel {
  String user;
  String userImageUrl;

  UsersModel({
    required this.user,
    required this.userImageUrl,
  });
}

class CryptoModel {
  String name;
  String cryptoImageUrl;
  String time;
  String priceStatus;
  Color statusColor;
  String price;

  CryptoModel({
    required this.name,
    required this.cryptoImageUrl,
    required this.time,
    required this.priceStatus,
    required this.statusColor,
    required this.price,
  });
}
