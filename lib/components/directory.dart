 import 'dart:convert';

import 'package:libmanagement/model.dart';
import 'package:http/http.dart' as http;

class callthefunc{

  List<BookModel> postlist = [];

  final url =
      "https://www.googleapis.com/books/v1/volumes?q=your_search_query_here";

  Future<List<BookModel>> getpostapi() async {
    final response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonData = jsonDecode(response.body);
      List<BookModel> bookList = [];
      for (var item in jsonData['items']) {
        var book = BookModel.fromJson(item);
        bookList.add(book);
      }
      return bookList;
    } else {
      throw Exception('Failed to load data');
    }
  }

}