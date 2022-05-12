import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/utilities/constants.dart';
import 'package:todoey_flutter/widgets/flat_button.dart';
import 'package:provider/provider.dart';

class AddTaskScreen extends StatelessWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: const Color(0xff757575),
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 20, 30, 0),
        decoration: kSecondaryContainerDecoration,
        child: Consumer<TaskData>(
          builder: (context, taskData, child) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: kBottomSheetTitleTextStyle,
                ),
                const SizedBox(
                  height: 10,
                ),
                TextField(
                  textCapitalization: TextCapitalization.sentences,
                  cursorColor: kMainThemeColour,
                  autofocus: true,
                  textAlign: TextAlign.center,
                  decoration: kBottomSheetTextFieldDecoration,
                  onChanged: (value) {
                    taskData.newValue = value;
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                FlatButtom(
                    color: kMainThemeColour,
                    onPressed: () async {
                        taskData.addTask();
                        Navigator.pop(context);
                        await taskData.writeTasks();
                    },
                    child: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                      child: Text(
                        'Add',
                        style: kBottomSheetAddButtonTextStyle,
                      ),
                    )
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
