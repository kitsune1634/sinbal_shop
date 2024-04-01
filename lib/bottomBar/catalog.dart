import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sinbal/models/product.dart';
import 'package:sinbal/items/catalog_page.dart';
import 'package:sinbal/cart/item_card.dart';

class Catalog extends StatefulWidget {
  const Catalog({super.key});

  @override
  State<Catalog> createState() => _CatalogState();
}

class _CatalogState extends State<Catalog> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    final productData = context.watch<ProductDataProvider>();

    return Scaffold(
      body: SafeArea(
        child: Container(
            height: MediaQuery.of(context).size.height - 85,
            child: ListView(
              padding: const EdgeInsets.all(10.0),
              children: <Widget>[
                ...productData.productShoes.map((value) {
                  return CatalogListTile(image: value.image);
                }).toList(),
              ],
            )),
      ),
    );
  }
}
