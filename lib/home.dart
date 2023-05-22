import 'package:flutter/material.dart';
import 'package:todo/categories_screen.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/provider/todo_model.dart';
import 'package:todo/todolist_screen.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final List<String> list = <String>['Personal', 'Business', 'Work', 'Home'];
  final tasktext = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskProvider>(
      builder: (context, taskprovider, child) => Scaffold(
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              String dropdownValue = list.first;
              showModalBottomSheet(
                  elevation: 20,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20),
                          topRight: Radius.circular(20))),
                  context: context,
                  isScrollControlled: true,
                  builder: (BuildContext context) {
                    return Padding(
                      padding: EdgeInsets.only(
                          bottom: MediaQuery.of(context).viewInsets.bottom),
                      child: Column(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          alignment: Alignment.topCenter,
                          // height: 50,
                          child: TextField(
                            controller: tasktext,
                            autofocus: true,
                            decoration: const InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'Task',
                              hintText: 'Enter Task',
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
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
                                    items: list.map<DropdownMenuItem<String>>(
                                        (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ]),
                        ),
                        ElevatedButton(
                            onPressed: () {
                              taskprovider.add(Todo(
                                  id: DateTime.now().toString(),
                                  category: dropdownValue,
                                  todotext: tasktext.text,
                                  completed: false));
                              print(taskprovider
                                  .todoList[taskprovider.todoList.length - 1]
                                  .category);
                              Navigator.of(context).pop();
                            },
                            child: const Text('Done'))
                      ]),
                    );
                  });
            },
            child: const Icon(Icons.add),
          ),
          appBar: AppBar(
            leading: IconButton(
              icon: const Icon(Icons.menu),
              onPressed: () {},
              // color: Colors.white
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
                // color: Colors.white,
              )
            ],
          ),
          body: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(20),
                child: Row(
                  children: const [
                    Expanded(
                      child: Text(
                        'Whats up, Vivek!',
                        style: TextStyle(
                            fontSize: 30,
                            // color: Colors.white,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: const [
                    Text(
                      'CATEGORIES',
                      style: TextStyle(
                          // color: Colors.blue,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 125, width: 400, child: CategoriesScreeen()),
                ],
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
                          // color: Colors.blue,
                          fontSize: 15),
                    )
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  SizedBox(height: 350, width: 400, child: TodolistScreen()),
                ],
              ),
            ],
          )
          // This trailing comma makes auto-formatting nicer for build methods.
          ),
    );
  }
}
