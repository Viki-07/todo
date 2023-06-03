// import 'package:flutter/widgets.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo/provider/task_provider.dart';
import 'package:todo/provider/todo_model.dart';

class CategoriesScreeen extends StatelessWidget {
  CategoriesScreeen({required this.taskProvider, super.key});
  // int allcount=0;
  final taskProvider;
  int personalCount = 0;
  int personalComp = 0;
  int businessCount = 0;
  int businessComp = 0;
  int workCount = 0;
  int workComp = 0;
  int homeCount = 0;
  int homeComp = 0;
  int allCount = 0;
  int allComp = 0;
  void count() {
    for (Todo item in taskProvider.todoList) {
      if (item.category == "Personal") {
        personalCount++;
        if (item.completed) {
          personalComp++;
        }
      } else if (item.category == "Work") {
        workCount++;
        if (item.completed) {
          workComp++;
        }
      } else if (item.category == "Home") {
        homeCount++;
        if (item.completed) {
          homeComp++;
        }
      } else {
        businessCount++;
        if (item.completed) {
          businessComp++;
        }
      }
    }
    allCount = businessCount + workCount + homeCount + personalCount;
    allComp = businessComp + workComp + homeComp + personalComp;
  }

  @override
  Widget build(BuildContext context) {
    count();
    return Consumer<TaskProvider>(
      builder: (context, taskprovider, child) => SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(children: [
          SizedBox(
              width: 180,
              height: 125,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                // shadowColor: Colors.black,
                color: Color.fromARGB(255, 3, 25, 86),
                child: InkWell(
                   borderRadius: BorderRadius.circular(25),
                  onTap: () {
                    taskProvider.changeCategory(taskprovider.todoList);
                    // taskProvider.tempList=taskprovider.todoList;
                  },
                  // overlayColor: ,
                  autofocus: true,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '$allCount Tasks',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            )),
                        const Expanded(
                            flex: 5,
                            child: Text('All',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                        Expanded(
                        
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: FAProgressBar(
                              // changeProgressColor: Colors.black,
                              progressGradient: LinearGradient(
                                  colors: [Colors.blueAccent, Colors.redAccent]),
                              size: 10,
                              backgroundColor: Colors.grey,
                              // progressGradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.blue]),
                              currentValue: allCount == 0
                                  ? 0
                                  : allComp / allCount * 100.toInt(),
                              // displayText: '%',
                              // displayTextStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 5,
          ),
          SizedBox(
              width: 180,
              height: 125,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                color: Color.fromARGB(255, 3, 25, 86),
                child: InkWell(
                   borderRadius: BorderRadius.circular(25),

                  onTap: () {
                    taskProvider.changeCategory(taskprovider.todoList
                        .where((element) => element.category == "Personal")
                        .toList());
                    // taskProvider.tempList=taskprovider.todoList;
                  },
                  // overlayColor: ,
                  autofocus: true,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '$personalCount Tasks',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            )),
                        const Expanded(
                            flex: 5,
                            child: Text('Personal',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                        Expanded(
                        
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: FAProgressBar(
                              // changeProgressColor: Colors.black,
                             progressColor: Colors.blueAccent,
                              size: 10,
                              backgroundColor: Colors.grey,
                              // progressGradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.blue]),
                              currentValue: personalCount == 0
                                  ? 0
                                  : personalComp / personalCount * 100.toInt(),
                              // displayText: '%',
                              // displayTextStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 180,
              height: 125,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                color: Color.fromARGB(255, 3, 25, 86),
                child: InkWell(
                   borderRadius: BorderRadius.circular(25),

                  onTap: () {
                    taskProvider.changeCategory(taskprovider.todoList
                        .where((element) => element.category == "Work")
                        .toList());
                    // taskProvider.tempList=taskprovider.todoList;
                  },
                  // overlayColor: ,
                  autofocus: true,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '$workCount Tasks',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            )),
                        const Expanded(
                            flex: 5,
                            child: Text('Work',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                        Expanded(
                        
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: FAProgressBar(
                              // changeProgressColor: Colors.black,
                              progressColor: Colors.pinkAccent,
                              size: 10,
                              backgroundColor: Colors.grey,
                              // progressGradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.blue]),
                              currentValue: workCount == 0
                                  ? 0
                                  : workComp / workCount * 100.toInt(),
                              // displayText: '%',
                              // displayTextStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 180,
              height: 125,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                color: Color.fromARGB(255, 3, 25, 86),
                child: InkWell(
                   borderRadius: BorderRadius.circular(25),

                  onTap: () {
                    taskProvider.changeCategory(taskprovider.todoList
                        .where((element) => element.category == "Business")
                        .toList());
                    // taskProvider.tempList=taskprovider.todoList;
                  },
                  // overlayColor: ,
                  autofocus: true,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '$businessCount Tasks',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            )),
                        const Expanded(
                            flex: 5,
                            child: Text('Business',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                        Expanded(
                        
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: FAProgressBar(
                              // changeProgressColor: Colors.black,
                             progressColor: Color.fromARGB(255, 185, 199, 30),
                              size: 10,
                              backgroundColor: Colors.grey,
                              // progressGradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.blue]),
                              currentValue: businessCount == 0
                                  ? 0
                                  : businessComp / businessCount * 100.toInt(),
                              // displayText: '%',
                              // displayTextStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
          SizedBox(
              width: 180,
              height: 125,
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25)),
                elevation: 10,
                color: Color.fromARGB(255, 3, 25, 86),
                child: InkWell(
                   borderRadius: BorderRadius.circular(25),

                  onTap: () {
                    taskProvider.changeCategory(taskprovider.todoList
                        .where((element) => element.category == "Home")
                        .toList());
                    // taskProvider.tempList=taskprovider.todoList;
                  },
                  // overlayColor: ,
                  autofocus: true,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      
                      // mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Expanded(
                            flex: 2,
                            child: Text(
                              '$homeCount Tasks',
                              style: const TextStyle(
                                  fontSize: 14, color: Colors.white),
                            )),
                        const Expanded(
                            flex: 5,
                            child: Text('Home',
                                style: TextStyle(
                                    fontSize: 35,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.white))),
                        Expanded(
                        
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 3),
                            child: FAProgressBar(
                          progressColor: Colors.teal,
                              size: 10,
                              backgroundColor: Colors.grey,
                              // progressGradient: LinearGradient(colors: [Colors.red,Colors.green,Colors.blue]),
                              currentValue: homeCount == 0
                                  ? 0
                                  : homeComp / homeCount * 100.toInt(),
                              // displayText: '%',
                              // displayTextStyle: TextStyle(fontSize: 10),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
          const SizedBox(
            width: 10,
          ),
                 ]),
      ),
    );
  }
}
