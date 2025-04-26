import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view%20model/getx_controllers/certification_controller.dart';
import 'package:flutter_portfolio/view/contributions/components/contribution_grid.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:get/get.dart';
import '../../res/constants.dart';
import '../../view model/responsive.dart';

class Contributions extends StatelessWidget {
  final controller=Get.put(CertificationController());
  Contributions({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if(Responsive.isLargeMobile(context))const SizedBox(
            height: defaultPadding,
          ),
          const TitleText(prefix: 'Contribution & ', title: 'Packages'),
          const SizedBox(
            height: defaultPadding,
          ),
          Expanded(
              child: Responsive(
                  desktop: CertificationGrid(crossAxisCount: 3,ratio: 1.5,),
                  extraLargeScreen: CertificationGrid(crossAxisCount: 4,ratio: 1.6),
                  largeMobile: CertificationGrid(crossAxisCount: 1,ratio: 1.8),
                  mobile: CertificationGrid(crossAxisCount: 1,ratio: 1.4),
                  tablet: CertificationGrid(ratio: 1.7,crossAxisCount: 2,)))
        ],
      ),
    );
  }
}










