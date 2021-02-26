import 'package:flutter/material.dart';
import 'package:flutter_data_structure_balcoder/ui/user/model/user_model.dart';
import 'package:flutter_data_structure_balcoder/ui/user/user_form_page.dart';

class UserListPage extends StatefulWidget {
  @override
  _UserListPageState createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  int currentIndex;

  List<UserModel> _userList = [];

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blue,
          title: Center(
              child: Text(
            "LIST",
            style: TextStyle(color: Colors.white),
          ))),
      body: Column(
        children: [
          Container(
            child: Center(
              child: Container(
                  color: Colors.green[50],
                  height: _height * 0.50,
                  width: _width * 0.9,
                  //ListView.builder: permite crear barras/listas desplegables.
                  //itemCount: permite que el itemBuiler construya las veces que termine en el Count, número de repeticiones.
                  //length: enumerar los objetos de la lista.
                  //index: darle una posición de cada ítem - aprender a separarlas
                  child: ListView.builder(
                    itemCount: _userList.length,
                    itemBuilder: (BuildContext context, int index) {
                      return ListTile(
                        //onTap: lo estoy agregando para cuando lo presione, me pueda llevarlo nuevamente al formulario que debe completar.
                        onTap: () async {
                          setState(() {
                            currentIndex = index;
                          });
                          await Navigator.push(context,
                              MaterialPageRoute(builder: (_) {
                            return UserFormPage(
                                userList: _userList,
                                currentIndex: currentIndex);
                          }));
                          setState(() {
                            currentIndex = null;
                          });
                        },
                        title: Text(_userList[index].name),
                        subtitle: Text(_userList[index].phoneNumber.toString()),
                        leading: Icon(Icons.face_outlined),
                        trailing: GestureDetector(
                            onTap: () {
                              //Voy a remover, eliminar la informacion que se encuentra dentro del icono delete.
                              setState(() {
                                _userList.removeAt(index);
                              });
                            },
                            child: Icon(Icons.delete)),
                      );
                    },
                  )),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("Undimos esto");

          await Navigator.push(context, MaterialPageRoute(builder: (_) {
            return UserFormPage(
                userList: _userList, currentIndex: currentIndex);
          }));
          setState(() {});
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
