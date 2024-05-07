

import 'package:flutter/material.dart';
import 'package:libmanagement/model.dart';
import 'package:url_launcher/url_launcher.dart';

class Good extends StatefulWidget {
  final BookModel book;

  Good({required this.book});

  @override
  State<Good> createState() => _GoodState();
}

class _GoodState extends State<Good> {
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("images/bg.png"),
                    alignment: Alignment.topCenter,
                    fit: BoxFit.fitWidth,
                  ),
                  ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 20),
              Image.network(
                widget.book.thumbnail.toString(),
                fit: BoxFit.contain,
              ),
              SizedBox(height: 20),
              Text(
                widget.book.title.toString(),
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                 final link = widget.book.bookUrl.toString(); 
                launchUrl(
                  Uri.parse(link),
                  mode: LaunchMode.inAppWebView
                );
                  
                },
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    padding: EdgeInsets.symmetric(horizontal: 9, vertical: 2),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.green, width: 2),
                      borderRadius: BorderRadius.circular(10),
                      
                    ),
                    child: Text(
                     "To view full book",
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: SingleChildScrollView(
                    child: Text(
                      "Description: ${widget.book.description.toString()}",
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
