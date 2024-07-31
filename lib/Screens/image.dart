import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider_api/Screens/profiledetails.dart';

class ImageViewGrid extends StatelessWidget {
  final int? id;
  final String? imageUrl;
  final String? title;

  ImageViewGrid(this.id, this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(25)
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: GridTile(
          footer: GridTileBar(
            backgroundColor: Colors.black87,
            leading: IconButton(
              icon: const Icon(Icons.favorite),
              color: Colors.red,
              onPressed: () {},
            ),
            title: Text(
              title!,
              textAlign: TextAlign.center,
            ),
            subtitle: Text(title!),
            trailing: IconButton(
              icon: const Icon(
                Icons.call,
              ),
              onPressed: () {},
              color: Theme.of(context).primaryColor,
            ),
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(
                ProfileDetailedScreen.routeName,
                arguments: id,
              );
            },
            child: Image.network(
              imageUrl!,
              height: 100,
              width: 100,

            ),
          ),
        ),
      ),
    );
  }
}
class ImageView extends StatelessWidget {
  final String? imageUrl;
  final String? title;
  final int? id;

  ImageView(this.id, this.imageUrl, this.title);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        InkWell(
          onTap: (() {
            Navigator.of(context).pushNamed(
              ProfileDetailedScreen.routeName,
              arguments: id,
            );
          }),
          child: Container(

            height: 150,
            width: 160,
            decoration: BoxDecoration(
                color: Colors.white,
              borderRadius: BorderRadius.circular(25)
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl!,
                height: 50,
                width: 50,

              ),
            ),
          ),
        ),
        Positioned(
            bottom: 5,
            child: Container(
            padding: EdgeInsets.all(8),
              width: 160,
              height: 60,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black54),
              alignment: Alignment.topLeft,
              child: Text(
                overflow: TextOverflow.fade,
                maxLines: 2,
                title!,
                textAlign: TextAlign.left,
                style:
                const TextStyle(fontSize: 12,color: Color.fromARGB(221, 255, 255, 255)),
              ),
            ))
      ],
    );
  }
}