import 'package:flutter/material.dart';
import 'to_do_item.dart';

class ToDoList extends StatefulWidget {
  const ToDoList({super.key});
  @override
  State<ToDoList> createState() {
    return _ToDoList();
  }
}

class _ToDoList extends State<ToDoList> {
  final List<ToDoItem> _todoItems = [];
  final TextEditingController _controller = TextEditingController();

  void _addTodoItem(String title) {
    setState(() {
      _todoItems.add(ToDoItem(
        title: title,
      ));
    });
    _controller.clear();
  }

  void _toggleTodoItem(ToDoItem item) {
    setState(() {
      item.isDone = !item.isDone;
    });
  }

  void _removeTodoItem(ToDoItem item) {
    setState(() {
      _todoItems.remove(item);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'To-Do List App',
          selectionColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).primaryColorLight,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: TextField(
                    controller: _controller,
                    decoration: const InputDecoration(
                      labelText: 'Add a new task',
                    ),
                    onSubmitted: _addTodoItem,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: () => _addTodoItem(_controller.text),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _todoItems.length,
              itemBuilder: (context, index) {
                final item = _todoItems[index];
                return Dismissible(
                  key: Key(item.title),
                  onDismissed: (direction) {
                    _removeTodoItem(item);
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("${item.title} removed"),
                      ),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      border: Border.all(
                        color: Colors.black,
                        // Border color
                        width: 2.0, // Border width
                      ),
                    ),
                    child: ListTile(
                      title: Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 20,
                          decoration:
                              item.isDone ? TextDecoration.lineThrough : null,
                        ),
                      ),
                      trailing: Checkbox(
                        value: item.isDone,
                        onChanged: (value) {
                          _toggleTodoItem(item);
                        },
                      ),
                    ),
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
