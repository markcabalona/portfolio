import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SocialLinkIconButtons extends StatelessWidget {
  final double iconSize;
  const SocialLinkIconButtons({
    Key? key,
    required this.iconSize,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: socailLinks
          .map(
            (socialLink) => IconButton(
              onPressed: () async {
                await launchUrl(
                  Uri.parse(
                    socialLink.link,
                  ),
                );
              },
              iconSize: iconSize,
              icon: socialLink.icon,
              tooltip: socialLink.name,
            ),
          )
          .toList(),
    );
  }
}