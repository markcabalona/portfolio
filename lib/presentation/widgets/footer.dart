
import 'package:flutter/material.dart';
import 'package:portfolio/core/theme/custom_theme.dart';

import 'package:portfolio/presentation/widgets/widgets.dart';

class FooterWidget extends StatefulWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  State<FooterWidget> createState() => _FooterWidgetState();
}

class _FooterWidgetState extends State<FooterWidget> {
  @override
  void initState() {
    super.initState();
    CustomTheme().addListener(() {
      if (mounted) {
        setState(() {});
      }
    });
  }

  @override
  void dispose() {
    CustomTheme().removeListener(() {});
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Theme.of(context).colorScheme.secondaryContainer,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      constraints: const BoxConstraints(maxHeight: 200),
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SocialLinkIconButtons(iconSize: 32),
          Text.rich(
            style: Theme.of(context).textTheme.titleSmall,
            textAlign: TextAlign.center,
            const TextSpan(
              children: [
                TextSpan(
                  text: 'Made by ',
                ),
                TextSpan(
                  text: 'Mark Reyes Cabalona. ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                TextSpan(
                  text: 'All rights reserved.',
                ),
              ],
            ),
          ),
          Text(
            '<Schmosby/>',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}
