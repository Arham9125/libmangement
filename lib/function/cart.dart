import 'package:flutter/cupertino.dart';
import 'package:libmanagement/model.dart';
import 'package:provider/provider.dart'; // Import provider package
class CartModel extends ChangeNotifier{


 final double  _p = 1;


  

 final List<BookModel> _shopitem = [];




//List cart items//

final List _cartitems = [];

double get p => _p;



get shopitem => _shopitem;

get cartitems => _cartitems;



//adding to crat//
void addtocart(BookModel book){

_cartitems.add(book);

notifyListeners();

}


void removetocart(int index){

cartitems.removeAt(index);

notifyListeners();

}

///calculate

String calculateTotal() {
  double totalprice = 0;

  for (int i = 1; i <= _cartitems.length; i++) {
    totalprice = i * p;



  }

  print("Total $totalprice");
  

  return totalprice.toStringAsFixed(2);
}

}






