import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String name;
  int phoneNumber;

  UserModel({this.name, this.phoneNumber});

  factory UserModel.fromSnapshot(DocumentSnapshot snapshot) {
    return UserModel(
      name: snapshot.data()["name"],
      phoneNumber: snapshot.data()["phoneNumber"],
    );
  }

  factory UserModel.fromJson(parsedJson) {
    return UserModel(
      name: parsedJson["name"],
      phoneNumber: parsedJson["phoneNumber"],
    );
  }

  toJson() {
    return {
      "name": name,
      "phoneNumber": phoneNumber,
    };
  }
}
