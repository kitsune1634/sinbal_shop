/*
import 'dart:async';

import 'package:sinbal/database/database.dart';
import 'package:sinbal/database/product.dart';

abstract class DbEvent {}

class AllProductEvent extends DbEvent {}

class NewProductEvent extends DbEvent {
  late Product _product;

  NewProductEvent(Product product) {
    _product = product;
  }
}

class DbProduct {
  List<Product> _list = [];

  final _listProductStateController = StreamController<List<Product>>();

  StreamSink<List<Product>> get _inListProduct => _listProductStateController.sink;

  Stream<List<Product>> get listProduct => _listProductStateController.stream;

  final _dbEventController = StreamController<DbEvent>();

  Sink<DbEvent> get dbEventSink => _dbEventController.sink;

  DbBloc() {
    _dbEventController.stream.listen(_eventToState);
  }

  Future<void> _eventToState(DbEvent event) async {
    if (event is AllProductEvent) {
      _list = await DBProvider.db.getAllProduct();
    } else if (event is NewProductEvent) {
      DBProvider.db.newProduct(event._product);
    } else {
      throw Exception('Error');
    }
    _inListProduct.add(_list);
  }

  void disponse() {
    _dbEventController.close();
    _listProductStateController.close();
  }
}
*/






/*

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
 */