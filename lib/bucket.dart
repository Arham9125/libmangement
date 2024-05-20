import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:libmanagement/function/cart.dart';
import 'package:libmanagement/function/databasefunc.dart';
import 'package:libmanagement/function/dbs.dart';
import 'package:libmanagement/model.dart';
import 'package:provider/provider.dart';

class Bucket extends StatelessWidget {
  final BookModel book = BookModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CART"),
        centerTitle: true,
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: cart.cartitems.isEmpty ? 1 : cart.cartitems.length,
                  itemBuilder: (context, index) {
                    if (cart.cartitems.isEmpty) {
                      return Center(
                        child: Text("Cart is Empty"),
                      );
                    } else {
                      final item = cart.cartitems[index];
                      return Padding(
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
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Image.network(
                                        "${item.thumbnail}",
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: 10),
                                  Flexible(
                                    child: Text(
                                      "${item.title}",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12,
                                      ),
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  SizedBox(width: MediaQuery.of(context).size.width * 0.19),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: Card(
                                        shadowColor: Colors.red,
                                        elevation: 2,
                                        child: IconButton(
                                          onPressed: () {
                                            Provider.of<CartModel>(context, listen: false)
                                                .removetocart(index);
                                          },
                                          icon: Icon(Icons.delete, color: Colors.red),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Text(
                                "Price: \$${cart.p.toString()}",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }
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
                    color: Colors.green.shade200,
                  ),
                  child: Center(
                    child: GestureDetector(
                      onTap: () {
                       BookModel book = BookModel();
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
                          return DatabaseOption(bookName: book.toString(),);
                        }));
                      },
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
              ),
            ],
          );
        },
      ),
    );
  }
}
