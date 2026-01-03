import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:flutter_portfolio/res/social_data.dart';
import 'package:flutter_portfolio/view/home/components/home_app_bar.dart'; 
import 'package:flutter_portfolio/view/intro/components/animated_texts_componenets.dart';
import 'package:flutter_portfolio/view/intro/components/download_button.dart';
import 'package:flutter_portfolio/view/components/social_icon_button.dart';
import 'package:flutter_portfolio/view/components/copyable_text.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutSection extends StatelessWidget {
  const AboutSection({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 700;
    
    return Container(
      padding: const EdgeInsets.all(AppTheme.defaultPadding * 2),
      constraints: const BoxConstraints(maxWidth: AppTheme.maxWidth),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'ABOUT ME',
             style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: AppTheme.lightBodyTextColor.withOpacity(0.8),
                letterSpacing: 2,
              ),
          ),
          const SizedBox(height: 10),
          Text(
            'Who I Am',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppTheme.lightSurfaceColor,
            ),
          ),
          const SizedBox(height: 40),
          Flex(
            direction: isMobile ? Axis.vertical : Axis.horizontal,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image Side
              Expanded(
                flex: isMobile ? 0 : 4,
                child:  const AnimatedImageContainer(
                  image: 'assets/images/profile.png',
                    withoutTitle:false
                ),
              ),
              if (!isMobile) const SizedBox(width: 40),
              if (isMobile) const SizedBox(height: 30),
               // Text Side
              Expanded(
                flex: isMobile ? 0 : 6,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Senior Mobile Engineer',
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.lightSurfaceColor,
                          ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'I\'m capable of creating excellent mobile apps, handling every step from concept to deployment.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(height: 1.8),
                    ),
                    const SizedBox(height: 20),
                    // Contact Info
                    Wrap(
                      spacing: 20,
                      runSpacing: 20,
                      children: [
                         CopyableText(title: 'Name', text: 'Abdullah Alamary', icon: Icons.person),
                         CopyableText(title: 'Email', text: SocialData.email, icon: Icons.email),
                         CopyableText(title: 'Phone', text: SocialData.phone, icon: Icons.phone),
                         CopyableText(title: 'Location', text: SocialData.location, icon: Icons.location_on),
                      ],
                    ),
                    const SizedBox(height: 30),
                     const DownloadButton(),
                     const SizedBox(height: 30),
                     // Social Icons
                     const Text('Follow Me:', style: TextStyle(fontWeight: FontWeight.bold, color: AppTheme.lightSurfaceColor)),
                    Container(
                      margin: const EdgeInsets.only(top: defaultPadding),
                      child: Row(
                        children: [
                          const Spacer(),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    'https://www.linkedin.com/in/abdullah-alamary-8a5739140/'));
                              },
                              icon:
                              SvgPicture.asset('assets/icons/linkedin.svg')),
                          IconButton(
                              onPressed: () {
                                launchUrl(
                                    Uri.parse('https://github.com/3boodev'));
                              },
                              icon: SvgPicture.asset('assets/icons/github.svg')),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    'https://www.instagram.com/abdullah_elamary/profilecard/?igsh=NG5yMWhyZnI1N2Ex'));
                              },
                              icon: Image.asset('assets/icons/insta.webp',
                                  width: 20, height: 20)),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    'https://x.com/AbdullahAlamar0?t=saslo4jAis_ntvU51E7w5w&s=08'));
                              },
                              icon: SvgPicture.asset('assets/icons/twitter.svg')),
                          IconButton(
                              onPressed: () {
                                launchUrl(Uri.parse(
                                    'https://medium.com/@a.abdelsamad.al'));
                              },
                              icon: Image.asset('assets/icons/medium.webp',
                                  width: 20, height: 20)),
                          const Spacer(),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
