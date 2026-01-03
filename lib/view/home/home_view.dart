import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:flutter_portfolio/view/home/components/home_app_bar.dart';
import 'package:flutter_portfolio/view/sections/certifications/certifications_section.dart';
import 'package:flutter_portfolio/view/sections/hero/hero_section.dart';
import 'package:flutter_portfolio/view/sections/about/about_section.dart';
import 'package:flutter_portfolio/view/sections/portfolio/portfolio_section.dart';
import 'package:flutter_portfolio/view/sections/contact/contact_section.dart';
import 'package:flutter_portfolio/view/sections/testimonials/testimonials_section.dart';
import 'package:flutter_portfolio/view/home/components/mobile_drawer.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ScrollController _scrollController = ScrollController();
  double _scrollOffset = 0.0;

  final GlobalKey _heroKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _servicesKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _contactKey = GlobalKey();

  Future<void> _scrollToSection(GlobalKey key) async {
    final context = key.currentContext;
    if (context != null) {
      await Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MobileDrawer(onNavItemTap: (index) {
        Navigator.pop(context); // Close drawer
        if (index == 0) _scrollToSection(_heroKey);
        if (index == 1) _scrollToSection(_aboutKey);
        if (index == 2) _scrollToSection(_servicesKey);
        if (index == 3) _scrollToSection(_portfolioKey);
        if (index == 4) _scrollToSection(_contactKey);
      }),
      body: Stack(
        children: [
          SingleChildScrollView(
            controller: _scrollController,
            child: Column(
              children: [
                Container(key: _heroKey, child: const HeroSection()),
                const SizedBox(height: 50),
                Container(key: _aboutKey, child: const AboutSection()),
                Container(key: _servicesKey, child: const CertificationsSection()),
                Container(key: _portfolioKey, child: const PortfolioSection()),
                const TestimonialsSection(),
                Container(key: _contactKey, child: const ContactSection()),
                const SizedBox(height: 50), 
                Container(
                  height: 100, 
                  color: AppTheme.darkBgColor,
                  child: const Center(child: Text("© 2026 Abdullah Alamary", style: TextStyle(color: Colors.white)))
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: HomeAppBar(
              scrollOffset: _scrollOffset,
              onItemTap: (index) {
                if (index == 0) _scrollToSection(_heroKey);
                if (index == 1) _scrollToSection(_aboutKey);
                if (index == 2) _scrollToSection(_servicesKey);
                if (index == 3) _scrollToSection(_portfolioKey);
                if (index == 4) _scrollToSection(_contactKey);
              },
            ),
          ),
        ],
      ),
    );
  }
}
