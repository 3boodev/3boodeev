import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:flutter_svg/svg.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialIconButton extends StatefulWidget {
  final String iconPath; // Using SVG paths as per existing code
  final String url;
  final Color? color;

  const SocialIconButton({
    super.key,
    required this.iconPath,
    required this.url,
    this.color,
  });

  @override
  State<SocialIconButton> createState() => _SocialIconButtonState();
}

class _SocialIconButtonState extends State<SocialIconButton> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
     cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () async {
          if (await canLaunchUrl(Uri.parse(widget.url))) {
            await launchUrl(Uri.parse(widget.url));
          }
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: _isHovered ? AppTheme.primaryColor : Colors.transparent,
            shape: BoxShape.circle,
            border: Border.all(color: AppTheme.primaryColor, width: 2),
          ),
          child: SvgPicture.asset(
            widget.iconPath,
            width: 20,
            height: 20,
            colorFilter: ColorFilter.mode(
              _isHovered ? Colors.white : (widget.color ?? AppTheme.lightBodyTextColor),
              BlendMode.srcIn,
            ),
          ),
        ),
      ),
    );
  }
}
