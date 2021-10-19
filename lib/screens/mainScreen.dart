import 'package:examination3/screens/scoresScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

import 'package:flutter/widgets.dart';

class LogicAlgo extends StatefulWidget {
  const LogicAlgo({Key? key}) : super(key: key);

  @override
  _LogicAlgoState createState() => _LogicAlgoState();
}

class _LogicAlgoState extends State<LogicAlgo> {
  GlobalKey<FormFieldState> _formKey = GlobalKey<FormFieldState>();
  var number;
  var factorialNumber = 0;
  var arifmeticNUmber = 0;
  var inputList;
  var result = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Expanded(
              child: Text("Calculate the sum or factorial "),
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ScoresScreen(),
                  ),
                );
              },
              child: Icon(
                Icons.arrow_forward,
              ),
            ),
          ],
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            children: [
              TextFormField(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(30.0),
                    ),
                  ),
                  hintText: "Enter a number",
                  labelText:
                      "For calculating it's arifmetic sum or it's factorial",
                ),
                validator: (value) {
                  if (value!.length < 0) {
                    return "son kiriting";
                  }
                },
                onSaved: (e) {
                  setState(() {
                    number = e;
                  });
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.deepPurple.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: arifmeticSum,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 10.0),
                        child: Text(
                          "arifmetik",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                          ),
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber.shade900,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30.0),
                          ),
                        ),
                      ),
                      onPressed: factorial,
                      child: Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: 10.0,
                          vertical: 10.0,
                        ),
                        child: Text(
                          "faktorial",
                          style: TextStyle(
                            fontSize: 24.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(
                  bottom: 10.0,
                ),
                alignment: Alignment.center,
                child: Text(
                  "Result: ${result}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 32.0,
                  ),
                ),
              ),
              Expanded(
                child: resultFunc(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  arifmeticSum() {
    result = 0;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
    }
    inputList = number.toString().split(",");
    for (var i in inputList) {
      result += int.parse(i);
    }
  }

  factorial() {
    result = 1;
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();

      for (int i = 1; i <= int.parse(number); i++) {
        result *= i;
        if (int.parse(number) == 0) {
          setState(() {
            result = 1;
          });
        }
      }
    }
  }

  resultFunc() {
    if ((result * 0.12).floor() % 2 == 0) {
      return ListView.builder(
          itemCount: (result * 0.12).floor(),
          itemBuilder: (context, index) {
            return Card(
              color:
                  Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0),
              child: ListTile(
                title: Text("${index + 1}"),
              ),
            );
          });
    }else if ((result * 0.12).floor() % 2 == 1 || (result * 0.12) < 1) {
      return GridView.builder(
        itemCount: (result * 0.12).floor() == 0 ? 1 : (result * 0.12).floor(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          mainAxisSpacing: 5.0,
          crossAxisSpacing: 5.0,
        ),
        itemBuilder: (context, index) {
          return Container(
            color:  Color.fromRGBO(Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1.0),
            alignment: Alignment.center,
            child: Text("${index + 1}"),
          );
        },
      );
    }
  }
}
