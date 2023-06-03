import 'package:flutter/material.dart';
import 'package:todo/categories_screen.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/provider/todo_model.dart';
import 'package:provider/provider.dart';
import 'package:todo/todolist_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> list = <String>['Personal', 'Business', 'Work', 'Home'];
  final tasktext = TextEditingController();
  final userName = TextEditingController();

  // String userName="Vivek";
  @override
  Widget build(BuildContext context) {
    if (userName.text.isEmpty) userName.text = "Vivek";

    return Consumer<TaskProvider>(
      builder: (context, taskprovider, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            elevation: 10,
            foregroundColor: Colors.white,
            backgroundColor: Colors.pink.shade400,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)),
            onPressed: () {
              String dropdownValue = list.first;
              showsheet(context, dropdownValue, taskprovider);
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            leading: IconButton(
              color: Colors.white,
              icon: const Icon(Icons.menu),
              onPressed: () {},
              // color: Colors.white
            ),
            // actions: [
            //   IconButton(
            //     icon: const Icon(Icons.search),
            //     onPressed: () {},
            //     // color: Colors.white,
            //   )
            // ],
          ),
          body: Column(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      flex: 8,
                      child: Padding(
                        padding: EdgeInsets.all(10),
                        child: Text(
                          "What's up, " + userName.text + "!",
                          style: TextStyle(
                              fontSize: 30,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 1,
                        child: IconButton(
                          onPressed: () {
                            showDialog(
                                context: context,
                                builder: (BuildContext context) =>
                                    DialogboxName(context));
                          },
                          icon: Icon(Icons.edit),
                          color: Colors.white,
                        ))
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Row(
                    children: const [
                      Text(
                        'Categories',
                        style: TextStyle(
                            color: Colors.white,
                            // color: Colors.blue,
                            fontSize: 15),
                      )
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                        height: 125,
                        width: 400,
                        child: CategoriesScreeen(
                          taskProvider: taskprovider,
                        )),
                  ],
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Text(
                      'Todays Task',
                      style: TextStyle(
                          color: Colors.white,
                          // color: Colors.blue,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              SizedBox(height: 380, width: 400, child: TodolistScreen()),
            ],
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }

  Future<dynamic> showsheet(
      BuildContext context, String dropdownValue, TaskProvider taskprovider) {
    return showModalBottomSheet(
        elevation: 20,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return StatefulBuilder(
            builder: (context, setState) => Padding(
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: SizedBox(
                // width: 50,
                height: 250,
                child: Column(mainAxisSize: MainAxisSize.min, children: [
                  Container(
                    margin: EdgeInsets.all(15),
                    alignment: Alignment.topCenter,
                    // height: 50,
                    child: TextField(
                      textCapitalization: TextCapitalization.sentences,
                      controller: tasktext,
                      autofocus: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Task',
                        hintText: 'Enter Task',
                      ),
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const Text('Category : '),
                          Container(
                            alignment: Alignment.topCenter,
                            child: DropdownButton<String>(
                              value: dropdownValue,
                              icon: const Icon(Icons.arrow_downward),
                              elevation: 16,
                              // style: const TextStyle(color: Colors.deepPurple),
                              underline: Container(
                                height: 2,
                                // color: Colors.deepPurpleAccent,
                              ),
                              onChanged: (String? value) {
                                // This is called when the user selects an item.
                                setState(() {
                                  dropdownValue = value!;
                                });
                              },
                              items: list
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            ),
                          ),
                        ]),
                  ),
                  Container(
                    height: 50,
                    width: 100,
                    margin: EdgeInsets.all(15),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),elevation: 5),
                        onPressed: () {
                          taskprovider.add(Todo(
                              id: DateTime.now().toString(),
                              category: dropdownValue,
                              todotext: tasktext.text,
                              completed: false));
                          Navigator.of(context).pop();
                        },
                        child: const Text('Done')),
                  )
                ]),
              ),
            ),
          );
        });
  }

  Dialog DialogboxName(BuildContext ctx) {
    return Dialog(
      child: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(ctx).size.height * 0.19,
          width: MediaQuery.of(ctx).size.width * 0.99,
          // width: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: TextField(
                  onSubmitted: (uName) {
                    setState(() {
                      userName.text = uName;
                    });
                  },
                  controller: userName,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(18))),
                    hintText: 'Enter your Name',
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: () => Navigator.pop(context),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
