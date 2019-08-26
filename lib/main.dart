import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'To Do List',
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      home: MyHomePage(title: 'To Do List'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override 
  Widget build(BuildContext buildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text("To Do List"),
        ),
        body: TaskList(),
    );
  }
}

class TaskList extends StatefulWidget{

  @override 
  TaskListState createState() => TaskListState();
}

class TaskListState extends State<TaskList>{

  final addTaskController = TextEditingController();
  final List<String> _tasks = [];
  

  @override 
  void dispose(){
    addTaskController.dispose();
    super.dispose();
  }

  resetTask(){
    print("Reset Task");
    addTaskController.clear();
  }

  @override 
  Widget build(BuildContext buildContext){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(32),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: TextField(
                  autofocus: true,
                  decoration: InputDecoration(
                    labelText: "Enter Task",
                  ),
                  onChanged: (text) => {
                    print(text)
                  },
                  controller: addTaskController,
                )
              ),
              Container(
                padding: EdgeInsets.all(8),
                child: IconButton(
                  icon: Icon(
                    Icons.add_circle,
                    color: Colors.green,
                  ),
                  onPressed: (){
                    setState((){
                    print(addTaskController.text);
                    _tasks.add(addTaskController.text);
                    print(_tasks);
                    addTaskController.clear();
                    });
                  },
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.remove_circle,
                  color: Colors.red,
                ),
                onPressed: resetTask,
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(32),
            itemCount: _tasks.length,
            itemBuilder: (context, index){
              if(_tasks.length <= 0){
                return ListTile(
                  title: Text("No Task To Do !!!"),
                );
              }
              return ListTile(
                title: Text(_tasks[index]),
                trailing: IconButton(
                  icon: Icon(Icons.check_circle),
                  onPressed: (){
                    setState(() {
                      _tasks.removeAt(index);
                      print('Task COmpleted!! Yay!');
                    });
                  },
                ),
              );
            },
          ),
        )
      ],
    );
  }
}