import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinbal/items/bottom_bar.dart';
import 'package:sinbal/models/product.dart';
import 'package:sinbal/cart/item_card.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    print('build Home');
    final productData = context.watch<ProductDataProvider>();

    return Scaffold(
        body: Column(
      children: [
        Container(
          child: Flexible(
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: productData.productShoes.length,
                itemBuilder: (context, int index) =>
                    ChangeNotifierProvider.value(
                      value: productData.productShoes[index],
                      child: ItemCard(),
                    )
            ),
          ),
        ),
      ],
    ),
     //   bottomNavigationBar: BottomBar(),
    );
  }
}