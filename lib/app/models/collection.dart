import 'dart:convert';

import 'package:technical_template/app/models/books.dart';

class Collection {
  final String name;
  final String id;
  final List<Book> books;

  Collection({required this.name, required this.id, required this.books});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'id': id,
      'books': books.map((x) => x.toMap()).toList(),
    };
  }

  String toJson() => json.encode(toMap());

  factory Collection.fromJson(Map<String, dynamic> json) => Collection(
        name: json['name'],
        id: json['id'],
        books: List<Book>.from(json['books'].map((x) => Book.fromMap(x))),
      );

  factory Collection.mock(String id) {
    return Collection(
      id: id,
      name: 'mockedName',
      books: List.generate(3, (index) => Book.mock('$index')),
    );
  }

  @override
  bool operator ==(other) =>
      other is Collection &&
      id == other.id &&
      other.name == name &&
      books == books;

  @override
  int get hashCode => id.hashCode;

  @override
  toString() {
    return '{name: $name, id: $id, books: $books}';
  }
}
