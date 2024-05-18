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
                    return Dismissible(
                      key: Key(item.id.toString()),
                      direction: DismissDirection.endToStart,
                      onDismissed: (direction) {
                        cart.removetocart(index);
                      },
                      background: Container(
                        alignment: Alignment.centerRight,
                        padding: EdgeInsets.only(right: 20.0),
                        color: Colors.red,
                        child: Icon(
                          Icons.delete,
                          color: Colors.white,
                        ),
                      ),
                      child: Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            border: Border.all(color: Colors.grey),
                          ),
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 100,
                                    height: 100,
                                    child: Image.network(
                                      item.thumbnail ?? '',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    item.title ?? 'No title',
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Price: \$${cart.p.toString()?? '0.00'}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Container(
                  
                  width: double.infinity,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green.shade200
                  ),
                  child: Center(
                    child: Text(
                      "Total: \$${cart.calculateTotal()}",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}



