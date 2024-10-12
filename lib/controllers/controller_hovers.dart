import 'package:get/get.dart';


class HoverControl extends GetxController{

  RxBool signUpHover = false.obs;
  RxBool loginHover = false.obs;

  updateSignUpHover(bool val){
    signUpHover(val);
    update();
  }
  updateLoginHover(bool val){
    loginHover(val);
    update();
  }
}