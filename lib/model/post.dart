import 'dart:convert';
import 'package:http/http.dart' as http;
class Post {
  String? name;
  String? avatar;
  String? author;
  String? category;
  String? review;
  String? target;
  String? other;
  String? id;

  Post(
      {this.name,
        this.avatar,
        this.author,
        this.category,
        this.review,
        this.target,
        this.other,
        this.id});

  Post.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    avatar = json['avatar'];
    author = json['author'];
    category = json['category'];
    review = json['review'];
    target = json['target'];
    other = json['other'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['avatar'] = this.avatar;
    data['author'] = this.author;
    data['category'] = this.category;
    data['review'] = this.review;
    data['target'] = this.target;
    data['other'] = this.other;
    data['id'] = this.id;
    return data;
  }
}
//
// List<Books> parseBooks (String responseBody) {
//   final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
//   return parsed.map<Books>((json) => Books.fromJson(json)).toList();
// }
//
// Future<List<Books>> fetchBooks() async{
//   final url1 = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/books');
//   final response = await http.get(url1);
//   if(response.statusCode == 200){
//     print("aaaaaa");
//     print(parseBooks(response.body));
//     return parseBooks(response.body);
//   } else {
//     throw Exception('Unable to fetch books from the rest API');
//   }
// }