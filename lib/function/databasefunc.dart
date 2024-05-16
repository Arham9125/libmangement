import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:libmanagement/components/directory.dart';

class DatabaseOptions extends StatelessWidget {
   final String bookName;
   DatabaseOptions({required this.bookName});
  TextEditingController name = TextEditingController();
  TextEditingController number = TextEditingController();
  TextEditingController bookname = TextEditingController();
  TextEditingController address = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('WELCOME'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: name,
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height*0.08,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                
                  border: Border.all(width: 1, color: Colors.black54)
                ),
                child: Center(
                  child: Text("BookName: ${bookName}", textAlign: TextAlign.center, style: TextStyle(
                    
                    fontSize: 15, fontWeight: FontWeight.bold),),
                )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: number,
                decoration: InputDecoration(
                    labelText: "Number",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: address,
                decoration: InputDecoration(
                    labelText: "Address",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20))),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  if (name.text.trim().split(' ').length < 2) {
                    // Name should not be less than 3 words
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Name should have at least 2 words."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else if (number.text.trim().length < 11) {
                    // Number should be at least 11 digits
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Number should be at least 11 digits."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  }  else if (address.text.trim().isEmpty) {
                    // Address should not be empty
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text("Error"),
                          content: Text("Address should not be empty."),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text("OK"),
                            ),
                          ],
                        );
                      },
                    );
                  } else {
                    // All validation passed, proceed with your operation
                    create(name.text, bookName, number.text, address.text);
                     showDialog(context: context, builder: (context) {
                   return AlertDialog(title: Text("PURCHASE DONE"), content: Text("Thank you for the order !!"),
                   
                   actions: [
                    ElevatedButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("Done"))
                   ],
                    );
                 });
                  }

                
                },
                child: Text("Done"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
