import 'package:eco/models/index_model.dart';
import 'package:flutter/widgets.dart';
import 'package:get/state_manager.dart';

class SliderViewModel extends GetxController {
  var currentIndex = 0.obs;

  final sliderViewController = PageController().obs;

  List<SliderModel> get onboardingData => [..._onboarding];
  // PageController get sliderViewController => _controller.value;

  void onPageSwap(int value) {
    currentIndex.value = value;
  }

  @override
  void onInit() {
    currentIndex = sliderViewController.value.initialPage.obs;
    super.onInit();
  }

  final List<SliderModel> _onboarding = [
    SliderModel(
        urlImage: 'assets/2.png',
        title: 'All your favorites',
        subTitle:
            'Order from the best local restaurants\nwith easy, on-demand delivery.'),
    SliderModel(
        urlImage: 'assets/3.png',
        title: 'Free delivery offers',
        subTitle:
            'Free delivery for new customers via Apple\nPay and others payment methods.'),
    SliderModel(
        urlImage: 'assets/1.png',
        title: 'Choose your food',
        subTitle:
            'Easily find your type of food craving and\nyou’ll get delivery in wide range.')
  ];
}
