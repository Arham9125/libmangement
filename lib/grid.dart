import 'package:flutter/material.dart';

import 'package:libmanagement/components/directory.dart';
import 'package:libmanagement/function/databasefunc.dart';
import 'package:libmanagement/model.dart';


class Good extends StatefulWidget {
  final BookModel book;

  Good({required this.book});

  @override
  State<Good> createState() => _GoodState();
}

class _GoodState extends State<Good> {
  final price = 1;

  void _showSuccessDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Do you confirm? "),
          content: Text("Yes I confirm order of  ${price}\$"),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => DatabaseOptions()),
                );
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.7,
            flexibleSpace: FlexibleSpaceBar(
              background: Hero(
                tag: 'bookImage${widget.book.id}',
                child: Image.network(
                  widget.book.thumbnail.toString(),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            pinned: true,
            actions: [
              IconButton(
                onPressed: () {
                  // Handle actions here
                },
                icon: Icon(Icons.more_vert),
              ),
            ],
          ),
          SliverPadding(
            padding: EdgeInsets.all(16.0),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'bookImage${widget.book.id}',
                        child: Image.network(
                          widget.book.thumbnail.toString(),
                          width: 100,
                          height: 150, // Adjust as needed
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              widget.book.title.toString(),
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 8),
                            Text(
                              "PRICE: ${price}\$",
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 16),
                  Text(
                    "Description",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    widget.book.description.toString(),
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  SizedBox(height: 16),
                  GestureDetector(
                    onTap: () {
                      _showSuccessDialog(context);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.greenAccent,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12),
                      alignment: Alignment.center,
                      child: Text(
                        "BUY NOW",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
