import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:eco/core/view_model/index_view_model.dart';
import 'package:eco/models/index_model.dart';
import 'package:eco/util/index_util.dart';

class OnboardingScreen extends StatelessWidget {
  OnboardingScreen({Key? key}) : super(key: key);
  final _slideController = SliderViewModel();

  @override
  Widget build(BuildContext context) {
    Get.put(_slideController);
    final List<SliderModel> listSliders = _slideController.onboardingData;
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Flexible(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.7,
                child: PageView.builder(
                  itemBuilder: (context, index) {
                    final _dataSlider = listSliders[index];
                    return _BuildSlider(
                      sliderModel: SliderModel(
                          subTitle: _dataSlider.subTitle,
                          title: _dataSlider.title,
                          urlImage: _dataSlider.urlImage),
                    );
                  },
                  onPageChanged: _slideController.onPageSwap,
                  controller: _slideController.sliderViewController.value,
                  itemCount: listSliders.length,
                ),
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                listSliders.length,
                (index) => Obx(
                  () => _BuildDot(
                    key: ValueKey(index),
                    currentIndex: index,
                    newIndex: _slideController.currentIndex.value,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 60,
            ),
            ElevatedButton( 
              onPressed: () {
                // Get.off();
              },
              child: Text("Get Started".toUpperCase()),
            ),
          ],
        ),
      ),
    );
  }
}

class _BuildSlider extends StatelessWidget {
  const _BuildSlider({Key? key, required this.sliderModel}) : super(key: key);
  final SliderModel sliderModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: 280,
          child: Image.asset(
            sliderModel.urlImage,
            alignment: Alignment.bottomLeft,
          ),
        ),
        const SizedBox(
          height: 40,
        ),
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(sliderModel.title,
                style: Theme.of(context).textTheme.headline2),
            const SizedBox(height: 10),
            Text(sliderModel.subTitle,
                textAlign: TextAlign.center,
                textWidthBasis: TextWidthBasis.parent,
                style: Theme.of(context).textTheme.bodyText1),
          ],
        ),
      ],
    );
  }
}

class _BuildDot extends StatelessWidget {
  const _BuildDot({
    Key? key,
    required this.currentIndex,
    required this.newIndex,
  }) : super(key: key);

  final int currentIndex;
  final int newIndex;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOutBack,
      decoration: BoxDecoration(
        color: currentIndex == newIndex
            ? AppColors.activeColor
            : const Color(0XFF868686).withOpacity(0.5),
        borderRadius: BorderRadius.circular(20),
      ),
      margin: const EdgeInsets.only(right: 5),
      width: currentIndex == newIndex ? 20 : 10,
      height: currentIndex == newIndex ? 8 : 5,
    );
  }
}
