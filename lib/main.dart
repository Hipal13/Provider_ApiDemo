import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_api/Provider/Dataprovider.dart';
import 'package:provider_api/Screens/homepage.dart';
import 'package:provider_api/Screens/providerdemoscreen.dart';
import 'Provider/Todoprovider.dart';
import 'Provider/profileprovider.dart';
import 'Screens/dashbard.dart';
import 'Screens/profiledetails.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // this is used only when we perform multiple providers
        providers: [
          ChangeNotifierProvider<ProfileProvider>(
            create: (_) => ProfileProvider(), // Calling Provider
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'API Call',
          theme: ThemeData(
            primarySwatch: Colors.orange,
          ),
          home: const Dashboard(),
          routes: {
            // Navigating the page using Named Routes
            ProfileDetailedScreen.routeName: (ctx) => ProfileDetailedScreen(),
          },
        ));
  }
}
