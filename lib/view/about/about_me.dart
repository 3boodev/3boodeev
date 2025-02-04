import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/drawer/header_info.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import '../main/components/drawer/drawer_image.dart';
class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color:  bgColor,
        padding: EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const TitleText(prefix: 'About', title: 'Me'),
            const SizedBox(height: defaultPadding*2,),
            const DrawerImage(),
            const SizedBox(height: defaultPadding/4,),
            Text('Abdullah Alamary',style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(height: defaultPadding/4,),
            const Text('Senior Flutter Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5
              ),),
            SizedBox(height: defaultPadding*2,),
            AreaInfoText(title: 'Contact', text: '0502947738'),
            AreaInfoText(title: 'Email', text: 'a.abdelsamad.al@gmail.com'),
            AreaInfoText(title: 'LinkedIn', text: '@3boodev'),
            AreaInfoText(title: 'Github', text: '@3boodev'),
            SizedBox(
              height: defaultPadding,
            ),
          ],
        ),
      ),
    );
  }
}
