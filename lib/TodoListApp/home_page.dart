import 'package:flutter/material.dart';
import 'package:profile_page/TodoListApp/todo_list.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TodoListHomePage extends StatefulWidget {
  @override
  State<TodoListHomePage> createState() => _TodoListHomePageState();
}

class _TodoListHomePageState extends State<TodoListHomePage> {
  final _controller = TextEditingController();

  List toDoList = [];

  @override
  void initState() {
    super.initState();
    _loadTasks();
  }

  _loadTasks() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String>? storedTasks = preferences.getStringList('todo_list');
    if (storedTasks != null) {
      setState(() {
        toDoList = storedTasks.map((task) => [task, false]).toList();
      });
    }
  }

  _saveTask() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    List<String> tasks = toDoList.map((task) => task[0] as String).toList();
    preferences.setStringList('todo_list', tasks);
  }

  void checkBoxChanged(int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
    _saveTask();
    if (toDoList[index][1]) {
      // If task is completed, remove it after a delay
      Future.delayed(Duration(seconds: 1), () {
        _deleteTask(index);
      });
    }
  }

  void saveNewTask() {
    if (_controller.text.isNotEmpty) {
      setState(() {
        toDoList.add([_controller.text, false]);
        _controller.clear();
      });
      _saveTask();
    }
  }

  void _deleteTask(int index) async {
    bool? confirmDelete = await showDialog<bool>(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Confirm Deletion'),
            content: Text('Are you sure you want to delete this task? '),
            actions: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: Text('Cancel'),
              ),
              TextButton(
                onPressed: () => Navigator.of(context).pop(true),
                child: Text('Delete'),
              ),
            ],
          ),
    );
    if (confirmDelete == true) {
      setState(() {
        toDoList.removeAt(index);
      });
    }
    _saveTask();
  }

  void _editTask(int index) {
    _controller.text = toDoList[index][0];
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Edit Task'),
            content: TextField(
              controller: _controller,
              decoration: InputDecoration(hintText: 'Enter task'),
            ),
            actions: [
              TextButton(
                onPressed: () {
                  setState(() {
                    toDoList[index][0] = _controller.text;
                    _controller.clear();
                  });
                  _saveTask(); // Save updated list
                  Navigator.of(context).pop();
                },
                child: Text('Save'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text('Cancel'),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade100,
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        itemCount: toDoList.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: ValueKey(toDoList[index][0]),
            direction: DismissDirection.horizontal,
            onDismissed: (direction) {
              if (direction == DismissDirection.endToStart) {
                //swipe left -> Delete task
                _editTask(index);
              } else if (direction == DismissDirection.startToEnd) {
                // swipe right -> Edit task
                _deleteTask(index);
              }
            },
            background: Container(
              color: Colors.red,
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.delete, color: Colors.white),
              ),
            ),
            secondaryBackground: Container(
              color: Colors.blue,
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Icon(Icons.edit, color: Colors.white),
              ),
            ),
            child: ListTile(
              title: Text(
                toDoList[index][0],
                style: TextStyle(
                  decoration:
                      toDoList[index][1]
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                ),
              ),
              leading: Checkbox(
                value: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(index),
              ),
            ),
          );
        },
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(width: 20),
          Expanded(
            child: TextField(
              controller: _controller,
              decoration: InputDecoration(
                hintText: "Add New Todo Item",
                filled: true,
                fillColor: Colors.deepPurple.shade200,
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(15),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.deepPurple),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          SizedBox(width: 20),
          FloatingActionButton(
            onPressed: saveNewTask,
            backgroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
