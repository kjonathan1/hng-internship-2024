import 'package:flutter_dotenv/flutter_dotenv.dart';

class Product {
  String name;
  double price;
  double? stockQty;
  String imgUrl;
  String? currency;
  bool? isAvailable;

  Product(
      {required this.name,
      required this.price,
      required this.imgUrl,
      this.stockQty,
      this.currency,
      this.isAvailable});

  factory Product.fromJson(Map<String, dynamic> map) {
    var currencyMap = map['current_price'][0];
    String currency = currencyMap.keys.toList()[0].toString();
    String imgData = map['photos'][0]['url'];

    return Product(
      name: map['name'],
      isAvailable: map['is_available'] ?? false,
      currency: currency,
      price: double.parse(currencyMap[currency][0].toString()),
      imgUrl: "${dotenv.env['URL_IMAGE_ROOT']!}$imgData",
    );
  }
}
