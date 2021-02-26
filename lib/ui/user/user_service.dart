import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_beautiful_popup/main.dart';

class UserService {
  final userCollection =
      FirebaseFirestore.instance.collection('userCollection');

  addUser(context, userModel) async {
    await userCollection
        .add(userModel.toJson())
        .then((result) =>
            result.get().then((snap) async => Navigator.of(context).pop()))
        .catchError((err) => print(err));
  }

  updateUser(context, userModel) async {
    await userCollection
        .doc(userModel.userKey)
        .update(userModel.toJson())
        .then((result) async => Navigator.of(context).pop())
        .catchError((err) => print(err));
  }

  deleteUser(context, userModel) async {
    final popup = BeautifulPopup(
      context: context,
      template: TemplateFail,
    );
    popup.show(
      title: '¿Está seguro?',
      content:
          'Esta acción eliminará el registro para siempre, no lograremos encontrar nuevamente esta información para usted. ¿Desea eliminarlo?',
      actions: [
        popup.button(
          label: 'Eliminar',
          onPressed: () async {
            userModel.isDeleted = true;
            userModel.deletedDate = Timestamp.now();
            Navigator.of(context).pop();
            updateUser(context, userModel);
          },
        ),
      ],
      // bool barrierDismissible = false,
      // Widget close,
    );
  }
}
