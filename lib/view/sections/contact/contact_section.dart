import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_portfolio/res/social_data.dart';
import 'package:flutter_portfolio/view/components/copyable_text.dart';
import 'package:flutter_portfolio/view/components/social_icon_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      color: AppTheme.darkBgColor,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxWidth),
          child: Column(
            children: [
              Text(
                'CONTACT',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightBodyTextColor.withOpacity(0.8),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'Contact Me',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightSurfaceColor,
                    ),
              ),
              const SizedBox(height: 50),
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: AppTheme.darkSurfaceColor,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 10,
                      offset: const Offset(0, 5),
                    )
                  ],
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(child: _buildTextField('Your Name')),
                        const SizedBox(width: 20),
                        Expanded(child: _buildTextField('Your Email')),
                      ],
                    ),
                    const SizedBox(height: 20),
                    _buildTextField('Subject'),
                    const SizedBox(height: 20),
                    _buildTextField('Message', maxLines: 5),
                    const SizedBox(height: 30),
                    InkWell(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content:
                              Text('Message sent successfully!')),
                        );
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 25),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          boxShadow:const [
                            BoxShadow(color: Colors.blue,offset: Offset(0, -1),blurRadius: 5),
                            BoxShadow(color: Colors.red,offset: Offset(0, 1),blurRadius: 5),
                          ],
                          gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: [
                                Colors.pink,
                                Colors.blue.shade900,
                              ]),
                        ),
                        child: const Text('SEND MESSAGE', style: TextStyle(color: Colors.white)),
                      ),
                    ),
                  ],
                ),
              ),
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
      ),
    );
  }

  Widget _buildTextField(String label, {int maxLines = 1}) {
    return TextField(
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: label,
        filled: true,
        fillColor: AppTheme.darkBodyTextColor.withOpacity(0.2),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: Colors.black12),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: const BorderSide(color: AppTheme.primaryColor),
        ),
        contentPadding:
            const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
      ),
    );
  }
}

class _ContactCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget content;

  const _ContactCard(
      {required this.icon, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(30),
      width: double.infinity,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, 5))
          ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: AppTheme.primaryColor.withOpacity(0.1),
              shape: BoxShape.circle, // Dotted border effect simulation
            ),
            child: Icon(icon, color: AppTheme.primaryColor, size: 30),
          ),
          const SizedBox(height: 20),
          Text(
            title,
            style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: AppTheme.lightHeadingColor),
          ),
          const SizedBox(height: 10),
          content,
        ],
      ),
    );
  }
}
