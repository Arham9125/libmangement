import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:libmanagement/components/directory.dart';

class DatabaseOptions extends StatelessWidget {
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
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: bookname,
                decoration: InputDecoration(
                  labelText: "BookName",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: number,
                decoration: InputDecoration(
                  labelText: "Number",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                controller: address,
                decoration: InputDecoration(
                  labelText: "Address",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20)
                  )
                ),
              
              ),
            ),
           
            Container(
              padding: EdgeInsets.all(10),
              width: double.infinity,
              height: 80,
              child: ElevatedButton(
                onPressed: () {
                  create( name.text, bookname.text, number.text, address.text);
                },
                child: Text("Create"),
              ),
            ),
          ],
        ),
      ),
    );
  }

}
