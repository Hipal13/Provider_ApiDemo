import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Models/profilemodel.dart';
import '../Provider/profileprovider.dart';
import 'image.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Profile>? profiles;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<ProfileProvider>(context, listen: false).getAllProfile();
    });
  }

  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<ProfileProvider>(context);
    final profiles = profileData.Profiles;
    double height() => MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sample API',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold)),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  ' New Matches',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextButton(
                  onPressed: () {},
                  child: const Text('see all'),
                )
              ],
            ),
            SingleChildScrollView(
              child: SizedBox(
                height: height() * 0.2,
                child: ListView.builder(
                    itemCount: profiles.take(12).length,
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.all(8),
                        child: ImageView(profiles[index].id,
                            profiles[index].image, profiles[index].name),
                      );
                    }),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(' All Matches',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextButton(
                  onPressed: () {},
                  child: const Text('see all'),
                )
              ],
            ),
            SingleChildScrollView(
              child: Container(
                margin: const EdgeInsets.all(8),
                height: height() * 0.6,
                child: GridView.builder(
                    itemCount: profiles.length,
                    gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1 / 1,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10),
                    itemBuilder: (ctx, i) => ImageViewGrid(
                        profiles[i].id, profiles[i].image, profiles[i].name)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}