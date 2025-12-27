import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/view/intro/components/social_media_coloumn.dart';
import '../../../view model/responsive.dart';
import 'animated_texts_componenets.dart';
import 'combine_subtitle.dart';
import 'description_text.dart';
import 'download_button.dart';
import 'headline_text.dart';

class IntroBody extends StatelessWidget {
  const IntroBody({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return LayoutBuilder(builder: (context, constraints) {
      if (Responsive.isMobile(context)) {
        return SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: defaultPadding),
              const AnimatedImageContainer(
                width: 150,
                height: 200,
                image: 'assets/images/profile.png',
              ),
              const SizedBox(height: defaultPadding),
              const MyPortfolioText(start: 35, end: 30),
              const SizedBox(height: defaultPadding),
              const CombineSubtitleText(),
              const SizedBox(height: defaultPadding),
              const AnimatedDescriptionText(start: 14, end: 12),
              const SizedBox(height: defaultPadding * 2),
              const DownloadButton(),
              const SizedBox(height: defaultPadding * 2),
              const SocialMediaIconRow(),
              const SizedBox(height: defaultPadding * 4),
            ],
          ),
        );
      } else {
        return Row(
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (!Responsive.isDesktop(context))
                    SizedBox(height: size.height * 0.06),
                  if (!Responsive.isDesktop(context))
                    Row(
                      children: [
                        SizedBox(width: size.width * 0.23),
                        const AnimatedImageContainer(
                          width: 150,
                          height: 200,
                          image: 'assets/images/profile.png',
                        ),
                      ],
                    ),
                  if (!Responsive.isDesktop(context))
                    SizedBox(height: size.height * 0.1),
                  const Responsive(
                    desktop: MyPortfolioText(start: 40, end: 50),
                    largeMobile: MyPortfolioText(start: 40, end: 35),
                    mobile: MyPortfolioText(start: 35, end: 30),
                    tablet: MyPortfolioText(start: 50, end: 40),
                  ),
                  if (kIsWeb && Responsive.isLargeMobile(context))
                    Container(
                      height: defaultPadding,
                      color: Colors.transparent,
                    ),
                  const CombineSubtitleText(),
                  const SizedBox(height: defaultPadding / 2),
                  const Responsive(
                    desktop: AnimatedDescriptionText(start: 14, end: 15),
                    largeMobile: AnimatedDescriptionText(start: 14, end: 12),
                    mobile: AnimatedDescriptionText(start: 14, end: 12),
                    tablet: AnimatedDescriptionText(start: 17, end: 14),
                  ),
                  const SizedBox(height: defaultPadding * 2),
                  const DownloadButton(),
                ],
              ),
            ),
            const Spacer(),
            if (Responsive.isDesktop(context))
              const AnimatedImageContainer(image: 'assets/images/profile.png'),
            const Spacer()
          ],
        );
      }
    });
  }
}
