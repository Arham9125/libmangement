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
                      trailing:Padding(
                        padding:  EdgeInsets.only(right: 10),
                        child: IconButton(
                            icon: Icon(Icons.remove_circle),
                            onPressed: () {
                              cart.removetocart(index); 
                            },
                          ),
                      ),
                      title: Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Container(
                          height: MediaQuery.of(context).size.height*0.2,
                          width: MediaQuery.of(context).size.width*0.2,
                          child: Card(
                            elevation: 2,
                            child: Center(child: Text("${1 + index} :  ${item.title}", style: TextStyle(fontWeight: FontWeight.bold, 
                            fontSize: 17
                            ),))),
                        ),
                      ),
                    );
                  },
                ),
              ),
             
            ],
          );
        },
      ),
    );
  }
}
