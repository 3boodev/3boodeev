import 'package:flutter/material.dart';
import 'package:flutter_portfolio/model/certificate_model.dart';
import 'package:flutter_portfolio/res/constants.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CertificationsSection extends StatelessWidget {
  const CertificationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    var isMobile = MediaQuery.of(context).size.width < 700;
    var isTablet = MediaQuery.of(context).size.width >= 700 && MediaQuery.of(context).size.width < 1100;

    return Container(
      color: AppTheme.darkBgColor,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 20),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: AppTheme.maxWidth),
          child: Column(
            children: [
              Text(
                'CERTIFICATIONS',
                style: GoogleFonts.poppins(
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.lightBodyTextColor.withOpacity(0.8),
                  letterSpacing: 2,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                'My Achievements',
                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: AppTheme.lightSurfaceColor,
                    ),
              ),
              const SizedBox(height: 50),
              GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: isMobile ? 1 : (isTablet ? 2 : 3),
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20,
                  childAspectRatio: 1.5,
                ),
                itemCount: certificateList.length,
                itemBuilder: (context, index) {
                  return CertificateCard(certificate: certificateList[index]);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CertificateCard extends StatefulWidget {
  final CertificateModel certificate;
  const CertificateCard({super.key, required this.certificate});

  @override
  State<CertificateCard> createState() => _CertificateCardState();
}

class _CertificateCardState extends State<CertificateCard> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return
      AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          margin: const EdgeInsets.symmetric(
              vertical: defaultPadding, horizontal: defaultPadding),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              gradient: const LinearGradient(colors: [
                Colors.pinkAccent,
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
          child:  MouseRegion(
            onEnter: (_) => setState(() => _isHovered = true),
            onExit: (_) => setState(() => _isHovered = false),
            child: InkWell(
              onTap: () {
                if (widget.certificate.credential.isNotEmpty) {
                  launchUrl(Uri.parse(widget.certificate.credential));
                }
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    _isHovered ?Colors.pink: AppTheme.darkSurfaceColor,
                    _isHovered ?Colors.blue.shade900: AppTheme.darkSurfaceColor,
                  ]),
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      FontAwesomeIcons.bookmark,
                      size: 50,
                      color: _isHovered ? Colors.white : AppTheme.primaryColor,
                    ),
                    const SizedBox(height: 20),
                    Text(
                      widget.certificate.name,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: _isHovered ? Colors.white : AppTheme.lightBodyTextColor,
                      ),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 10),
                    Text(
                      widget.certificate.organization,
                      style: TextStyle(
                        color: _isHovered ? Colors.white.withOpacity(0.9) : AppTheme.lightBodyTextColor,
                        fontWeight: FontWeight.w500,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      widget.certificate.date,
                      style: TextStyle(
                          color: _isHovered ? Colors.white.withOpacity(0.7) : AppTheme.lightBodyTextColor.withOpacity(0.6),
                          fontSize: 12
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
            ),
          )
      );
  }
}
