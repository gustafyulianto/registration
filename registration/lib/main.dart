import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';

void main() => runApp(new MaterialApp(home: new Registration()));

class Registration extends StatefulWidget {
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  String _kelamin = "";

  final format = DateFormat("yyyy-MM-dd");

  List<String> agama = ["Islam", "Kristen", "Hindu", "Budha", "Others"];
  String _agama = "Islam";

  void _PilihKelamin(String value) {
    setState(() {
      _kelamin = value;
    });
  }

  void _pilihAgama(String value) {
    setState(() {
      _agama = value;
    });
  }

  TextEditingController controllerName = new TextEditingController();
  TextEditingController controllerBp = new TextEditingController();
  TextEditingController controllerRd = new TextEditingController();
  TextEditingController controllerEmail = new TextEditingController();
  TextEditingController controllerHP = new TextEditingController();

  void senddata() {
    AlertDialog alertDialog = new AlertDialog(
        content: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: new Column(
        children: <Widget>[
          new Text("Name: ${controllerName.text}"),
          new Text("Birth Place: ${controllerBp.text}"),
          new Text("Registration Date: ${controllerRd.text}"),
          new Text("Gender: $_kelamin"),
          new Text("Religion: $_agama"),
          new Text("Registration Email: ${controllerEmail.text}"),
          new Text("HP Number: ${controllerHP.text}"),
          new RaisedButton(
              child: new Text("Submit"),
              onPressed: () => Navigator.pop(context))
        ],
      ),
    ));
    showDialog(context: context, child: alertDialog);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        leading: new Icon(Icons.account_box),
        title: Center(child: Text("Registration Form")),
        backgroundColor: Colors.blue,
      ),
      body: new ListView(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(10),
            child: new Column(
              children: <Widget>[
                new TextField(
                  controller: controllerName,
                  decoration: new InputDecoration(
                      hintText: "Name",
                      labelText: "Full Name",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                ),
                SizedBox(height: 10),
                new TextField(
                  controller: controllerBp,
                  decoration: new InputDecoration(
                      hintText: "Place of Birth",
                      labelText: "Place of Birth",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                ),
                SizedBox(height: 10),
                DateTimeField(
                  controller: controllerRd,
                  decoration: new InputDecoration(
                      hintText: "Registration Date",
                      labelText: "Registration Date",
                      border: OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                  format: format,
                  onShowPicker: (context, currentValue) {
                    return showDatePicker(
                        context: context,
                        firstDate: DateTime(1900),
                        initialDate: currentValue ?? DateTime.now(),
                        lastDate: DateTime(2100));
                  },
                ),
                SizedBox(height: 10),
                /*decoration: new InputDecoration(
                    hintText: "Registration Date",
                    labelText: "Registration Date",
                    border: OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(10.0))),*/
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          width: 1,
                          color: Colors.black45,
                          style: BorderStyle.solid)),
                  child: Row(
                    children: <Widget>[
                      new Radio(
                        value: "Laki-laki",
                        groupValue: _kelamin,
                        onChanged: (String value) {
                          _PilihKelamin(value);
                        },
                        activeColor: Colors.red,
                      ),
                      new Text(
                        "Laki-Laki",
                        style: TextStyle(fontSize: 18),
                      ),
                      new Radio(
                        value: "Perempuan",
                        groupValue: _kelamin,
                        onChanged: (String value) {
                          _PilihKelamin(value);
                        },
                        activeColor: Colors.red,
                      ),
                      new Text(
                        "Perempuan",
                        style: TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      border: Border.all(
                          width: 1,
                          color: Colors.black45,
                          style: BorderStyle.solid)),
                  child: Row(
                    children: <Widget>[
                      new Text(
                        "  Pilih Agama",
                        style: TextStyle(fontSize: 18.0, color: Colors.black45),
                      ),
                      SizedBox(width: 50),
                      new DropdownButton(
                        onChanged: (String value) {
                          _pilihAgama(value);
                        },
                        value: _agama,
                        items: agama.map((String value) {
                          return new DropdownMenuItem(
                            value: value,
                            child: new Text(value),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10),
                new TextField(
                  controller: controllerEmail,
                  decoration: new InputDecoration(
                      hintText: "Email",
                      labelText: "Registration Email",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                ),
                SizedBox(height: 10),
                new TextField(
                  controller: controllerHP,
                  decoration: new InputDecoration(
                      hintText: "HP Number",
                      labelText: "HP Number",
                      border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(10.0))),
                ),
                SizedBox(height: 50),
                new RaisedButton(
                    child: new Text("Submit"),
                    color: Colors.tealAccent,
                    onPressed: () {
                      senddata();
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
