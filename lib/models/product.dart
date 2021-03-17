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
      title: 'Онигири',
      description:
          'Название онигири происходит от глагола нигиру (сжимать), что в точности отражает процесс их приготовления.',
      price: 77.99,
      color: '0xFFb5c6ff',
      imgUrl:
          'https://grandkulinar.ru/uploads/posts/2015-12/1449679951_onigiri_sushi_risovye_shariki.jpg',
    ),
    Product(
      id: 'p2',
      title: 'Рамэн с курицей',
      description:
          'Родина рамэна — Китай, и в Японии её также называют тюка-соба (китайская лапша), в Корее — рамён (кор. 라면). Японцы стали есть её в 1910-х годах[источник?], примерно в то время, когда китайская кухня стала привлекать к себе широкое внимание. Когда это блюдо впервые появилось в Японии, его в основном продавали в маленьких уличных кафе-ларьках «рамэн-я».',
      price: 99.99,
      imgUrl:
          'https://the-challenger.ru/wp-content/uploads/2018/05/shutterstock_379968754-800x577.jpg',
      color: '0xFFF8BBD0',
    ),
    Product(
      id: 'p3',
      title: 'Соба с овощами',
      description:
          'Охлажденную собу обычно выносят на бамбуковом подносе дзару (яп. 笊). Блюдо нередко украшают листьями высушенного нори и заправляют специальным соусом соба цую (яп. 蕎麦つゆ). Этот соус готовят из смеси бульона даси, сладкого соевого соуса (яп. 砂糖醤油) и рисового вина мирин. Перед тем как съесть лапшу её обычно окунают в соус, иногда смешивая его с васаби. После употребления многие выпивают остатки соуса, смешенного с водой',
      price: 15.00,
      imgUrl:
          'https://img-global.cpcdn.com/recipes/6092dd0c2e22b6a3/1200x630cq70/photo.jpg',
      color: '0xFFFFF59D',
    ),
    Product(
      id: 'p4',
      title: 'Тэмпура с креветками',
      description:
          'Это название объединяло по три дня в начале лета, осени, зимы и весны, в которые католики должны были соблюдать пост.',
      price: 35.99,
      imgUrl:
          'https://static-sl.insales.ru/images/products/1/6280/9689224/large_0696106001332662607_Tempura_prawns.jpg',
      color: '0xFFCCFF90',
    ),
    Product(
      color: '0xFFb5c6ff',
      id: 'p5',
      title: 'Тонкацу',
      price: 12.50,
      description:
          'Кусочки отбитого свиного филе обваливают в муке, яйце, а затем в панировке панко. Получившиеся котлеты зажаривают во фритюре, или, в более диетическом варианте, запекают в духовке. Отбивные обычно подают вместе с нашинкованной капустой, долькой лимона и соусом тонкацу (вустерский соус, загущённый фруктовыми и овощными пюре). В ресторанах в дополнение к этому блюду зачастую подают пиалу варёного риса и тарелку мисосиру.',
      imgUrl:
          'https://s1.eda.ru/StaticContent/Photos/140424040926/140430174344/p_O.jpg',
    )
  ];

  UnmodifiableListView<Product> get items => UnmodifiableListView(_items);

  Product getElementById(String id) =>
      _items.singleWhere((element) => element.id == id);
}
