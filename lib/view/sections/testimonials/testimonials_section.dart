import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/contribution_model.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class TestimonialsSection extends StatefulWidget {
  const TestimonialsSection({super.key});

  @override
  State<TestimonialsSection> createState() => _TestimonialsSectionState();
}

class _TestimonialsSectionState extends State<TestimonialsSection> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppTheme.darkBgColor,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 800),
          // Narrower for readability
          child: Column(
            children: [
              Text(
                'CONTRIBUTIONS',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightBodyTextColor.withOpacity(0.8),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Community Contributions',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightSurfaceColor,
                    ),
              ),
              const SizedBox(height: 50),
              SizedBox(
                height: 300,
                child: PageView.builder(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  itemCount: contributionList.length,
                  itemBuilder: (context, index) {
                    final item = contributionList[index];
                    return
                      AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          margin: const EdgeInsets.symmetric(
                              vertical: defaultPadding, horizontal: defaultPadding),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              gradient: const LinearGradient(colors: [
                                Colors.pink,
                                Colors.blue,
                              ]),
                              boxShadow:  [
                                BoxShadow(
                                  color: Colors.pink,
                                  offset: const Offset(-2, 0),
                                  blurRadius:  15,
                                ),
                                BoxShadow(
                                  color: Colors.blue,
                                  offset: const Offset(2, 0),
                                  blurRadius: 15,),
                              ]),
                          child:   InkWell(
                            onTap: () => launchUrl(Uri.parse(item.credential)),
                            child: Container(
                              margin: const EdgeInsets.symmetric(horizontal: 20),
                              padding: const EdgeInsets.all(30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/icons/dribble.svg',width: 30,height: 30,color: AppTheme.lightBgColor,),
                                  const SizedBox(height: 20),
                                  Text(
                                    item.name,
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: AppTheme.lightBgColor),
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    item.description,
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(
                                        color: AppTheme.lightHeadingColor,
                                        height: 1.5,
                                        fontSize: 14),
                                  ),
                                  const SizedBox(height: 20),
                                  const Text(
                                    'View on Pub.dev',
                                    style: TextStyle(
                                        color: AppTheme.primaryColor,
                                        fontWeight: FontWeight.bold,
                                        decoration: TextDecoration.underline),
                                  ),
                                ],
                              ),
                            ),
                          )
                      );
                  },
                ),
              ),
              const SizedBox(height: 20),
              // Indicators
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(contributionList.length, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == index
                          ? AppTheme.primaryColor
                          : Colors.grey[300],
                    ),
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
