import 'package:get/state_manager.dart';

import 'user_model.dart';

class UserController extends GetxController {
  RxString name = 'Eliezer'.obs;

  Rx<UserModel> user = UserModel().obs;

  void setUserName(String userName) {
    user.value.name = userName;
  }

  void setUserAge(int userAge) {
    user.value.age = userAge;
  }
}
