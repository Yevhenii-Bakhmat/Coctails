import 'package:coctails/models/cart.dart';
import 'package:coctails/widgets/cart_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartData = Provider.of<CartDataProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Корзинка счастья'),
      ),
      body: cartData.cartItems.isEmpty
          ? Card(
              elevation: 5.0,
              margin: const EdgeInsets.all(30.0),
              child: Container(
                width: double.infinity,
                height: 100,
                alignment: Alignment.center,
                child: Text('Корзина пустая'),
              ),
            )
          : Column(
              children: <Widget>[
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      'Стоимость: ' + cartData.totalAmount.toStringAsFixed(2),
                      style: TextStyle(fontSize: 20.0),
                    ),
                    MaterialButton(
                      onPressed: () {
                        cartData.clear();
                      },
                      color: Theme.of(context).primaryColor,
                      child: Text('Купить!'),
                    ),
                  ],
                ),
                Divider(),
                Expanded(
                  child: CartItemList(cartData: cartData),
                ),
              ],
            ),
    );
  }
}
