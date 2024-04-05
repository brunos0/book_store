import 'package:flutter/material.dart';
import 'package:technical_template/app/models/collection.dart';

class CollectionListWidget extends StatefulWidget {
  final List<Collection> list;

  CollectionListWidget({
    required this.list,
  });

  @override
  _CollectionListState createState() => _CollectionListState();
}

class _CollectionListState extends State<CollectionListWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      children: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: getChildren(widget.list),
        )
      ],
    );
  }

  List<Widget> getChildren(List<Collection> collections) {
    return collections
        .map((list) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text(
                    list.name,
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 2),
                  child: AspectRatio(
                    aspectRatio: 16 / 8,
                    child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: list.books.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.network(
                                list.books[index].thumb,
                                fit: BoxFit.fitWidth,
                                scale: 1.0,
                                width: 110,
                                height: 160,
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ))
        .toList();
  }
}
