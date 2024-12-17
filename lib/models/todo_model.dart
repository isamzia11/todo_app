// ignore_for_file: public_member_api_docs, sort_constructors_first
class ToDo {
  final String name;
  final DateTime createdAt;

  ToDo({required this.name, required this.createdAt});

  @override
  String toString() => 'ToDo(name: $name, createdAt: $createdAt)';
}
