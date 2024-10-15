import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/all_posters.dart';
import 'main_page.dart';

class PostersScreen extends StatefulWidget {
  const PostersScreen({super.key});

  @override
  State<PostersScreen> createState() => _PostersScreenState();
}

class _PostersScreenState extends State<PostersScreen> {
  final PostersController postersController = Get.put(PostersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size(double.infinity, 70),
        child: AppBar(
          title: Image.asset(
            "assets/logo.webp",
            width: 90,
            height: 90,
          ),
          backgroundColor: Colors.white,
          elevation: 10,
        ),
      ),
      body: Obx(() {
        if (postersController.isLoading.value) {
          return Center(child: CircularProgressIndicator());
        } else {
          return LayoutBuilder(
            builder: (context, constraints) {
              double width = constraints.maxWidth;

              int crossAxisCount = 2;
              double containerHeight = 200;
              if (width > 1200) {
                crossAxisCount = 4;
                containerHeight = 350;
              } else if (width > 800) {
                crossAxisCount = 4;
                containerHeight = 300;
              } else if (width > 600) {
                containerHeight = 250;
                crossAxisCount = 3;
              }

              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: (width / crossAxisCount) / containerHeight,
                ),
                itemCount: postersController.postersList.length,
                itemBuilder: (context, index) {
                  final poster = postersController.postersList[index];
                  return Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        HoverContainer(
                          height: containerHeight,
                          imageUrl:
                              "https://brandvillab.leadgenadvertisements.com/${poster.image}" ??
                                  '',
                          width: double.infinity,
                        ),
                        Positioned(
                          right: 10,
                          top: 10,
                          child: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () {
                              postersController.deletePoster(poster.id!);
                              setState(() {
                                postersController.postersList.removeWhere(
                                    (posters) => posters.id == poster.id);
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            },
          );
        }
      }),
    );
  }
}
