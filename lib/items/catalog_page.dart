import 'package:flutter/material.dart';
import 'package:sinbal/items/item_catalog.dart';

class CatalogListTile extends StatelessWidget {
  final image;

  CatalogListTile({required this.image});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ItemCatalog(image: image),
        ));

      },
      child: Container(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              image: DecorationImage(
                image: NetworkImage(image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          title: Text('Обувь'),
        ),
      ),
    );
  }
}