class InstructorModel {
  final int id;
  final String name;

  InstructorModel({required this.id, required this.name});

  factory InstructorModel.fromJson(Map<String, dynamic> json) {
    return InstructorModel(
      id: json['id'],
      name: json['name'],
    );
  }
}