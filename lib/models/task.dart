class Task {
  String todo;
  bool isDone;

  Task({
    required this.todo,
    this.isDone = false,
  });

  void toggleDone() {
    isDone = !isDone;
  }

  Task.fromJson(Map<String, dynamic> json)
      : todo = json['t'],
        isDone = json['i'];

  Map<String, dynamic> toJson() {
    return {
      't': todo,
      'i': isDone,
    };
  }
}
