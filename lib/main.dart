import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String formvalue = '';
  List<String> myList = List<String>();
  final _formkey = GlobalKey<FormFieldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              top: 10,
            ),
            child: Text(
              "My ToDo",
              style: TextStyle(
                fontSize: 54,
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: TextFormField(
              key: _formkey,
              onChanged: (val) {
                formvalue = val;
              },
              decoration: InputDecoration(
                  hintText: "write your TODO",
                  hintStyle: TextStyle(
                    fontSize: 25,
                  )),
            ),
          ),
          Container(
            padding: EdgeInsets.only(
              left: 30,
              right: 30,
              top: 5,
            ),
            child: RaisedButton(
              onPressed: () {
                //check if notequal to null
                if (formvalue != '') {
                  //if it is not empty string then
                  myList.add(formvalue);
                  formvalue = '';
                  _formkey.currentState.reset();
                  setState(() {});
                }
              },
              child: Text("Create a toDO"),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            child: ListView.builder(
              itemCount: myList.length,
              itemBuilder: (BuildContext context, int index) {
                return Dismissible(
                  key: Key(myList[index]),
                  onDismissed: (dir) {
                    myList.removeAt(index);
                  },
                  child: ListTile(
                    title: Text(myList[index]),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
