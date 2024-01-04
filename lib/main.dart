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
  TextEditingController rateofInterestTextEditingController =
      TextEditingController();
  TextEditingController termTextEditingController = TextEditingController();

  String result = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Interest Calculator"),
        centerTitle: true,
      ),
    );
  }
}
