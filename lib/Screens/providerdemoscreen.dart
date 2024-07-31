import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../Provider/Dataprovider.dart';

class ProviderDemoScreen extends StatefulWidget {
  const ProviderDemoScreen({Key? key}) : super(key: key);

  @override
  _ProviderDemoScreenState createState() => _ProviderDemoScreenState();
}

class _ProviderDemoScreenState extends State<ProviderDemoScreen> {
  @override
  void initState() {
    super.initState();
    final postModel = Provider.of<DataClass>(context, listen: false);
    postModel.getPostData();
  }

  @override
  Widget build(BuildContext context) {
    final postModel = Provider.of<DataClass>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Provider Demo",
          style: TextStyle(fontWeight: FontWeight.bold),),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: postModel.loading?Center(
          child: Container(
            child: SpinKitDoubleBounce(
              itemBuilder: (BuildContext context, int index) {
                return DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: index.isEven ? Colors.red : Colors.green,
                  ),
                );
              },
            ),
          ),
        ):Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 40, bottom: 20),
                child: Text(
                  "Title: ${postModel.post?.title ?? ""}",
                  style:
                  TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
              Container(
                child: Text("Body: ${postModel.post?.body ?? " "}"),
              )
            ],
          ),
        ),
      ),
    );
  }
}