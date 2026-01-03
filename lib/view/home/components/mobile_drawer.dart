import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/theme.dart';

class MobileDrawer extends StatelessWidget {
  final Function(int) onNavItemTap;
  const MobileDrawer({super.key, required this.onNavItemTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppTheme.darkBgColor,
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: AppTheme.darkBgColor,
            ),
            child: Center(
              child: Image.asset(
                'assets/images/menu_icon.png',
              ),
            ),
          ),
          _buildDrawerItem(Icons.home, 'Home', () => onNavItemTap(0)),
          _buildDrawerItem(Icons.person, 'About', () => onNavItemTap(1)),
          _buildDrawerItem(Icons.design_services, 'Services', () => onNavItemTap(2)),
          _buildDrawerItem(Icons.grid_view, 'Portfolio', () => onNavItemTap(3)),
          _buildDrawerItem(Icons.contact_mail, 'Contact', () => onNavItemTap(4)),
        ],
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: AppTheme.lightBgColor),
      title: Text(title, style: const TextStyle(color: AppTheme.lightBgColor)),
      onTap: () {
        onTap();
      },
    );
  }
}
