import 'package:flutter/material.dart';
import 'package:todoey_flutter/utilities/constants.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    Key? key,
    required this.todo,
    required this.isDone,
    required this.onChanged,
    required this.onLongPress,
  }) : super(key: key);

  final bool isDone;
  final String todo;
  final void Function(bool? newValue)? onChanged;
  final VoidCallback onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        todo,
        style: TextStyle(
          decoration: isDone ? TextDecoration.lineThrough : null,
        ),
      ),
      trailing: Checkbox(
        activeColor: kMainThemeColour,
        value: isDone,
        onChanged: onChanged,
      ),
    );
  }
}
