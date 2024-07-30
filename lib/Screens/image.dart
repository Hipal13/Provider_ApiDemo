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
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        footer: GridTileBar(
          backgroundColor: Colors.black87,
          leading: IconButton(
            icon: const Icon(Icons.favorite),
            color: Theme.of(context).primaryColor,
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
            fit: BoxFit.cover,
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
          child: SizedBox(
            height: 250,
            width: 250,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl!,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Positioned(
            bottom: 0,
            child: Container(
              width: 250,
              height: 30,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: Colors.black54),
              alignment: Alignment.center,
              child: Text(
                title!,
                textAlign: TextAlign.center,
                style:
                const TextStyle(color: Color.fromARGB(221, 255, 255, 255)),
              ),
            ))
      ],
    );
  }
}