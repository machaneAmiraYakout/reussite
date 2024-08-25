class ToDoItem {
  String task;
  bool isCompleted;

  ToDoItem({required this.task, required this.isCompleted});

  Map<String, dynamic> toJson() => {
    'task': task,
    'isCompleted': isCompleted,
  };

  factory ToDoItem.fromJson(Map<String, dynamic> json) => ToDoItem(
    task: json['task'],
    isCompleted: json['isCompleted'],
  );
}
