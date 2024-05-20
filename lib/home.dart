import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:libmanagement/bucket.dart';
import 'package:libmanagement/function/cart.dart';
import 'package:libmanagement/grid.dart';
import 'package:libmanagement/model.dart';
import 'package:provider/provider.dart';

class HomeScr extends StatefulWidget {
  @override
  State<HomeScr> createState() => _HomeScrState();
}

class _HomeScrState extends State<HomeScr> {
  List<BookModel> postlist = [];
  List<BookModel> filteredList = []; // List to store filtered results

  

  final url = //api key
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

  void findtheresult(String query) {
    List<BookModel> tempList = [];

    if (query.isNotEmpty) {
      tempList = postlist.where((book) {
        return book.title!.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      tempList = postlist;
    }
    setState(() {
      filteredList = tempList;
    });
  }

  TextEditingController result = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Book Shop'),
        actions: [
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return IconButton(
              
                icon: Icon(Icons.shopping_cart),
                onPressed: () {
                  // Navigate to the bucket screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Bucket()),
                  );
                },
                // Display the number of items in the cart
                tooltip: 'Cart (${cart.cartitems.length})',
              );
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/main_page_bg.png"),
              alignment: Alignment.topCenter,
              fit: BoxFit.fitWidth,
            ),
          ),
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.all(30.0),
                child: TextField(
                  onChanged: (value) {
                    findtheresult(value);
                  },
                  controller: result,
                  scrollPadding: EdgeInsets.all(10),
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    labelText: "Search",
                    hintText: "Search the book",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      // Outline border color
                    ),
                  ),
                ),
              ),
              Expanded(
                child: FutureBuilder(
                  future: getpostapi(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    } else if (snapshot.hasError) {
                      return Center(child: Text("ERROR ${snapshot.error}"));
                    } else {
                      postlist = snapshot.data as List<BookModel>;
                      return GridView.builder(
                        padding: EdgeInsets.all(8),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2, childAspectRatio: 1 / 1.7),
                        itemCount: filteredList.length,
                        itemBuilder: (context, index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Good(
                                    book: filteredList[index],
                                  ),
                                ),
                              );
                            },
                            child: Hero(
                              tag: 'bookImage${filteredList[index].id}',
                              child: Card(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                        
                                         decoration: BoxDecoration(
                                           color: Colors.red.shade300,
                                          borderRadius: BorderRadius.only(topLeft: Radius.circular(10), bottomRight: Radius.circular(10))),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [

                                              Text("  ${CartModel().p} \$", style: TextStyle(
                                                fontSize: 15,
                                                fontWeight: FontWeight.bold
                                              ),),
                                              IconButton(
                                                color: Colors.white,
                                                onPressed: () {
                                                  Provider.of<CartModel>(context, listen: false)
                                                      .addtocart(filteredList[index]);
                                                },
                                                icon: Icon(Icons.add),
                                              ),
                                            ],
                                          ),
                                          ),
                                      
                                      )
                                      ),
                                    Expanded(
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(8),
                                        child: Image.network(
                                          filteredList[index].thumbnail.toString(),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),
                                    Text(
                                      filteredList[index].title.toString(),
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    Text("ID: ${filteredList[index].id.toString()}"),

                                    
                                  ],
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

