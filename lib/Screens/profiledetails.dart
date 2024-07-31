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
      appBar: AppBar(
          title: Text(loadedProduct.name,maxLines: 2,style: TextStyle(fontWeight: FontWeight.bold,),)),
      body: Column(
        children: [
          SizedBox(height: 20,),
          Container(color: Colors.white,
            height: 400,
            width: 400,
            child: Image.network(loadedProduct.image,height: 200,
            width: 200,),
          ),
          SizedBox(height: 20,),
          Text(
            loadedProduct.name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
            ),
          ),
        ],
      ),
    );
  }
}