import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:url_launcher/url_launcher.dart';

class SkillIconButton extends StatelessWidget {
  final SkillModel skill;
  final double? size;
  const SkillIconButton({
    Key? key,
    required this.skill,
    this.size,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: () {
          launchUrl(Uri.parse(skill.url));
        },
        child: Tooltip(
          message: skill.name,
          child: Image.asset(
            skill.assetImagePath,
            color: Theme.of(context).colorScheme.primary,
            semanticLabel: '${skill.name} icon',
            height: size,
          ),
        ),
      ),
    );
  }
}
