import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? numberOfChances = 3;
  int? randomNumber = Random().nextInt(11);
  List<bool> buttonHolati = List.generate(11, (index) => true);
  int? time = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Time:",
                    style: TextStyle(
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Expanded(
                    child: Text(
                      "$time",
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 40.0,
                  ),
                  SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    "$numberOfChances",
                    style: TextStyle(
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                      fontSize: 24.0,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
              Text(
                "Find the random number",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                "in 3 chances",
                style: TextStyle(
                  fontSize: 24.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Container(
                height: 480.0,
                child: GridView.builder(
                    itemCount: 11,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      childAspectRatio: 1,
                    ),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                          ),
                          onPressed: buttonHolati[index]
                              ? () {
                                  setState(() {
                                    numberOfChances = numberOfChances! - 1;
                                  });
                                  if (numberOfChances == 0 &&
                                      index != randomNumber) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Column(
                                              children: [
                                                Text(
                                                  "Game over",
                                                  style: TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 20.0,
                                                  ),
                                                ),
                                                Text("random raqam $randomNumber edi "),
                                              ],
                                            ),
                                            content: Text(
                                                "Spent Time: $time"),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    numberOfChances = 3;
                                                    randomNumber = Random().nextInt(11);
                                                    buttonHolati = List.generate(11, (index) => true);
                                                    time = 0;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text("restart"),
                                              ),
                                            ],
                                          );
                                        });
                                  } else if (index == randomNumber) {
                                    showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text("You win"),
                                            content: Text(
                                                "Spent Time: $time"),
                                            actions: [
                                              ElevatedButton(
                                                onPressed: () {
                                                  setState(() {
                                                    numberOfChances = 3;
                                                    randomNumber = Random().nextInt(11);
                                                    buttonHolati = List.generate(11, (index) => true);
                                                    time = 0;
                                                  });
                                                  Navigator.pop(context);
                                                },
                                                child: Text("restart"),
                                              ),
                                            ],
                                          );
                                        });
                                  } else if (index + 1 > randomNumber!) {
                                    for (var i = index; i <= 10; i++) {
                                      setState(() {
                                        buttonHolati[i] = false;
                                      });
                                    }
                                  } else if (index < randomNumber!) {
                                    for (var i = index; i >= 0; i--) {
                                      setState(() {
                                        buttonHolati[i] = false;
                                      });
                                    }
                                  }
                                }
                              : null,
                          child: Container(
                            alignment: Alignment.center,
                            height: 70.0,
                            width: 70.0,
                            child: Text(
                              "$index",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 50.0,
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
              Container(
                height: 100.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Colors.amber,
                        shape: CircleBorder(),
                      ),
                      onPressed: () async {
                        setState(() {
                          numberOfChances = 3;
                          randomNumber = Random().nextInt(11);
                          buttonHolati = List.generate(11, (index) => true);
                          time = 0;
                        });
                        for (var i = 0; numberOfChances! > 0; i++) {
                          await Future.delayed(Duration(seconds: 1), () {
                            setState(() {
                              time = time! + 1;
                            });
                          });
                        }

                      },
                      child: Container(
                        alignment: Alignment.center,
                        height: 70.0,
                        width: 70.0,
                        child: Text(
                          "restart",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
