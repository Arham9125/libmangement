import 'package:cloud_firestore/cloud_firestore.dart';

create(String name, bookname, number, address) async {
 
  String documentId = FirebaseFirestore.instance.collection("Detailsbook").doc().id;


  await FirebaseFirestore.instance.collection("Detailsbook").doc(documentId).set({
    'Name': name,
    'Bookname': bookname,
    'Number': number,
    'Address': address,
  });

  print("Document created successfully!");
}


