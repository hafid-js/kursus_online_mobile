class LessonsModel {
  final int? id;
  final String title;
  final String duration;
  final String filePath;
  final String fileType;
  final String description;

  LessonsModel({
    this.id,
    required this.title,
    required this.duration,
    required this.filePath,
    required this.fileType,
    required this.description,
  });

 factory LessonsModel.fromJson(Map<String, dynamic> json){
  return LessonsModel(
    id: json['id'],
    title: json['title'] ?? '',
    duration: json['duration'] ?? '',
    filePath: json['file_path'] ?? '',
    fileType: json['file_type'] ?? '',
    description: json['description'] ?? ''


  );
}


}