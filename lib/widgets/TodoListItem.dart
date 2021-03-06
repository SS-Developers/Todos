import "package:flutter/material.dart";
import 'package:todos/screens/TodoPage.dart';
import "../helpers/ColorUtils.dart";
import "dart:math";
// import "NewTodo.dart";
import 'TodoItem.dart';

class TodoListItem extends StatelessWidget {
  final List todos;
  final String listName;
  final Color color;
  final String id;

  const TodoListItem({Key? key, required this.todos, required this.listName, required this.color, required this.id})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: todos.length >= 10 ? 300 : todos.length * 70,
      margin: const EdgeInsets.all(20),
      padding: const EdgeInsets.all(10),
      width: 800,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: color,
          border: Border.all(width: 2.0, color: darken(color)),
    ),
      child: ListView.builder(
        itemCount: todos.isEmpty ? 1 : todos.length + 1,
        itemBuilder: (ctx, index) {
          if (index == 0) {
            return Container(
              padding: const EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    listName,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  GestureDetector(
                    onTap: () {
                     Navigator.of(context).pushNamed(TodoPage.routeName, arguments: id);
                    },
                    child: const Icon(Icons.edit),
                  ),
                ],
              ),
            );
          }
          index -= 1;
          return Row(
            children: [
              Expanded(
                child: Column(children: [
                  TodoItem(
                    listId: id,
                    isChecked: todos[index].isChecked as bool,
                    id: todos[index].id as String,
                    todoText: todos[index].name as String,
                  ),
                  Divider(color: Colors.grey[300])
                ]),
              ),
            ],
          );
        },
      ),
    );
  }
}
