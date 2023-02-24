import 'package:class_five_example/widgets/list_container.dart';
import 'package:flutter/material.dart';

import '../models/animals.dart';

class ListViewBuilderPage extends StatefulWidget {
  final bool horizontalMode;
  final bool galleryMode;
  final ScrollController scrollController;
  final Color colorSchemeColor;

  const ListViewBuilderPage({
    Key? key,
    required this.horizontalMode,
    required this.galleryMode,
    required this.scrollController,
    required this.colorSchemeColor,
  }) : super(key: key);

  @override
  State<ListViewBuilderPage> createState() => _ListViewBuilderPageState();
}

class _ListViewBuilderPageState extends State<ListViewBuilderPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Center(
      child: SizedBox(
        height: widget.horizontalMode ? 350 : null,
        child: ListView.builder(
          controller: widget.scrollController,
          scrollDirection:
              widget.horizontalMode ? Axis.horizontal : Axis.vertical,
          clipBehavior: Clip.antiAlias,
          shrinkWrap: true,
          itemCount: animalesVenenosos.length,
          itemBuilder: (context, index) {
            return ListContainer(
              height: height,
              width: width,
              animalVenenoso: animalesVenenosos[index],
              horizontalMode: widget.horizontalMode,
              galleryMode: widget.galleryMode,
              colorSchemeColor: widget.colorSchemeColor,
            );
          },
        ),
      ),
    );
  }
}
