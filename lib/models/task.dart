class Task {
  final int id;
  final String title;
  final String description;
  final String? id;

  Task({
    this.id,
    required this.id,
    required this.title,
    required this.description,
  });

  factory Task.fromMap(Map<String, dynamic> map, {String? id}) {
    return Task(
      id: id ?? map['id'] as String?,
      id: map['id'] as int,
      title: map['title'] as String,
      description: map['description'] as String,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
    };
  }

  Task copyWith({
    String? id,
    int? id,
    String? title,
    String? description,
  }) {
    return Task(
      id: id ?? this.id,
      id: id ?? this.id,
      title: title ?? this.title,
      description: description ?? this.description,
    );
  }

  @override
  String toString() {
    return 'Task(id: ${id}, title: ${title}, description: ${description})';
  }
}
