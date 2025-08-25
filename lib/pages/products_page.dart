import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:go_router_project/data/products.dart';

import '../models/product_model.dart';
import '../router/route_names.dart';

class ProductsPage extends StatelessWidget {
  const ProductsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final productsList = ProductData().productsList;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "All Products",
        ),
      ),
      body: ListView.builder(
          itemCount: productsList.length,
          itemBuilder: (context, index){
            final Product product = productsList[index];
            return Container(
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(10),
              ),
              child: GestureDetector(
                onTap: (){
                  GoRouter.of(context).pushNamed(
                      RouteNamesClass.singleProduct,
                    extra: product,
                  );
                },
                child: ListTile(
                  contentPadding: EdgeInsets.all(10),
                  title: Text(product.title),
                  trailing: Text(product.price.toString()),
                  leading: Image.network(
                    product.imageUrl,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            );
          }
      ),
    );
  }
}
