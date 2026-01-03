import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_portfolio/res/theme.dart';

class CopyableText extends StatefulWidget {
  final String text;
  final String title;
  final TextStyle? style;
  final IconData? icon;

  const CopyableText({
    super.key,
    required this.text,
    required this.title,
    this.style,
    this.icon,
  });

  @override
  State<CopyableText> createState() => _CopyableTextState();
}

class _CopyableTextState extends State<CopyableText> {
  bool _isHovered = false;

  void _copyToClipboard(BuildContext context) {
    Clipboard.setData(ClipboardData(text: widget.text));
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('${widget.title} copied to clipboard!'),
        behavior: SnackBarBehavior.floating,
        backgroundColor: AppTheme.primaryColor,
        duration: const Duration(seconds: 2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: GestureDetector(
        onTap: () => _copyToClipboard(context),
        child: Tooltip(
          message: 'Click to copy',
          child: Container(
             padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
             decoration: BoxDecoration(
               // color: _isHovered ? AppTheme.primaryColor.withOpacity(0.1) : Colors.transparent,
               borderRadius: BorderRadius.circular(8),
             ),
             child: Row(
               mainAxisSize: MainAxisSize.min,
               children: [
                 Column(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     if(widget.title.isNotEmpty)
                     Text(
                       widget.title,
                       style: const TextStyle(
                         fontWeight: FontWeight.bold,
                         fontSize: 12,
                         color: AppTheme.lightSurfaceColor,
                       ),
                     ),
                     Text(
                       widget.text,
                       style: widget.style ?? const TextStyle(color: AppTheme.lightBodyTextColor),
                     ),
                   ],
                 ),
                 if (_isHovered) ...[
                   const SizedBox(width: 8),
                   const Icon(Icons.copy, size: 14, color: AppTheme.primaryColor),
                 ],
               ],
             ),
          ),
        ),
      ),
    );
  }
}
