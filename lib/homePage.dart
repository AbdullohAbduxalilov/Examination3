import 'package:examination3/bonusUis/screens/jokes.dart';
import 'package:examination3/bonusUis/screens/ui.dart';
import 'package:examination3/screens/mainScreen.dart';
import 'package:flutter/material.dart';

import 'bonusUis/screens/calculator.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> nameOfProjects = [
      "Main Project",
      "Calculator bonus",
      "Jokes From Api",
      "Ui from dribble",
    ];
    List<Widget> projects = [
      LogicAlgo(),
      Calculator(),
      JokesPage(),
      UiPage(),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text("Abdulloh: Exam 3 variant 7"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Container(
          child: Column(
            children: [
              Expanded(
                child: Container(
                  child: ListView.builder(
                      itemCount: nameOfProjects.length,
                      itemBuilder: (context, index) {
                        return Card(
                          child: ListTile(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) => projects[index]));
                            },
                            title: Text(
                              "${index + 1}. " + nameOfProjects[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
