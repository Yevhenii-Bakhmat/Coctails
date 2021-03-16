import 'dart:collection';

import 'package:flutter/foundation.dart';

class Product with ChangeNotifier {
  final String id;
  final String title;
  final String description;
  final num price;
  final String imgUrl;
  final color;

  Product(
      {@required this.id,
      @required this.title,
      @required this.description,
      @required this.price,
      @required this.imgUrl,
      @required this.color});
}

class ProductDataProvider with ChangeNotifier {
  List<Product> _items = [
    Product(
      id: 'p1',
      title: 'Весенне пробуждение',
      description: 'Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 77.99,
      color: '0xFFBBDEFB',
      imgUrl:
          'https://hg-images.condecdn.net/image/m9kmKQ4JKBn/crop/810/landscape/f/Turquoise-Tonic-house-29may15_pr_b.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Летний обалдеоз',
      description: 'Ты получишь настоящее удовольствие, когда попробуешь!!',
      price: 99.99,
      imgUrl:
          'https://brownthumbmama.com/wp-content/uploads/2020/06/watermelon-limeade-square.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p3',
      title: 'Желтый взрыв счастья',
      description: ' Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 15.00,
      imgUrl:
          'https://spirits-navigator.com/wp-content/uploads/2020/02/asset_3236372.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p4',
      title: 'Зеленый обморок',
      description: ' Ты получишь настоящее удовольствие, когда попробуешь!',
      price: 35.99,
      imgUrl:
          'https://www.baconismagic.ca/wp-content/uploads/2018/02/Cuba-libre-cocktail-recipe-720x720.jpg',
      color: '0xFFCCFF90',
    ),
    Product(
      color: '0xFFb5c6ff',
      id: 'p5',
      title: 'Оазис',
      price: 12.50,
      description:
          'Напитки голубого цвета были «последним писком моды» во время коктейльного бума 80-х. Эта смесь особенно хороша.',
      imgUrl: 'https://img1.russianfood.com/dycontent/images_upl/3/sm_2141.jpg',
    )
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((element) => element.id == id);
}
