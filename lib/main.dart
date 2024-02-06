import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Interest Calculator',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        hintColor: Colors.blueAccent,
      ),
      home: const FormWidget(),
    );
  }
}

class FormWidget extends StatefulWidget {
  const FormWidget({Key? key});

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
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
  void initState() {
    currentValue = _currencies[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Interest Calculator"),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            //Image
            getImage(),

            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      title: const Text("Simple Interest"),
                      leading: Radio(
                        value: "Simple",
                        groupValue: _character,
                        onChanged: (value) {
                          setState(() {
                            // Here it is simple
                            _character = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: ListTile(
                      title: const Text("Compound Interest"),
                      leading: Radio(
                        value: "Compound",
                        groupValue: _character,
                        onChanged: (value) {
                          setState(() {
                            // Here it is simple
                            _character = value!;
                          });
                        },
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 5.0,
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: principalTextEditingController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: "Principal",
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: "Enter a principal amount e.g. 1099",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(5),
              child: TextField(
                style: const TextStyle(color: Colors.black),
                keyboardType: TextInputType.number,
                controller: rateOfInterestTextEditingController,
                decoration: InputDecoration(
                  labelStyle: const TextStyle(color: Colors.black),
                  labelText: "Rate Of Interest",
                  hintStyle: const TextStyle(color: Colors.grey),
                  hintText: "Enter a rate per year",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                ),
              ),
            ),

            Row(
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: TextField(
                      style: const TextStyle(color: Colors.black),
                      keyboardType: TextInputType.number,
                      controller: termTextEditingController,
                      decoration: InputDecoration(
                        labelStyle: const TextStyle(color: Colors.black),
                        labelText: "Term",
                        hintStyle: const TextStyle(color: Colors.grey),
                        hintText: "Enter number of years",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 10,
                ),
                //dropdown menu
                Expanded(
                  child: DropdownButton<String>(
                    items: _currencies.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    value: currentValue,
                    onChanged: (newValue) {
                      _setSelectedValue(newValue!);
                      this.nv = newValue;
                      setState(() {
                        this.currentValue = newValue;
                      });
                    },
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  void _setSelectedValue(String newValue) {
    setState(() {
      this.currentValue = newValue;
    });
  }
}

Widget getImage() {
  const AssetImage assetImage = AssetImage('assets/back.png');
  final Image image = Image(
    image: assetImage,
    width: 150,
    height: 150,
  );
  return Container(
    child: image,
    margin: const EdgeInsets.all(40),
  );
}
