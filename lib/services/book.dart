class Books {
  String? id;
  String? name;
  String? avata;
  String? author;
  String? category;
  String? review;
  String? target;
  String? other;
  Books({this.id, this.name, this.avata, this.author, this.category, this.review, this.target, this.other});

  factory Books.fromJson(Map<String, dynamic> json){
    return Books(
      id: json['id'],
      name: json['name'],
      avata: json['avata'],
      author: json['author'],
      category: json['category'],
      review: json['review'],
      target: json['target'],
      other: json['other'],

    );
  }
}
