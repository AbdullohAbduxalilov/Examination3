import 'package:examination3/model/usersScoreModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class ScoresScreen extends StatefulWidget {
  const ScoresScreen({Key? key}) : super(key: key);

  @override
  _ScoresScreenState createState() => _ScoresScreenState();
}

class _ScoresScreenState extends State<ScoresScreen> {
  bool isLoading = true;
  var data;

  @override
  Widget build(BuildContext context) {
  fetchLocalData();
    return Scaffold(
      appBar: AppBar(
        title: Text("Scores of participants"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              child: FutureBuilder(
                  future: fetchLocalData(),
                  builder: (context, AsyncSnapshot<List<Users>> snapshot) {
                return snapshot.hasData ? ListView.builder(
                    itemCount: snapshot.data!.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Card(
                          child: ListTile(
                            title: Text("${index+1}. " + "${snapshot.data![index].username}"),
                            subtitle: Text("${snapshot.data![index].name}"),
                            trailing: Text("${snapshot.data![index].id}"),
                          ),
                        ),
                      );
                    }) : Center(child: CircularProgressIndicator());
              }),
            ),
          ),
        ],
      ),
    );
  }

  Future<List<Users>> fetchLocalData() async {
    var kelganJson = await DefaultAssetBundle.of(context).loadString("assets/json/scores.json");

    List<Users> usersFromJson = List<Users>.from(json.decode(kelganJson).map((x) => Users.fromJson(x)));

    return usersFromJson;
  }
}