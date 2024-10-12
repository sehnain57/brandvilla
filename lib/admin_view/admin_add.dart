import 'dart:io';

import 'package:brandvilla/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';
import 'package:file_picker/file_picker.dart';
import '../constants/app_colors.dart';
import '../constants/custom_dropdown.dart';
import '../controllers/cat_controller.dart';

class AdminAdd extends StatefulWidget {
  const AdminAdd({super.key});

  @override
  State<AdminAdd> createState() => _AdminAddState();
}

class _AdminAddState extends State<AdminAdd> {
  String? _fileName = "No file chosen";

  Future<void> _pickImage() async {
    // Pick an image file using file picker
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['jpg', 'jpeg', 'png'], // Restrict to image files
    );

    if (result != null && result.files.isNotEmpty) {
      // If a file is chosen, update the state with the file name
      setState(() {
        _fileName = result.files.first.name;
        posterControl.setSelectedImageBytes(result.files.first.bytes);
        print(posterControl.selectedImageBytes);
      });
    }
  }

  final PosterControl posterControl = Get.put(PosterControl());

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
      body: GetBuilder<CategoriesController>(
          init: CategoriesController(),
          builder: (controller) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      AppMainText(
                        text: "Admin Dashboard",
                        fontSize: 20.sp,
                        fontWeight: FontWeight.bold,
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      SizedBox(
                        width: 350,
                        child: Column(
                          children: [
                            Obx(() => CustomDropDownBorder(
                                  hintText: controller.isLoading.value
                                      ? "Loading ... "
                                      : "Select Category",
                                  items: controller.categories.map((category) {
                                    return DropdownMenuItem(
                                      value: category.id,
                                      child: AppText(
                                          text: category.name ?? 'Unnamed'),
                                    );
                                  }).toList(),
                                  selectedValue: cat,
                                  // Initially no selection
                                  onChanged: (val) {
                                    // Handle dropdown selection change
                                    print("Selected Category ID: $val");

                                    posterControl.setSelectedCategory(val);
                                    setState(() {
                                      cat = val;
                                    });
                                    print("Selected Category ID: ${posterControl.selectedCategoryId}");
                                  },
                                  onSaved: (val) {
                                    setState(() {
                                      cat = val;
                                    });
                                    // Handle when the form is saved
                                  },
                                )),
                            SizedBox(
                              height: 4.h,
                            ),
                            Container(
                              width: 350,
                              height: 48,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(4),
                                  border: Border.all(
                                      color: Colors.black.withOpacity(0.3))),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    left: 12.0, right: 12),
                                child: Row(
                                  children: [
                                    InkWell(
                                      onTap: _pickImage,
                                      child: Container(
                                        width: 80,
                                        height: 25,
                                        decoration: BoxDecoration(
                                            color: Colors.black12,
                                            border: Border.all(
                                                color: Colors.black,
                                                width: 0.5)),
                                        child: Center(
                                            child: AppText(
                                                text: "Choose file",
                                                fontSize: 12,
                                                fontWeight: FontWeight.bold)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Expanded(
                                        child: AppText(
                                      overflow: TextOverflow.ellipsis,
                                      text: _fileName.toString(),
                                      fontWeight: FontWeight.w500,
                                    ))
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 5.h,
                            ),
                            InkWell(
                              onTap: ()async{
                                await posterControl.uploadPoster(context);
                              },
                              child: Obx(() => Container(
                                    height: 50,
                                    width: 300,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      color: AppColors.primaryColor,
                                    ),
                                    child: Center(
                                        child: posterControl.isLoading.value
                                            ? CircularProgressIndicator()
                                            : AppMainText(
                                                text: "Upload",
                                                color: Colors.white,
                                                fontWeight: FontWeight.w600,
                                              )),
                                  )),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
    );
  }

  String? cat;

  List<String> categories = [
    "Logo",
    "Business Posters",
    "Festival posters",
    "Brochure",
    "Visiting card",
    "Latter head",
    "Promotion videos",
  ];
}
