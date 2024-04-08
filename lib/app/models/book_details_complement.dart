class BookDetailsComplement {
  String review;
  String isbn;

  BookDetailsComplement({required this.review, required this.isbn});

  factory BookDetailsComplement.fromJson(Map<String, dynamic> json) {
    return BookDetailsComplement(
      review: json["items"][0]["volumeInfo"]["description"],
      isbn: json["items"][0]["volumeInfo"]["industryIdentifiers"][1]
          ["identifier"],
    );
  }
  //
}
