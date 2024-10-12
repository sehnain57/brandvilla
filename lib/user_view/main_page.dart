import 'package:brandvilla/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/controller_hovers.dart';

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
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
                AppMainText(
                  text: "Logos",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                LayoutBuilder(
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

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: List.generate(images.length, (index) {
                          return HoverContainer(
                            height: containerHeight,
                            imageUrl: images[index],
                            width:
                                (width / crossAxisCount) - 20, // Adjust width
                          );
                        }),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                AppMainText(
                  text: "Posters",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                LayoutBuilder(
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

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: List.generate(posters.length, (index) {
                          return HoverContainer(
                            height: containerHeight,
                            imageUrl: posters[index],
                            width:
                                (width / crossAxisCount) - 20, // Adjust width
                          );
                        }),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                AppMainText(
                  text: "Festivals",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                LayoutBuilder(
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

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: List.generate(fest.length, (index) {
                          return HoverContainer(
                            height: containerHeight,
                            imageUrl: fest[index],
                            width:
                                (width / crossAxisCount) - 20, // Adjust width
                          );
                        }),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                AppMainText(
                  text: "Brochures",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                LayoutBuilder(
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

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: List.generate(posters.length, (index) {
                          return HoverContainer(
                            height: containerHeight,
                            imageUrl: posters[index],
                            width:
                                (width / crossAxisCount) - 20, // Adjust width
                          );
                        }),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
                AppMainText(
                  text: "Visiting Cards",
                  fontWeight: FontWeight.w600,
                  fontSize: 15.sp,
                ),
                SizedBox(
                  height: 2.h,
                ),
                LayoutBuilder(
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

                    return Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Wrap(
                        spacing: 20,
                        runSpacing: 20,
                        children: List.generate(visitingCards.length, (index) {
                          return HoverContainer(
                            height: containerHeight,
                            imageUrl: visitingCards[index],
                            width:
                                (width / crossAxisCount) - 20, // Adjust width
                          );
                        }),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<String> images = [
    "assets/logo1.jpeg",
    "assets/logo2.jpeg",
    "assets/logo3.jpeg",
    "assets/logo4.jpeg",
    "assets/logo5.jpeg",
  ];
  List<String> posters = [
    "assets/broch1.jpeg",
    "assets/broch2.jpeg",
  ];
  List<String> fest = [
    "assets/fest1.jpeg",
  ];
  List<String> visitingCards = [
    "assets/logo4.jpeg",
    "assets/logo5.jpeg",
  ];
}

class HoverContainer extends StatefulWidget {
  final String imageUrl;
  final double width, height;

  const HoverContainer(
      {super.key, required this.imageUrl, required this.width, required this.height});

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (event) => setState(() => _isHovered = true),
      onExit: (event) => setState(() => _isHovered = false),
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
                image: AssetImage(widget.imageUrl), fit: BoxFit.fill)),
        alignment: Alignment.center,
        // child: Image.asset(widget.imageUrl,fit: BoxFit.fill,),
      ),
    );
  }
}
