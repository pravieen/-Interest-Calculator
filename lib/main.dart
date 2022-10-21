// ignore_for_file: deprecated_member_use, unused_element, unrelated_type_equality_checks

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyApp(),
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.indigo,
        accentColor: Colors.indigoAccent,
      )));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _formKey = GlobalKey<FormState>();
  final _currencies = ["Rupees", "Dollor", "Pounds"];
  String _currentitem = "Rupees";
  String displaytext = "";
  TextEditingController principalController = TextEditingController();
  TextEditingController roiController = TextEditingController();
  TextEditingController termController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    //TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: const Text('simple interest calculator         A_S_P'),
        
      ),
      body: Form(
        key: _formKey,
        child : SingleChildScrollView(
        
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(1.0),
              child: Image.asset("lib/image/money.png"),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: principalController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter principal value";
                  }
                  // ignore: unrelated_type_equality_checks
                  
                
                  //return null;
                },
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  labelText: "principal",
                  hintText: "Enter principal Ex : 12000 ",
                  errorStyle:
                      TextStyle(color: Colors.yellowAccent, fontSize: 15),
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  //labelStyle: textStyle,
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: TextFormField(
                style: const TextStyle(fontWeight: FontWeight.bold),
                controller: roiController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Please enter  Rate of Interest value";
                  }
                 
                  
                },
                decoration: const InputDecoration(
                  labelStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  labelText: "Rate Of Interest",
                  errorStyle:
                      TextStyle(color: Colors.yellowAccent, fontSize: 15),
                  hintText: "Enter Pricipal Ex : 2",
                  hintStyle: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.white),
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
              child: Row(
                children: <Widget>[
                  Flexible(
                    child: TextFormField(
                      style: const TextStyle(fontWeight: FontWeight.bold),
                      controller: termController,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Please enter Term value";
                        }
                       
                   
                      },
                      decoration: const InputDecoration(
                        labelText: "Term",
                        errorStyle : TextStyle(color: Colors.yellowAccent,fontSize:15),
                        labelStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        hintText: "Time in Years",
                        hintStyle: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: DropdownButton(
                      value: _currentitem,
                      items: _currencies.map((e) {
                        return DropdownMenuItem(value: e, child: Text(e));
                      }).toList(),
                      onChanged: (val) {
                        setState(() {
                          _currentitem = val as String;
                        });
                      },
                      icon:
                          const Icon(Icons.arrow_downward, color: Colors.blue),
                      // decoration: const InputDecoration(
                      //   labelText: "currencies selection",
                      //   border: OutlineInputBorder()
                      // ),
                    ),
                  )
                ],
              ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Expanded(
                      child: RaisedButton(
                          onPressed: (() {
                            setState(() {
                              if (_formKey.currentState!.validate()) {
                                displaytext = _caculatetotalreturn();
                              }
                            });
                          }),
                          child: const Text(
                            "Calculate",
                            style: TextStyle(fontWeight: FontWeight.bold),
                            textScaleFactor: 1.5,
                          ))),
                  Expanded(
                      child: RaisedButton(
                          color: Colors.black,
                          onPressed: (() {
                            setState(() {
                              principalController.text = "";
                              roiController.text = "";
                              termController.text = "";
                              displaytext = "";
                              _currentitem = _currencies[0];
                            });
                          }),
                          child: const Text("Reset",
                              style: TextStyle(fontWeight: FontWeight.bold),
                              textScaleFactor: 1.5)))
                ]),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(displaytext,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 25)),
            )
          ]),
        ),
        ),
      ),
    );
  }

  String _caculatetotalreturn() {
    double principal = double.parse(principalController.text);
    double roi = double.parse(roiController.text);
    double term = double.parse(termController.text);

    double totalamount = (principal * roi * term) / 100;
    String result =
        "After $term year , Your inverment will be worth $totalamount $_currentitem";
    return result;
  }
}
