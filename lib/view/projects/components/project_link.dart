import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../model/project_model.dart';

class ProjectLinks extends StatelessWidget {
  final int index;

  const ProjectLinks({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        if(projectList[index].playLink!='')
        GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(projectList[index].playLink));
            },
            child: SvgPicture.asset('assets/icons/playstore.svg',width: 40,height: 40,)),
        if(projectList[index].appStoreLink!='')
          GestureDetector(
            onTap: () {
              launchUrl(Uri.parse(projectList[index].appStoreLink));
            },
            child: SvgPicture.asset('assets/icons/appstore.svg',width: 40,height: 40,)),
      ],
    );
  }
}
