import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      title: "Todoapp",
      home: TODOAPP(),
      debugShowCheckedModeBanner: false,
    ));

class TODOAPP extends StatefulWidget {
  @override
  _TODOAPPState createState() => _TODOAPPState();
}

class _TODOAPPState extends State<TODOAPP> {
  String value;
  var listTODO = [''];

  addToDo(String item) {
    setState(() {
      listTODO.add(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("To Do App - GRZ"),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            addToDo(value);
          },
        ),
        body: ListView.builder(
            itemCount: listTODO.length,
            itemBuilder: (context, index) {
              return index == 0
                  ? Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: TextFormField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          hintText: "Type to add",
                        ),
                        onChanged: (val) {
                          value = val;
                        },
                      ),
                    )
                  : ListTile(
                      leading: Icon(Icons.timelapse),
                      title: Text(
                        '${listTODO[index]}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    );
            }));
  }
}
