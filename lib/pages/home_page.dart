import 'package:coctails/models/product.dart';
import 'package:coctails/widgets/bottom_bar.dart';
import 'package:coctails/widgets/catalog.dart';
import 'package:coctails/widgets/item_cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProductDataProvider>(context);

    return Scaffold(
      backgroundColor: Colors.amberAccent,
      body: SafeArea(
        child: Container(
          height: MediaQuery.of(context).size.height - 85,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(35),
                bottomRight: Radius.circular(35),
              )),
          child: ListView(
            padding: const EdgeInsets.all(10.0),
            children: <Widget>[
              Container(
                child: ListTile(
                  title: Text(
                    'Освежающие напитки',
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Больше, чем 100 видов напитков',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  trailing: Icon(Icons.panorama_horizontal),
                ),
              ),
              Container(
                padding: const EdgeInsets.all(5.0),
                height: 290,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: productData.items.length,
                  itemBuilder: (context, int index) =>
                      ChangeNotifierProvider.value(
                    value: productData.items[index],
                    child: ItemCart(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10),
                child: Text('Каталог коктейлей'),
              ),
              ...productData.items.map((value) {
                return CatalogListTile(imgUrl: value.imgUrl);
              }).toList(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomBar(),
    );
  }
}
