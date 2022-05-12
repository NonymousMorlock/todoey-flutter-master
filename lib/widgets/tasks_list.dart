import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemCount: taskData.taskLength,
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              todo: task['t'],
              isDone: task['i'],
              onChanged: (newValue) {
                taskData.taskChecker(task);
              },
              onLongPress: () {
                taskData.taskRemover(task);
              },
            );
          },
        );
      },
    );
  }
}