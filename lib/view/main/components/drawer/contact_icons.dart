import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../../res/constants.dart';

class ContactIcon extends StatelessWidget {
  const ContactIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
