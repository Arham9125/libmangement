import 'package:flutter/cupertino.dart';
import 'package:libmanagement/model.dart';
import 'package:provider/provider.dart'; // Import provider package
class CartModel extends ChangeNotifier{
 List _shopitem = [];




//List cart items//

List _cartitems = [];

get shopitem => _shopitem;

get cartitems => _cartitems;



//adding to crat//
void addtocart(BookModel book){

_cartitems.add(book);

notifyListeners();

}

//remove
void removetocart(int index){

cartitems.removeAt(index);

notifyListeners();

}

///calculate

 String calculateTotal() {
    double totalPrice = 0;
    for (int i = 0; i < cartitems.length; i++) {
      totalPrice += double.parse(cartitems[i][3]);
    }
    return totalPrice.toStringAsFixed(2);
  }
}





