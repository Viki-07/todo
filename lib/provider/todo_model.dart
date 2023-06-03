
import 'package:hive/hive.dart';
part 'todo_model.g.dart';

@HiveType(typeId: 1)
class Todo{
  
  @HiveField(0)
  String id;

  @HiveField(1)
  String todotext;
  
  @HiveField(2)
  bool completed;

  @HiveField(3)
  String category;
  
  Todo(
      {required this.id,
      required this.todotext,
      required this.category,
      required this.completed});
 
}
