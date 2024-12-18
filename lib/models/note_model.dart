class Note {
  final int? id;
  final String title;
  final String description;

  const Note(
      {required this.title, required this.description, required this.id});

  // Convert a Note object to a JSON map
  factory Note.fromJson(Map<String, dynamic> json) => Note(
        id: json['id'],
        title: json['title'],
        description: json['description'],
      );

  // Convert a Note object to a JSON map for saving to the database
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'description': description,
      };
}
