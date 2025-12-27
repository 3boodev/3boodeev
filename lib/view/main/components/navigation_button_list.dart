import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/navigation_controller.dart';
import 'navigation_button.dart';

class NavigationButtonList extends StatelessWidget {
  const NavigationButtonList({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.find<NavigationController>();
    return TweenAnimationBuilder(
      tween: Tween(begin: 0.0, end: 1.0),
      duration: const Duration(milliseconds: 200),
      builder: (context, value, child) {
        return Transform.scale(
          scale: value,
          child: Row(
            children: [
              NavigationTextButton(onTap: () => controller.animateToPage(0), text: 'Home'),
              NavigationTextButton(onTap: () => controller.animateToPage(1), text: 'About Me'),
              NavigationTextButton(onTap: () => controller.animateToPage(2), text: 'Projects'),
              NavigationTextButton(onTap: () => controller.animateToPage(3), text: 'Certifications'),
              NavigationTextButton(onTap: () => controller.animateToPage(4), text: 'Contributions'),
            ],
          ),
        );
      },
    );
  }
}