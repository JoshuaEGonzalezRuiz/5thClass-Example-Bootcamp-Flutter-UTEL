import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import '../controllers/photos_controller.dart';

class PhotosPage extends StatefulWidget {
  final ScrollController scrollController;
  final Color colorSchemeColor;
  final List<Map<String, dynamic>> photos;

  const PhotosPage(
      {Key? key,
      required this.scrollController,
      required this.colorSchemeColor,
      required this.photos})
      : super(key: key);

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  List<Map<String, dynamic>> photos = [];
  int count = 10;
  ToastContext toastContext = ToastContext();

  @override
  void initState() {
    toastContext.init(context);
    super.initState();
  }

  Future<void> refreshPhotos() async {
    count += 10;
    List<Map<String, dynamic>> newPhotos = await getPhotos(count);

    setState(() {
      photos.clear();
      for (var photo in newPhotos) {
        photos.add(photo);
      }
    });

    Toast.show("Ahora se muestran: $count fotos");
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    photos = widget.photos;

    return Center(
      child: RefreshIndicator(
        onRefresh: refreshPhotos,
        child: Visibility(
          visible: photos.isNotEmpty,
          replacement: const Center(
            child: CircularProgressIndicator(),
          ),
          child: GridView.builder(
            controller: widget.scrollController,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: width > 1600
                    ? 6
                    : width > 1200
                        ? 4
                        : width > 800
                            ? 3
                            : width > 600
                                ? 2
                                : 1,
                mainAxisSpacing: 5.0,
                crossAxisSpacing: 5.0,
                childAspectRatio: 3 / 4),
            itemCount: photos.length,
            itemBuilder: (context, index) {
              return Container(
                height: MediaQuery.of(context).size.height * 0.25,
                width: MediaQuery.of(context).size.width * 0.25,
                margin: const EdgeInsets.all(20),
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                    color: Color(int.parse(photos[index]
                            .entries
                            .firstWhere((element) => element.key == 'color')
                            .value
                            .toString()
                            .replaceAll("#", "0x")))
                        .withOpacity(0.25),
                    border: Border.all(width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(20))),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          backgroundImage: NetworkImage(extractData(
                                  photos[index], 'user')
                              .firstWhere(
                                  (element) => element.key == "profile_image")
                              .value
                              .entries
                              .firstWhere((element) => element.key == "small")
                              .value
                              .toString()),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Flexible(
                            child: Text(extractData(photos[index], 'user')
                                .firstWhere((element) => element.key == "name")
                                .value
                                .toString()))
                      ],
                    ),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                    ),
                    Expanded(
                        child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(20)),
                      child: Image.network(
                          extractData(photos[index], 'urls')
                              .firstWhere((element) => element.key == "regular")
                              .value
                              .toString(),
                          fit: BoxFit.fill),
                    )),
                    const Divider(
                      color: Colors.black,
                      height: 20,
                    ),
                    Row(
                      children: [
                        const Icon(Icons.thumb_up),
                        const SizedBox(
                          width: 10,
                        ),
                        Flexible(
                            child: Text(photos[index]
                                .entries
                                .firstWhere((element) => element.key == 'likes')
                                .value
                                .toString()))
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  dynamic extractData(Map<String, dynamic> map, String option) {
    return map.entries
        .firstWhere((element) => element.key == option)
        .value
        .entries;
  }
}
