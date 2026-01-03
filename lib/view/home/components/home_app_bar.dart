import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeAppBar extends StatelessWidget {
  final double scrollOffset;
  final Function(int) onItemTap;
  const HomeAppBar({super.key, required this.scrollOffset, required this.onItemTap});

  @override
  Widget build(BuildContext context) {
    bool isScrolled = scrollOffset > 50;

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.defaultPadding, vertical: 10),
      color: isScrolled ? AppTheme.darkBgColor : AppTheme.darkBgColor,
      child: Row(
        children: [
          Image.asset(
            'assets/images/menu_icon.png',
            width: 50,
            height: 50,
          ),
          const Spacer(),
          if (MediaQuery.of(context).size.width > 700)
             Row(
               children: [
                 _NavBarItem(title: 'Profile', isScrolled: isScrolled, onTap: () => onItemTap(0)),
                 _NavBarItem(title: 'About Me', isScrolled: isScrolled, onTap: () => onItemTap(1)),
                 _NavBarItem(title: 'CERTIFICATIONS', isScrolled: isScrolled, onTap: () => onItemTap(2)),
                 _NavBarItem(title: 'Portfolio', isScrolled: isScrolled, onTap: () => onItemTap(3)),
                 _NavBarItem(title: 'Contact', isScrolled: isScrolled, onTap: () => onItemTap(4)),
               ],
             )
          else
             IconButton(
               icon: Icon(Icons.menu, color: isScrolled ? AppTheme.lightHeadingColor : Colors.white),
               onPressed: () {
                 Scaffold.of(context).openDrawer();
               },
             )
        ],
      ),
    );
  }
}

class _NavBarItem extends StatelessWidget {
  final String title;
  final bool isScrolled;
  final VoidCallback onTap;
  const _NavBarItem({required this.title, required this.isScrolled, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Text(
          title.toUpperCase(),
          style: TextStyle(
            color: isScrolled ? AppTheme.lightHeadingColor : Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
