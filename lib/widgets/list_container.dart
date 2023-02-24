import 'package:flutter/material.dart';

import '../utils.dart';

class ListContainer extends StatefulWidget {
  final double height;
  final double width;
  final Map<String, dynamic> animalVenenoso;
  final bool horizontalMode;
  final bool galleryMode;
  final Color colorSchemeColor;

  const ListContainer(
      {Key? key,
      required this.height,
      required this.width,
      required this.animalVenenoso,
      required this.horizontalMode,
      required this.galleryMode,
      required this.colorSchemeColor})
      : super(key: key);

  @override
  State<ListContainer> createState() => _ListContainerState();
}

class _ListContainerState extends State<ListContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: !widget.galleryMode
          ? widget.width < 500 ? widget.width * 0.35 : widget.width * 0.25
          : widget.width > 700
              ? 450
              : widget.width > 650
                  ? 400
                  : widget.width > 550
                      ? 350
                      : 300,
      width: widget.horizontalMode
          ? widget.width < 750
              ? 320
              : 630
          : null,
      margin: const EdgeInsets.all(40),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: widget.colorSchemeColor,
          border: Border.all(width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(20))),
      child: Row(
        children: [
          Flexible(
              fit: FlexFit.tight,
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                child: Image.network(widget.animalVenenoso["imagen"],
                    fit: BoxFit.fill),
              )),
          Visibility(
              visible: !widget.galleryMode,
              child: Flexible(
                  fit: FlexFit.tight,
                  child: Container(
                    height: widget.height * 0.5,
                    margin: const EdgeInsets.only(left: 10, right: 10),
                    alignment: Alignment.center,
                    child: SingleChildScrollView(
                        child: RichText(
                      text: TextSpan(children: [
                        TextSpan(
                            text: "Nombre común: ",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                true)),
                        TextSpan(
                            text: "${widget.animalVenenoso["nombreComun"]}\n",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                false)),
                        TextSpan(
                            text: "Nombre científico: ",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                true)),
                        TextSpan(
                            text:
                                "${widget.animalVenenoso["nombreCientifico"]}\n",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                false)),
                        TextSpan(
                            text: "Region: ",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                true)),
                        TextSpan(
                            text: "${widget.animalVenenoso["region"]}\n",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                false)),
                        TextSpan(
                            text: "Descripción: ",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                true)),
                        TextSpan(
                            text: "${widget.animalVenenoso["descripcion"]}\n",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                false)),
                        TextSpan(
                            text: "Dato Interesante: ",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                true)),
                        TextSpan(
                            text: "${widget.animalVenenoso["datoInteresante"]}",
                            style: descStyle(
                                fontSize(widget.width, widget.height, true),
                                false))
                      ]),
                    )),
                  )))
        ],
      ),
    );
  }
}
