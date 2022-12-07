

import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import '../model/post.dart';

class NetworkRequest {
  static const String url = 'https://6382330e9842ca8d3ca3bce2.mockapi.io/api/books';
  static List<Post> parsePost (String responseBody) {
    var list = json.decode(responseBody).cast<Map<String, dynamic>>();
    List<Post> posts = list.map<Post>((json) => Post.fromJson(json)).toList();
    return posts;
}
  static Future<List<Post>> fetchPosts({int page = 1}) async{
    final url1 = Uri.parse('https://6382330e9842ca8d3ca3bce2.mockapi.io/api/books');
    final response = await http.get(url1);
    if(response.statusCode == 200){
      return compute(parsePost, response.body);
    } else if (response.statusCode == 404){
        throw Exception('Not Found');
    } else {
      throw Exception('Unable to fetch books from the rest API');
    }
  }
}