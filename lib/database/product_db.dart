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