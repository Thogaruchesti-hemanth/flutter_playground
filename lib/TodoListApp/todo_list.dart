import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  });
  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.deepPurple,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            checkColor: Colors.deepPurple,
            activeColor: Colors.white,
            side: const BorderSide(color: Colors.white),
            value: taskCompleted,
            onChanged: onChanged,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              taskName,
              softWrap: true,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
                decoration:
                    taskCompleted
                        ? TextDecoration.lineThrough
                        : TextDecoration.none,
                decorationColor: Colors.deepPurple,
                decorationThickness: 2,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
