import 'package:brandvilla/constants/app_text.dart';
import 'package:brandvilla/controllers/cat_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/controller_hovers.dart';
import '../controllers/poster_controller.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final HoverControl hoverControl = Get.put(HoverControl());

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
          // actions: [
          //   Padding(
          //     padding: const EdgeInsets.only(top: 15.0),
          //     child: Center(
          //       child: Obx(() => InkWell(
          //             onTap: () {},
          //             onHover: (val) {
          //               hoverControl.updateLoginHover(val);
          //             },
          //             child: Container(
          //               width: 80,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(6),
          //                   color: hoverControl.loginHover.value
          //                       ? AppColors.primaryColor
          //                       : Colors.white,
          //                   border: Border.all(color: AppColors.primaryColor)),
          //               alignment: Alignment.center,
          //               child: AppText(
          //                 text: "Login",
          //                 color: hoverControl.loginHover.value
          //                     ? AppColors.white
          //                     : AppColors.primaryColor,
          //               ),
          //             ),
          //           )),
          //     ),
          //   ),
          //   SizedBox(
          //     width: 2.w,
          //   ),
          //   Padding(
          //     padding: const EdgeInsets.only(top: 15.0),
          //     child: Center(
          //       child: Obx(() => InkWell(
          //             onTap: () {},
          //             onHover: (val) {
          //               hoverControl.updateSignUpHover(val);
          //             },
          //             child: Container(
          //               width: 80,
          //               height: 40,
          //               decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(6),
          //                   color: hoverControl.signUpHover.value
          //                       ? AppColors.white
          //                       : AppColors.primaryColor,
          //                   border: Border.all(color: AppColors.primaryColor)),
          //               alignment: Alignment.center,
          //               child: AppText(
          //                 text: "Signup",
          //                 color: hoverControl.signUpHover.value
          //                     ? AppColors.primaryColor
          //                     : AppColors.white,
          //               ),
          //             ),
          //           )),
          //     ),
          //   ),
          //   SizedBox(
          //     width: 5.w,
          //   ),
          // ],
        ),
      ),
      body: GetBuilder<PostersController>(
          init: PostersController(),
          builder: (postersController) {
            return Center(
              child: Obx(() {
                if (postersController.isLoading.value) {
                  // Show shimmer while loading
                  return LayoutBuilder(builder: (context, constraints) {
                    double width = constraints.maxWidth;
                    int crossAxisCount = getCrossAxisCount(width);
                    double containerHeight = getContainerHeight(width);
                    return buildShimmerEffect(
                      (width / crossAxisCount) - 20,
                      containerHeight,
                    );
                  });
                } else if (postersController.postersList.isEmpty) {
                  return Center(child: Text('No posters available'));
                } else {
                  return Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: ListView.builder(
                      itemCount: postersController.postersList.length,
                      itemBuilder: (context, index) {
                        var category = postersController.postersList[index];
                        return Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            if (category.posters!.isNotEmpty)
                              AppMainText(
                                text: category.name ?? '',
                                fontWeight: FontWeight.w600,
                                fontSize: 15.sp,
                              ),
                            SizedBox(
                              height: 2.h,
                            ),
                            if (category.posters!.isNotEmpty)
                              Center(
                                child: LayoutBuilder(
                                  builder: (context, constraints) {
                                    double width = constraints.maxWidth;
                                    int crossAxisCount =
                                        getCrossAxisCount(width);
                                    double containerHeight =
                                        getContainerHeight(width);

                                    return StatefulBuilder(
                                      builder: (context,setState) {
                                        return Wrap(
                                          spacing: 20,
                                          runSpacing: 20,
                                          children: List.generate(
                                              category.posters!.length,
                                              (posterIndex) {
                                            var poster =
                                                category.posters![posterIndex];
                                            return HoverContainer(
                                              onTap: () {
                                                dialogue(
                                                  category.posters!.map((e) => e.image!).toList(),
                                                  posterIndex,
                                                );
                                              },
                                              height: containerHeight,
                                              imageUrl:
                                                  "https://brandvillab.leadgenadvertisements.com/${poster.image}",
                                              width: (width / crossAxisCount) -
                                                  20, // Adjust width
                                            );
                                          }),
                                        );
                                      }
                                    );
                                  },
                                ),
                              ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        );
                      },
                    ),
                  );
                }
              }),

              // Column(
              //   children: [
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     AppMainText(
              //       text: "Logos", // ctargiery name
              //       fontWeight: FontWeight.w600,
              //       fontSize: 15.sp,
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     LayoutBuilder(
              //       builder: (context, constraints) {
              //         double width = constraints.maxWidth;
              //
              //         int crossAxisCount = 2;
              //         double containerHeight = 200;
              //         if (width > 1200) {
              //           crossAxisCount = 4;
              //           containerHeight = 350;
              //         } else if (width > 800) {
              //           crossAxisCount = 4;
              //           containerHeight = 300;
              //         } else if (width > 600) {
              //           containerHeight = 250;
              //           crossAxisCount = 3;
              //         }
              //
              //         return Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Wrap(
              //             spacing: 20,
              //             runSpacing: 20,
              //             children: List.generate(images.length, (index) {
              //               return HoverContainer(
              //                 onTap: (){
              //                   dialogue(images[index]);
              //                 },
              //                 height: containerHeight,
              //                 imageUrl: images[index],
              //                 width:
              //                     (width / crossAxisCount) - 20, // Adjust width
              //               );
              //             }),
              //           ),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     AppMainText(
              //       text: "Posters",
              //       fontWeight: FontWeight.w600,
              //       fontSize: 15.sp,
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     LayoutBuilder(
              //       builder: (context, constraints) {
              //         double width = constraints.maxWidth;
              //
              //         int crossAxisCount = 2;
              //         double containerHeight = 200;
              //         if (width > 1200) {
              //           crossAxisCount = 4;
              //           containerHeight = 350;
              //         } else if (width > 800) {
              //           crossAxisCount = 4;
              //           containerHeight = 300;
              //         } else if (width > 600) {
              //           containerHeight = 250;
              //           crossAxisCount = 3;
              //         }
              //
              //         return Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Wrap(
              //             spacing: 20,
              //             runSpacing: 20,
              //             children: List.generate(posters.length, (index) {
              //               return HoverContainer(
              //                 onTap: (){
              //                   dialogue(posters[index]);
              //                 },
              //                 height: containerHeight,
              //                 imageUrl: posters[index],
              //                 width:
              //                     (width / crossAxisCount) - 20, // Adjust width
              //               );
              //             }),
              //           ),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     AppMainText(
              //       text: "Festivals",
              //       fontWeight: FontWeight.w600,
              //       fontSize: 15.sp,
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     LayoutBuilder(
              //       builder: (context, constraints) {
              //         double width = constraints.maxWidth;
              //
              //         int crossAxisCount = 2;
              //         double containerHeight = 200;
              //         if (width > 1200) {
              //           crossAxisCount = 4;
              //           containerHeight = 350;
              //         } else if (width > 800) {
              //           crossAxisCount = 4;
              //           containerHeight = 300;
              //         } else if (width > 600) {
              //           containerHeight = 250;
              //           crossAxisCount = 3;
              //         }
              //
              //         return Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Wrap(
              //             spacing: 20,
              //             runSpacing: 20,
              //             children: List.generate(fest.length, (index) {
              //               return HoverContainer(
              //                 onTap: (){
              //                   dialogue(fest[index]);
              //                 },
              //                 height: containerHeight,
              //                 imageUrl: fest[index],
              //                 width:
              //                     (width / crossAxisCount) - 20, // Adjust width
              //               );
              //             }),
              //           ),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     AppMainText(
              //       text: "Brochures",
              //       fontWeight: FontWeight.w600,
              //       fontSize: 15.sp,
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     LayoutBuilder(
              //       builder: (context, constraints) {
              //         double width = constraints.maxWidth;
              //
              //         int crossAxisCount = 2;
              //         double containerHeight = 200;
              //         if (width > 1200) {
              //           crossAxisCount = 4;
              //           containerHeight = 350;
              //         } else if (width > 800) {
              //           crossAxisCount = 4;
              //           containerHeight = 300;
              //         } else if (width > 600) {
              //           containerHeight = 250;
              //           crossAxisCount = 3;
              //         }
              //
              //         return Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Wrap(
              //             spacing: 20,
              //             runSpacing: 20,
              //             children: List.generate(posters.length, (index) {
              //               return HoverContainer(
              //                 onTap: (){
              //                   dialogue(posters[index]);
              //                 },
              //                 height: containerHeight,
              //                 imageUrl: posters[index],
              //                 width:
              //                     (width / crossAxisCount) - 20, // Adjust width
              //               );
              //             }),
              //           ),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     AppMainText(
              //       text: "Visiting Cards",
              //       fontWeight: FontWeight.w600,
              //       fontSize: 15.sp,
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //     LayoutBuilder(
              //       builder: (context, constraints) {
              //         double width = constraints.maxWidth;
              //
              //         int crossAxisCount = 2;
              //         double containerHeight = 200;
              //         if (width > 1200) {
              //           crossAxisCount = 4;
              //           containerHeight = 350;
              //         } else if (width > 800) {
              //           crossAxisCount = 4;
              //           containerHeight = 300;
              //         } else if (width > 600) {
              //           containerHeight = 250;
              //           crossAxisCount = 3;
              //         }
              //
              //         return Padding(
              //           padding: const EdgeInsets.all(10.0),
              //           child: Wrap(
              //             spacing: 20,
              //             runSpacing: 20,
              //             children: List.generate(visitingCards.length, (index) {
              //               return HoverContainer(
              //                 onTap: (){
              //                   dialogue(visitingCards[index]);
              //                 },
              //                 height: containerHeight,
              //                 imageUrl: visitingCards[index],
              //                 width:
              //                     (width / crossAxisCount) - 20, // Adjust width
              //               );
              //             }),
              //           ),
              //         );
              //       },
              //     ),
              //     SizedBox(
              //       height: 2.h,
              //     ),
              //   ],
              // ),
            );
          }),
    );
  }

  Widget buildShimmerEffect(double width, height) {
    int crossAxisCount = getCrossAxisCount(width);
    double containerHeight = getContainerHeight(height);

    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 20,
          runSpacing: 20,
          children: List.generate(6, (index) {
            // Simulating the grid layout with shimmer
            return Container(
              height: containerHeight,
              width: (width / crossAxisCount) - 20,
              color: Colors.white,
            );
          }),
        ),
      ),
    );
  }

  int getCrossAxisCount(double width) {
    if (width > 1200) {
      return 4;
    } else if (width > 800) {
      return 4;
    } else if (width > 600) {
      return 3;
    } else {
      return 2;
    }
  }

  double getContainerHeight(double width) {
    if (width > 1200) {
      return 350;
    } else if (width > 800) {
      return 300;
    } else if (width > 600) {
      return 250;
    } else {
      return 200;
    }
  }

  dialogue(List<String> images, int initialIndex) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          content: SizedBox(
            height: 80.h, // Adjust the height as needed
            width: 50.w,
            child: PageView.builder(
              controller: PageController(initialPage: initialIndex),
              itemCount: images.length,
              itemBuilder: (context, pageIndex) {
                return Image.network(
                  "https://brandvillab.leadgenadvertisements.com/${images[pageIndex]}",
                  fit: BoxFit.contain,
                );
              },
            ),
          ),
        );
      },
    );
  }
}

class HoverContainer extends StatefulWidget {
  final String imageUrl;
  final double width, height;
  final void Function()? onTap;

  const HoverContainer(
      {super.key,
      required this.imageUrl,
      required this.width,
      required this.height,
      this.onTap});

  @override
  State<HoverContainer> createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
      child: InkWell(
        onTap: widget.onTap,
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          width: widget.width,
          height: widget.height,
          decoration: BoxDecoration(
              color: AppColors.white,
              borderRadius: BorderRadius.circular(4),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12.withOpacity(_isHovered ? 0.1 : 0.1),
                  blurRadius: _isHovered ? 20 : 1,
                  spreadRadius: _isHovered ? 2 : 1,
                ),
              ],
              image: DecorationImage(
                  image: NetworkImage(widget.imageUrl), fit: BoxFit.fill)),
          alignment: Alignment.center,
        ),
      ),
    );
  }
}


