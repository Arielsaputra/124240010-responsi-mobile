class Book {
  final int number;
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
  final String cover;
  final int index;

  const Book({
    required this.number,
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.cover,
    required this.index,
  });

  factory Book.fromJson(Map<String, dynamic> json) {
    return Book(
      number: json['number'] is int ? json['number'] as int : 0,
      title: json['title']?.toString() ?? '',
      originalTitle: json['originalTitle']?.toString() ?? '',
      releaseDate: json['releaseDate']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      pages: json['pages'] is int ? json['pages'] as int : 0,
      cover: json['cover']?.toString() ?? '',
      index: json['index'] is int ? json['index'] as int : 0,
    );
  }
}
