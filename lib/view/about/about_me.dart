import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/main/components/drawer/header_info.dart';
import 'package:flutter_portfolio/view/projects/components/title_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:url_launcher/url_launcher.dart';
import '../main/components/drawer/drawer_image.dart';
class AboutMeScreen extends StatelessWidget {
  const AboutMeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1.23,
      child: Container(
        color:  bgColor,
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const TitleText(prefix: 'About', title: 'Me'),
            const SizedBox(height: defaultPadding*2,),
            const DrawerImage(),
            const SizedBox(height: defaultPadding/3,),
            Text('Abdullah Alamary',style: Theme.of(context).textTheme.titleSmall,),
            const SizedBox(height: defaultPadding/4,),
            const Text('Senior Flutter Developer',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontWeight: FontWeight.w200,
                  height: 1.5
              ),),
            const SizedBox(height: defaultPadding*2,),
            const AreaInfoText(title: 'Contact', text: '+966502947738 OR +201552252349'),
            const AreaInfoText(title: 'Email', text: 'a.abdelsamad.al@gmail.com'),
            const AreaInfoText(title: 'LinkedIn', text: '@abdullah-abdelsamad'),
            const AreaInfoText(title: 'Github', text: '@3boodev'),
        Container(
          margin: const EdgeInsets.only(top: defaultPadding),
          child: Row(
            children: [
              const Spacer(),
              IconButton(onPressed: () {launchUrl(Uri.parse('https://www.linkedin.com/in/abdullah-abdelsamad-8a5739140'));}, icon: SvgPicture.asset('assets/icons/linkedin.svg')),
              IconButton(onPressed: () {launchUrl(Uri.parse('https://github.com/3boodev'));}, icon: SvgPicture.asset('assets/icons/github.svg')),
              IconButton(onPressed: () {launchUrl(Uri.parse('https://www.instagram.com/abdullah_elamary/profilecard/?igsh=NG5yMWhyZnI1N2Ex'));}, icon: Image.asset('assets/icons/insta.webp',width: 20,height: 20,)),
              IconButton(onPressed: () {launchUrl(Uri.parse('https://x.com/AbdullahAlamar0?t=saslo4jAis_ntvU51E7w5w&s=08'));}, icon: SvgPicture.asset('assets/icons/twitter.svg')),
              IconButton(onPressed: () {launchUrl(Uri.parse('https://medium.com/@a.abdelsamad.al'));}, icon: Image.asset('assets/icons/medium.webp',width: 20,height: 20,)),
              const Spacer(),
            ],
          ),
        )
          ],
        ),
      ),
    );
  }
}
