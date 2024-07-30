import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Provider/profileprovider.dart';

class ProfileDetailedScreen extends StatefulWidget {
  const ProfileDetailedScreen({super.key});

  static const routeName = '/product-detail';
  @override
  State<ProfileDetailedScreen> createState() => _ProfileDetailedScreenState();
}

class _ProfileDetailedScreenState extends State<ProfileDetailedScreen> {
  @override
  Widget build(BuildContext context) {
    final profileId = ModalRoute.of(context)!.settings.arguments as int;
    final loadedProduct = Provider.of<ProfileProvider>(
      context,
    ).findById(profileId);

    return Scaffold(
      appBar: AppBar(title: Text(loadedProduct.name)),
      body: Column(
        children: [
          Image.network(loadedProduct.image),
          Text(
            loadedProduct.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}