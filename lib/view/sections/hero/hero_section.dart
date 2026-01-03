import 'package:flutter/material.dart';
import 'package:flutter_portfolio/res/theme.dart';
import 'package:flutter_portfolio/view/intro/components/animated_texts_componenets.dart';
import 'package:flutter_portfolio/view/main/components/connect_button.dart';

class HeroSection extends StatelessWidget {
  const HeroSection({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppTheme.primaryColor.withOpacity(0.1), // Placeholder
         image: const DecorationImage(
          image: AssetImage('assets/images/background.jpg'), // Ensure we have a background or use gradient
          fit: BoxFit.cover,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
            colors: [
              Colors.black.withOpacity(0.6),
              Colors.black.withOpacity(0.3),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const AnimatedImageContainer(
              width: 150,
              height: 200,
              image: 'assets/images/profile.png',
            ),
            // Text(
            //   'Abdullah Alamary',
            //   style: Theme.of(context).textTheme.displayMedium?.copyWith(
            //         color: Colors.white,
            //         fontWeight: FontWeight.bold,
            //       ),
            // ),
            // const SizedBox(height: 20),
            // Text(
            //   'Senior Mobile Engineer',
            //    style: Theme.of(context).textTheme.titleLarge?.copyWith(
            //         color: Colors.white70,
            //       ),
            // ),
            const SizedBox(height: 20),
             SizedBox(
               width: 600,
               child: Text(
                'I\'m a capable and confident Flutter developer with an extensive history of designing and coding solutions. I\'m passionate about learning new technologies and keeping myself up-to-date with the latest trends.',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Colors.white60,
                      height: 1.5,
                    ),
                           ),
             ),
            const SizedBox(height: 40),
            ConnectButton(),
          ],
        ),
      ),
    );
  }
}
