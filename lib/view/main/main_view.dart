import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/navigation_bar.dart';
import '../../view model/responsive.dart';
import '../../view model/getx_controllers/navigation_controller.dart';
import 'components/drawer/drawer.dart';
import 'components/navigation_button_list.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

class MainView extends StatelessWidget {
  MainView({super.key, required this.pages});

  final List<Widget> pages;
  final NavigationController controller = Get.put(NavigationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      body: Center(
        child: Column(
          children: [
            kIsWeb && !Responsive.isLargeMobile(context)
                ? const SizedBox(height: defaultPadding * 2)
                : const SizedBox(height: defaultPadding / 2),
            if (!Responsive.isMobile(context))
              const SizedBox(
                height: 80,
                child: TopNavigationBar(),
              ),
            if (Responsive.isLargeMobile(context) && !Responsive.isMobile(context))
              const Row(
                children: [Spacer(), NavigationButtonList(), Spacer()],
              ),
            Expanded(
              flex: 9,
              child: PageView(
                scrollDirection: Axis.vertical,
                physics: const NeverScrollableScrollPhysics(),
                controller: controller.pageController,
                onPageChanged: controller.onPageChanged,
                children: pages,
              ),
            )
          ],
        ),
      ),
      bottomNavigationBar: Responsive.isMobile(context)
          ? Obx(() => NavigationBar(
                selectedIndex: controller.currentIndex.value,
                onDestinationSelected: (index) => controller.animateToPage(index),
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(icon: Icon(Icons.person), label: 'About'),
                  NavigationDestination(icon: Icon(Icons.work), label: 'Projects'),
                  NavigationDestination(icon: Icon(Icons.workspace_premium), label: 'Certifications'),
                  NavigationDestination(icon: Icon(Icons.article), label: 'Contibutions'),
                ],
              ))
          : null,
    );
  }
}
