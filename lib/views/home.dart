import 'package:class_five_example/controllers/photos_controller.dart';
import 'package:flutter/material.dart';

import 'grid_view.dart';
import 'grid_view_builder.dart';
import 'list_view.dart';
import 'photos_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool showOptions = false;
  bool useBuilders = false;
  bool galleryMode = false;
  bool gridMode = true;
  bool horizontalMode = false;
  ScrollController scrollController = ScrollController();
  late Color colorSchemeColor;
  List<Map<String, dynamic>> photos = [];

  List<Widget> navBarItems = const [
    NavigationDestination(
        icon: Icon(Icons.public), label: 'Animales venenosos'),
    NavigationDestination(icon: Icon(Icons.photo_album), label: 'Fotos'),
  ];
  int itemIndex = 0;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    colorSchemeColor = Theme.of(context).colorScheme.primary.withOpacity(0.25);

    return Scaffold(
      appBar: AppBar(
        title: const Text("U Class 5 Example"),
      ),
      body: Scrollbar(
          thumbVisibility: true,
          controller: scrollController,
          child: itemIndex == 0
              ? gridMode
                  ? useBuilders
                      ? GridViewBuilderPage(
                          scrollController: scrollController,
                          horizontalMode: horizontalMode,
                          galleryMode: galleryMode,
                          colorSchemeColor: colorSchemeColor)
                      : GridViewPage(
                          scrollController: scrollController,
                          horizontalMode: horizontalMode,
                          galleryMode: galleryMode,
                          colorSchemeColor: colorSchemeColor)
                  : ListViewPage(
                      scrollController: scrollController,
                      horizontalMode: horizontalMode,
                      galleryMode: galleryMode,
                      colorSchemeColor: colorSchemeColor)
              : PhotosPage(
                  scrollController: scrollController,
                  colorSchemeColor: colorSchemeColor,
                  photos: photos)),
      endDrawer: itemIndex == 0
          ? Drawer(
              child: Drawer(
                  child: ListView(
                      padding: const EdgeInsets.all(10),
                      children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(40),
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                        color: colorSchemeColor,
                        border: Border.all(
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(20)),
                    child: const Center(
                      child: Text(
                        'Option modes:',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  ListTile(
                    title: const Text("Builders"),
                    trailing: Switch(
                        value: useBuilders,
                        onChanged: (onChanged) {
                          setState(() {
                            useBuilders = !useBuilders;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text("Gallery"),
                    trailing: Switch(
                        value: galleryMode,
                        onChanged: (onChanged) {
                          setState(() {
                            galleryMode = !galleryMode;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text("Horizontal"),
                    trailing: Switch(
                        value: horizontalMode,
                        onChanged: (onChanged) {
                          setState(() {
                            horizontalMode = !horizontalMode;
                          });
                        }),
                  ),
                  ListTile(
                    title: const Text("Cuadrícula"),
                    trailing: Switch(
                        value: gridMode,
                        onChanged: (onChanged) {
                          setState(() {
                            gridMode = !gridMode;
                          });
                        }),
                  ),
                ])))
          : null,
      bottomNavigationBar: NavigationBar(
        destinations: navBarItems,
        selectedIndex: itemIndex,
        onDestinationSelected: (index) async {
          photos = await getPhotos(10);

          setState(() {
            itemIndex = index;
          });
        },
      ),
    );
  }
}
