import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/profileprovider.dart';
import 'image.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    final productData = Provider.of<ProfileProvider>(context);
    final products = productData.Profiles;

    // fetching the data from the product file where we added the data
    return Scaffold(
        appBar: AppBar(title: Text('Favorites')),
        body: GridView.builder(
            itemCount: products.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 2,
                mainAxisSpacing: 2,
                childAspectRatio: 3 / 2),
            itemBuilder: (context, i) => ImageView(
                products[i].id, products[i].image, products[i].name)));
  }
}