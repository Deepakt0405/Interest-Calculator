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
                      onChanged: (String value)
                      {
                        setState(() {
                          _character = value;
                        });

                      },
                    ),
                  ),
                ))
              ],
            )
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
