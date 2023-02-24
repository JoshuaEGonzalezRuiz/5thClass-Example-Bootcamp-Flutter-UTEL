import 'package:class_five_example/widgets/grid_container.dart';
import 'package:flutter/material.dart';
import 'package:class_five_example/models/animals.dart';

class GridViewPage extends StatefulWidget {
  final bool horizontalMode;
  final bool galleryMode;
  final ScrollController scrollController;
  final Color colorSchemeColor;

  const GridViewPage(
      {Key? key,
      required this.horizontalMode,
      required this.galleryMode,
      required this.scrollController,
      required this.colorSchemeColor})
      : super(key: key);

  @override
  State<GridViewPage> createState() => _GridViewPageState();
}

class _GridViewPageState extends State<GridViewPage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return GridView(
      controller: widget.scrollController,
      scrollDirection: widget.horizontalMode && height > 450
          ? Axis.horizontal
          : Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 5.0,
        crossAxisSpacing: 5.0,
        childAspectRatio: widget.horizontalMode && height > 450 ? 1 : 3 / 4,
        crossAxisCount: widget.horizontalMode && height > 450
            ? height > 850
                ? 2
                : 1
            : widget.galleryMode
                ? width > 1250
                    ? 5
                    : width > 950
                        ? 4
                        : 3
                : width > 1500
                    ? 4
                    : width > 1050
                        ? 3
                        : width < 500 ? 1 : 2,
      ),
      children: animalesVenenosos
          .map((animalVenenoso) => GridContainer(
              height: height,
              width: width,
              animalVenenoso: animalVenenoso,
              horizontalMode: widget.horizontalMode,
              galleryMode: widget.galleryMode,
              colorSchemeColor: widget.colorSchemeColor))
          .toList(),
    );
  }
}
