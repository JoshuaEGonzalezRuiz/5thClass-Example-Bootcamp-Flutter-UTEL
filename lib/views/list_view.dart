import 'package:class_five_example/widgets/list_container.dart';
import 'package:flutter/material.dart';

import '../models/animals.dart';

class ListViewPage extends StatefulWidget {
  final bool horizontalMode;
  final bool galleryMode;
  final ScrollController scrollController;
  final Color colorSchemeColor;

  const ListViewPage({
    Key? key,
    required this.horizontalMode,
    required this.galleryMode,
    required this.scrollController,
    required this.colorSchemeColor,
  }) : super(key: key);

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: widget.horizontalMode ? 350 : null,
        child: ListView(
          controller: widget.scrollController,
          scrollDirection:
              widget.horizontalMode ? Axis.horizontal : Axis.vertical,
          clipBehavior: Clip.antiAlias,
          shrinkWrap: true,
          children: animalesVenenosos
              .map((animalVenenoso) => ListContainer(
                    height: height,
                    width: width,
                    animalVenenoso: animalVenenoso,
                    horizontalMode: widget.horizontalMode,
                    galleryMode: widget.galleryMode,
                    colorSchemeColor: widget.colorSchemeColor,
                  ))
              .toList(),
        ),
      ),
    );
  }
}
