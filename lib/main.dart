import 'dart:convert';

import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List data;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Local Json App'),
      ),
      body: Container(
        child: Center(
          child: FutureBuilder(
            future:
                DefaultAssetBundle.of(context).loadString("assets/data.json"),
            builder: (context, snapshot) {
              var mydata = json.decode(snapshot.data.toString());
              return ListView.builder(
                itemBuilder: (BuildContext context, index) {
                  return Card(
                    elevation: 6,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        ListTile(
                          leading: CircleAvatar(backgroundImage: NetworkImage(mydata[index]["imageUrl"]),),
                          title: Text(mydata[index]["name"],
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),),
                          trailing: Text(mydata[index]["franchise"],
                          style: TextStyle(fontSize: 16),
                          ),
                          subtitle: Text(mydata[index]["nationality"],
                          style: TextStyle(
                            fontSize: 16,
                            ),
                            ),
              
                        ),
                      ],
                    ),
                  );
                },
                itemCount: mydata == null? 0 : mydata.length,
              );
            },
          ),
        ),
      ),
    );
  }
}
