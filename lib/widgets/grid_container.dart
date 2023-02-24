import 'package:flutter/material.dart';

import '../utils.dart';

class GridContainer extends StatefulWidget {
  final double height;
  final double width;
  final Map<String, dynamic> animalVenenoso;
  final bool horizontalMode;
  final bool galleryMode;
  final Color colorSchemeColor;

  const GridContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.animalVenenoso,
      required this.horizontalMode,
      required this.galleryMode,
      required this.colorSchemeColor})
      : super(key: key);

  @override
  State<GridContainer> createState() => _GridContainerState();
}

class _GridContainerState extends State<GridContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: !widget.galleryMode ? 250 : null,
      width: widget.galleryMode ? 250 : null,
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(0.25),
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Column(
        mainAxisAlignment: widget.galleryMode
            ? MainAxisAlignment.start
            : MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: widget.galleryMode
            ? CrossAxisAlignment.stretch
            : CrossAxisAlignment.center,
        children: [
          Expanded(
              child: ClipRRect(
            borderRadius: const BorderRadius.all(Radius.circular(20)),
            child: Image.network(widget.animalVenenoso["imagen"],
                fit: BoxFit.fill),
          )),
          Visibility(
              visible: !widget.galleryMode,
              child: Flexible(
                  child: Container(
                margin: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: RichText(
                  text: TextSpan(children: [
                    TextSpan(
                        text: "Nombre común: ",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            true)),
                    TextSpan(
                        text: "${widget.animalVenenoso["nombreComun"]}\n",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            false)),
                    TextSpan(
                        text: "Nombre científico: ",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            true)),
                    TextSpan(
                        text: "${widget.animalVenenoso["nombreCientifico"]}\n",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            false)),
                    TextSpan(
                        text: "Region: ",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            true)),
                    TextSpan(
                        text: "${widget.animalVenenoso["region"]}\n",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            false)),
                    TextSpan(
                        text: "Descripción: ",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            true)),
                    TextSpan(
                        text: "${widget.animalVenenoso["descripcion"]}\n",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            false)),
                    TextSpan(
                        text: "Dato Interesante: ",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            true)),
                    TextSpan(
                        text: "${widget.animalVenenoso["datoInteresante"]}",
                        style: descStyle(
                            fontSize(widget.width, widget.height, false),
                            false)),
                  ]),
                )),
              )))
        ],
      ),
    );
  }
}
