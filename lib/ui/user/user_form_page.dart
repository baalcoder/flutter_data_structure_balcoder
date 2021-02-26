import 'package:flutter/material.dart';
import 'package:flutter_data_structure_balcoder/ui/user/model/user_model.dart';
import 'package:flutter_data_structure_balcoder/ui/user/user_service.dart';

class UserFormPage extends StatefulWidget {
  UserFormPage({this.userList, this.currentIndex});

  List<UserModel> userList;
  int currentIndex;

  @override
  _UserFormPageState createState() => _UserFormPageState();
}

class _UserFormPageState extends State<UserFormPage> {
  TextEditingController _cName = new TextEditingController();
  TextEditingController _cPhoneNumber = new TextEditingController();

  UserModel _userModel = new UserModel();

  UserService _userService = new UserService();

  List<UserModel> _userList = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text("Form"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
                top: 24.0, left: 12.0, right: 12.0, bottom: 12.0),
            child: TextFormField(
              controller: _cName,
              decoration: InputDecoration(
                icon: Icon(Icons.face),
                hintText: "Ingrese su nombre",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                top: 0.0, left: 12.0, right: 12.0, bottom: 12.0),
            child: TextFormField(
              controller: _cPhoneNumber,
              decoration: InputDecoration(
                icon: Icon(Icons.phone),
                hintText: "Ingrese su número",
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              print("LO UNDIMOS");

              print(_cName.text);
              print(_cPhoneNumber.text);

              _userModel.name = _cName.text;
              _userModel.phoneNumber = int.parse(_cPhoneNumber.text);

              setState(() {
                _userList.add(_userModel);

                _userService.addUser(context, _userModel);
              });

              _userModel = new UserModel();
              _cName.text = "";
              _cPhoneNumber.text = "";
            },
            child: Container(
              height: _height * 0.05,
              width: _width * 0.24,
              decoration: BoxDecoration(
                color: Colors.indigo,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Center(
                child: Text(
                  "GUARDAR",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Container(
              height: _height * 0.45,
              width: _width * 0.90,
              color: Colors.red,
              child: ListView.builder(
                itemCount: _userList.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text(_userList[index].name),
                    subtitle: Text(_userList[index].phoneNumber.toString()),
                    leading: Icon(Icons.face_outlined),
                    trailing: Icon(Icons.delete),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
