// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/presentation/widgets/social_links_iconbuttons.dart';

import 'package:portfolio/core/utils/device_type.dart';

class Introduction extends StatelessWidget {
  const Introduction({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const IntroductionImage(),
        const SizedBox(
          height: 20,
        ),
        Text.rich(
          textAlign: TextAlign.center,
          TextSpan(
            children: [
              if (Device.isDesktop(size.width))
                TextSpan(
                  text: "Hi, I'm ",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: !Device.isDesktop(size.width) ? 48 : null,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              TextSpan(
                text: "Mark Cabalona",
                style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      fontSize: !Device.isDesktop(size.width) ? 48 : null,
                    ),
              ),
            ],
          ),
        ),
        RepaintBoundary(
          child: AnimatedTextKit(
            repeatForever: true,
            animatedTexts: [
              TypewriterAnimatedText(
                "> Flutter Developer",
                textStyle: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      fontSize: !Device.isDesktop(size.width) ? 24 : null,
                    ),
                cursor: '|',
                speed: const Duration(milliseconds: 100),
              ),
            ],
          ),
        ),
        const SocialLinkIconButtons(iconSize: 48),
      ],
    );
  }
}

class IntroductionImage extends StatelessWidget {
  const IntroductionImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(
        maxHeight: 350,
        maxWidth: 350,
      ),
      height: 300,
      width: 300,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Theme.of(context).colorScheme.secondary),
      child: Image.asset(
        'assets/images/me_at_wed.jpg',
        height: 300,
        width: 300,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
