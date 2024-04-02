class InformationModel {
  final int id;
  final String title;
  final String description;
  final String image;

  InformationModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.image});

  factory InformationModel.fromJson(Map<String, dynamic> json) {
    return InformationModel(
      id: json['id'] as int,
      title: json['title'] as String,
      description: json['description'] as String,
      image: json['image'] as String,
    );
  }
}
