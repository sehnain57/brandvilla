import 'package:brandvilla/constants/app_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

import '../constants/app_colors.dart';
import '../controllers/admin_auth_control.dart';
import '../controllers/cat_controller.dart';

class AdminLogin extends StatefulWidget {
  const AdminLogin({super.key});

  @override
  State<AdminLogin> createState() => _AdminLoginState();
}

class _AdminLoginState extends State<AdminLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff0f0f0),
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
      body: ListView(
        children: [
          Form(
            key: key,
            child: Padding(
              padding: EdgeInsets.only(top: 10.0.h),
              child: Center(
                child: SizedBox(
                  width: 500,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Container(
                          width: 500,
                          padding: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12.withOpacity(0.1),
                                  blurRadius: 20,
                                  spreadRadius: 2,
                                ),
                              ]),
                          child: Column(
                            children: [
                              Image.asset(
                                "assets/logo.webp",
                                width: 90,
                                height: 90,
                              ),
                              AppMainText(
                                text: "Admin login",
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AppText(
                                    text: "Email",
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      controller: email,
                                      decoration: InputDecoration(
                                          hintText: "Enter email",
                                          contentPadding:
                                              EdgeInsets.only(left: 12),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12
                                                      .withOpacity(0.5))),
                                          disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12
                                                      .withOpacity(0.1))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12
                                                      .withOpacity(0.1)))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 2.h,
                                  ),
                                  AppText(
                                    text: "Password",
                                    fontWeight: FontWeight.w600,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    height: 40,
                                    child: TextFormField(
                                      controller: password,
                                      decoration: InputDecoration(
                                          hintText: "Enter password",
                                          contentPadding:
                                              EdgeInsets.only(left: 12),
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12
                                                      .withOpacity(0.5))),
                                          disabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12
                                                      .withOpacity(0.1))),
                                          enabledBorder: OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.black12
                                                      .withOpacity(0.1)))),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 5.h,
                                  ),
                                  Center(
                                    child: InkWell(
                                      onTap: () async {
                                        if (email.text.isEmpty ||
                                            password.text.isEmpty) {
                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(SnackBar(
                                                  content: AppText(
                                                      text:
                                                          "All fields required")));
                                        } else {
                                          adminAuthController
                                                  .adminLogin(email.text,
                                                      password.text, context);

                                        }
                                      },
                                      child: Container(
                                        height: 40,
                                        width: 500,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          color: AppColors.primaryColor
                                              .withOpacity(0.8),
                                        ),
                                        child: Center(
                                            child: Obx(() => adminAuthController
                                                    .isLoading.value
                                                ? CircularProgressIndicator(color: Colors.white,)
                                                : AppMainText(
                                                    text: "Login",
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.w600,
                                                  ))),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 7.h,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  AdminAuthController adminAuthController = Get.put(AdminAuthController());
  PosterControl controller = Get.put(PosterControl());

  final email = TextEditingController();
  final key = GlobalKey<FormState>();
  final password = TextEditingController();
}
