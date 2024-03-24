import 'package:flutter/material.dart';
import 'package:sinbal/database/database.dart';
import 'package:sinbal/database/product.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<Product> product = [];

  final Product _product = Product(name: "", size: 0, color: "", price: 0);

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: allProduct(),
    );
  }

  allProduct() {
    return FutureBuilder<List<Product>>(
      future: DBProvider.db.getAllProduct(),
      builder: (BuildContext context, AsyncSnapshot<List<Product>> snapshot) {
        if (snapshot.hasData) {
          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  padding: const EdgeInsets.all(8),
                  itemCount: snapshot.data?.length,
                  itemBuilder: (BuildContext context, int index) {
                    Product item = snapshot.data![index];
                    return Dismissible(
                      key: UniqueKey(),
                      onDismissed: (direction) {
                        DBProvider.db.deleteProduct(item.id);
                      },
                      background: Container(color: Colors.black12),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[45],
                          border: Border.all(
                            color: Colors.deepPurple,
                            width: 1,
                          ),
                          borderRadius: const BorderRadius.all(Radius.circular(15)),
                        ),
                        padding:
                        EdgeInsets.only(top: 20, bottom: 15, left: 10, right: 10),
                        margin: EdgeInsets.only(bottom: 10.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    productShoes.name,
                                    softWrap: true,
                                    style: TextStyle(
                                        fontSize: 17,
                                        decoration: TextDecoration.underline
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Flexible(
                                  child: Text(
                                    productShoes.color,
                                    softWrap: true,
                                    style: TextStyle(
                                      fontSize: 17,
                                      // fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Text(
                                  productShoes.price.toString(),
                                  style: TextStyle(fontSize: 15),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
