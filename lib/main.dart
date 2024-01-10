import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interest Calculator',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        hintColor: Colors.tealAccent,
      ),
      home: Form(),
    );
  }
}

class Form extends StatefulWidget {
  const Form({super.key});

  @override
  State<Form> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<Form> {
  TextEditingController principalTextEditingController =
      TextEditingController();
  TextEditingController rateOfInterestTextEditingController =
      TextEditingController();
  TextEditingController termTextEditingController = TextEditingController();

  //currencies
  var _currencies = ['Rupees', 'Dollars', 'Pounds'];

  String result = "";
  String _character = "";
  String currentValue = "";
  String nv = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interest Calculator"),
        centerTitle: true,
      ),
      body: Container(
        margin: EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            //Image
            getImage(),

            Row(
              children: <Widget>[
                Expanded(child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: ListTile(
                    title: Text("Simple Interest"),
                    leading: Radio(
                      value: "Simple",
                      groupValue: _character,
                      onChanged: (value)
                      {
                        setState(() {
                          // Here it is simple
                          _character = value!;
                        });

                      },
                    ),
                  ),
                )),
                Expanded(child: Padding(
                  padding: EdgeInsets.all(1.0),
                  child: ListTile(
                    title: Text("Compound Interest"),
                    leading: Radio(
                      value: "Compound",
                      groupValue: _character,
                      onChanged: (value)
                      {
                        setState(() {
                          // Here it is simple
                          _character = value!;
                        });

                      },
                    ),
                  ),
                )),
                Container(
                  width: 5.0,
                ),
              ],
            ),
            Padding(padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: principalTextEditingController,
                decoration: InputDecoration(
                  labelText: "Principal",
                  hintText: "Enter a principal amount e.g. 1099",
                  border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                  )
                ),
              ),
            ),
            Padding(padding: EdgeInsets.all(5),
              child: TextField(
                style: TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: principalTextEditingController,
                decoration: InputDecoration(
                  style: TextStyle(color: Colors.black),
                    labelText: "Rate Of Interest",
                    hintText: "Enter a rate per year",
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(5.0),
                    )
                ),
              ),
            ),
            Row(children: <Widget>[
              Expanded(child: Padding(padding:EdgeInsets.all(5),
              ))
            ],)
          ],
        ),
      ),
    );
  }
}

Widget getImage(){
    AssetImage assetImage = AssetImage('assets/back.png');
    Image image = Image(
      image: assetImage,
      width: 150,
      height: 150,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(40),
    );
}
