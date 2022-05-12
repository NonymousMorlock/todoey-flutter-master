import 'dart:collection';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  static const _storage = FlutterSecureStorage();
  static const _listKey = 'tasks';
  String? newValue;
  List _tasks = [];

  UnmodifiableListView get tasks {
    return UnmodifiableListView(_tasks);
  }

  int get taskLength {
    return _tasks.length;
  }

  void addTask() {
    if(newValue != null) {
      final task = Task(todo: newValue!).toJson();
      _tasks.add(task);
      notifyListeners();
    }
  }

  void taskChecker(Map<String, dynamic> map) async {
    map['i'] = !map['i'];
    await writeTasks();
    notifyListeners();
  }

  void taskRemover(Map<String, dynamic> map) async {
    _tasks.remove(map);
    await writeTasks();
    notifyListeners();
  }

  Future writeTasks() async {
    final value = json.encode(_tasks);
    await _storage.write(key: _listKey, value: value);
    if(kDebugMode) {
      print('write tasks: $_tasks');
    }
  }

  Future<void> getTasks() async {
    final value = await _storage.read(key: _listKey);
    final taskList = value == null ? null : List.from(jsonDecode(value));
    _tasks = taskList ?? [];
  }
  Future<void> readTasks() async {
    await getTasks();
    notifyListeners();
    if(kDebugMode) {
      print ('read tasks: $_tasks');
    }
  }
}