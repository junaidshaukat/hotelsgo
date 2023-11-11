import 'package:flutter/material.dart';

import '/export.dart';
import 'models.dart';

/// A controller class for the HomeScreen.
///
/// This class manages the state of the HomeScreen, including the
/// current HomeModelObj
class HomeController extends GetxController {
  Rx<HomeModel> model = HomeModel().obs;

  RxInt rooms = 1.obs;
  RxInt adults = 1.obs;
  RxInt childrens = 1.obs;
  RxBool switchs = false.obs;

  RxString nationality = 'Select Nationality'.obs;

  RxInt itemCountRooms = 1.obs;
  RxInt itemCountAdults = 1.obs;
  RxInt itemCountChildrens = 1.obs;

  TextEditingController from =
      TextEditingController(text: DateTime.now().format());
  TextEditingController to = TextEditingController(
      text: DateTime.now().add(const Duration(days: 2)).format());

  @override
  void onReady() {}

  void onChangedNationality(String? val) {
    nationality.value = val!;
    update();
  }

  void roomIncrement() {
    int val = rooms.value + 1;
    itemCountRooms.value = val;
    rooms.value = val;
    update();
  }

  void roomDecrement() {
    int val = rooms.value - 1;
    if (val <= 1) {
      rooms.value = 1;
      itemCountRooms.value = 1;
    } else {
      itemCountRooms.value = val;
      rooms.value = val;
    }
    update();
  }

  void adultsIncrement() {
    int val = adults.value + 1;
    itemCountAdults.value = val;
    adults.value = val;
    update();
  }

  void adultsDecrement() {
    int val = adults.value - 1;
    if (val <= 1) {
      adults.value = 1;
      itemCountAdults.value = 1;
    } else {
      itemCountAdults.value = val;
      adults.value = val;
    }
    update();
  }

  void childrensIncrement() {
    int val = childrens.value + 1;
    itemCountChildrens.value = val;
    childrens.value = val;
    update();
  }

  void childrensDecrement() {
    int val = childrens.value - 1;
    if (val <= 1) {
      childrens.value = 1;
      itemCountChildrens.value = 1;
    } else {
      itemCountChildrens.value = val;
      childrens.value = val;
    }
    update();
  }

  void onChangedSwitch(bool val) {
    switchs.value = val;
    update();
  }
}
