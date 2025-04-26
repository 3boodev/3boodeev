import 'package:flutter/material.dart';
import 'package:flutter_portfolio/view/about/about_me.dart';
import 'package:flutter_portfolio/view/certifications/certifications.dart';
import 'package:flutter_portfolio/view/contributions/contributions.dart';
import 'package:flutter_portfolio/view/intro/introduction.dart';
import 'package:flutter_portfolio/view/main/components/drawer/about.dart';
import 'package:flutter_portfolio/view/main/main_view.dart';
import 'package:flutter_portfolio/view/projects/project_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  MainView(pages: [
      const Introduction(),
      const AboutMeScreen(),
      ProjectsView(),
      Certifications(),
      Contributions(),
    ]);
  }
}
