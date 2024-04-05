import 'dart:convert';

class Book {
  final String id;
  final String name;
  final String author;
  final int pages;
  final int releaseYear;
  final String thumb;

  Book({
    required this.id,
    required this.name,
    required this.author,
    required this.pages,
    required this.releaseYear,
    required this.thumb,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'author': author,
      'pages': pages,
      'releaseYear': releaseYear,
      'thumb': thumb,
    };
  }

  factory Book.fromMap(Map<String, dynamic> map) {
    return Book(
      id: map['id'],
      name: map['name'],
      author: map['author'],
      pages: map['pages'],
      releaseYear: map['releaseYear'],
      thumb: map['thumb'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Book.fromJson(String source) => Book.fromMap(json.decode(source));

  factory Book.mock(String id) {
    return Book(
      id: id,
      name: 'name',
      author: 'author',
      pages: 200,
      releaseYear: 2021,
      thumb: 'thumb',
    );
  }

  @override
  bool operator ==(other) =>
      other is Book &&
      id == other.id &&
      other.name == name &&
      author == other.author &&
      pages == other.pages &&
      releaseYear == other.releaseYear &&
      thumb == other.thumb;

  @override
  int get hashCode => id.hashCode;

  String toString() =>
      'id: $id, name: $name, author: $author, pages: $pages, releaseYear: $releaseYear, thumb: $thumb';
}
