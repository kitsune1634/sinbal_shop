import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinbal/cart/item_page.dart';

import '../models/Cart.dart';
import '../models/Product.dart';

class ItemCard extends StatefulWidget {

  @override
  State<ItemCard> createState() => _ItemCardState();
}

class _ItemCardState extends State<ItemCard> {
  @override
  Widget build(BuildContext context) {
    final product = Provider.of<Product>(context, listen: false);
    //final product = context.read<Product>();

    print('build ItemCard');

    return Container(
      width: 150,
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(5.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.0),
        color: Color(int.parse(product.color)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) =>
                  ItemPage(productId: product.id)),
              );
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Container(
                  height: 160,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(product.image),
                        fit: BoxFit.cover,
                      )),
                ),
                Container(
                    child: Text(
                      '${product.name}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),

          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text('${product.price}'),
                IconButton(
                    icon: Icon(Icons.add_circle_outline, color: Colors.black12),
                    onPressed: () {
                      Provider.of<CartDataProvider>(context, listen: false)
                          .addItem(
                        productId: product.id,
                        price: product.price,
                        name: product.name,
                        image: product.image,
                      );
                    })
              ],
            ),
          ),

        ],
      ),
    );
  }
}
