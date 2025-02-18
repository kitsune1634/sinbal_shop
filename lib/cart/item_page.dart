import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:sinbal/bottomBar/cart.dart';

import '../models/Cart.dart';
import '../models/Product.dart';

class ItemPage extends StatelessWidget {

  final String productId;

  ItemPage({required this.productId});

  @override
  Widget build(BuildContext context) {

    final data = context.watch<ProductDataProvider>()
        .getElementById(productId);

    return Scaffold(
      appBar: AppBar(
        title: Text(data.name, style: GoogleFonts.marmelad(),),
      ),
      body: Container(
        child: ListView(
          children: <Widget>[
            Hero(
              tag: data.image,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(data.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),

            Card(
              elevation: 5.0,
              margin: const EdgeInsets.symmetric(horizontal: 35.0, vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.all(30.0),
                child: Column(
                  children: <Widget>[
                    Text(data.name, style: TextStyle(fontSize: 26.0),),
                    Divider(),
                    Row(
                      children: <Widget>[
                        Text('Цена: ', style: TextStyle(fontSize: 24.0),),
                        Text('${data.price}', style: TextStyle(fontSize: 24.0),),
                      ],
                    ),
                    Divider(),
                    Text(data.name),

                    SizedBox(
                      height: 20.0,
                    ),

                    //Provider.of<CartDataProvider>(context)
                    context.watch<CartDataProvider>()
                        .cartItems
                        .containsKey(productId)
                        ? Column(
                      children: <Widget>[
                        MaterialButton(
                            color: Color(0xFFCCFF90),
                            child: Text('Перейти в корзину'),
                            onPressed: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => CartPage(),
                              ));
                            }
                        ),
                        Text(
                          'Товар уже добавлен в корзину',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.blueGrey,
                          ),
                        )
                      ],
                    )
                        : MaterialButton(
                      color: Theme.of(context).primaryColor,
                      child: Text('Добавить в корзину'),
                      onPressed: () {
                        context.read<CartDataProvider>().addItem(
                          productId: data.id,
                          image: data.image,
                          name: data.name,
                          price: data.price,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}