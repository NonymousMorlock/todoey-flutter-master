import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/utilities/constants.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';
import 'package:provider/provider.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({Key? key}) : super(key: key);

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> with SingleTickerProviderStateMixin {

  late AnimationController _controller;

  void animation() {
    _controller = AnimationController(vsync: this,
      duration: const Duration(milliseconds: 25),);
    Future.delayed(const Duration(milliseconds: 500),);
    _controller.forward();
    _controller.addListener(() {
      setState(() {});
    });
  }

  Future<void> getTasks() async {
    await Provider.of<TaskData>(context, listen:false).readTasks();
  }

  @override
  initState() {
    super.initState();
    animation();
    WidgetsBinding.instance!.addPostFrameCallback((_) async {
      await getTasks();
    });

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainThemeColour,
      floatingActionButton: FloatingActionButton(
        child: const Icon(kFABIcon),
        backgroundColor: kMainThemeColour,
        onPressed: () {
          showModalBottomSheet(backgroundColor: const Color(0xff757575), elevation: 0, context: context, builder: (context) => const AddTaskScreen(),);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: kParentContainerPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  child: const Icon(kListIcon, size: kListIconSize, color: kMainThemeColour,),
                  radius: _controller.value * kCircleAvatarRadius,
                  backgroundColor: kSecondaryThemeColour,
                ),
                const SizedBox(
                  height: kIconAndTitleSpace,
                ),
                const Text(
                  'Todoey',
                  style: kTitleTextStyle,
                ),
                Consumer<TaskData>(
                  builder: (context, taskData, child) {
                    return Text(
                      '${taskData.taskLength} ${taskData.taskLength == 1 ? 'task' : 'tasks'}',
                      style: kNumberOfTasksTextStyle,
                    );
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: kSecondaryContainerDecoration,
              child: const TasksList(),
            ),
          ),
        ],
      ),
    );
  }
}

