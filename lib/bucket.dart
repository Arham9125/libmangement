import 'package:flutter/material.dart';
import 'package:libmanagement/function/cart.dart';
import 'package:provider/provider.dart';

class Bucket extends StatelessWidget {
  
double price = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.cartitems.length,
                  itemBuilder: (context, index) {
                    final item = cart.cartitems[index];
                    return ListTile(
                      title: Text(item.title),
                    );
                  },
                ),
              ),
              Text('Total Price:'), // Displaying the total price
            ],
          );
        },
      ),
    );
  }
}
