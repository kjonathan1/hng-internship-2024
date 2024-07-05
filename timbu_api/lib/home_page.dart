import 'package:flutter/material.dart';
import 'package:timbu_api/models/product_model.dart';
import 'package:timbu_api/models/product_services.dart';
import 'package:timbu_api/widgets/product_widget.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<List?> products;

  @override
  void initState() {
    super.initState();
    products = ProductServices().getPruducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Timbu API"),
      ),
      body: SafeArea(
        child: FutureBuilder<List?>(
          future: products,
          builder: (BuildContext context, AsyncSnapshot<List?> snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is loading, show a loading spinner.
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              // If the future completed with an error, show an error message.
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
              // If the future completed but returned no data, show a message.
              return const Center(
                child: Text('No products found.'),
              );
            } else {
              // If the future completed successfully with data, show the list of products.
              List products = snapshot.data!;
              return ListView.builder(
                itemCount: products.length,
                itemBuilder: (BuildContext context, int index) {
                  var product = Product.fromJson(products[index]);
                  // products[index];
                  // Customize this to display the product details.
                  return ProductTemplate(
                    name: product.name,
                    isAvailable: product.isAvailable,
                    price: product.price,
                    imageUrl: product.imgUrl,
                    stockQty: product.stockQty,
                    currensy: product.currency,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
