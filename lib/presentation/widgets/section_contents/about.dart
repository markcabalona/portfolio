import 'package:flutter/material.dart';
import 'package:portfolio/core/utils/device_type.dart';

class About extends StatelessWidget {
  const About({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return Wrap(
      direction: Axis.horizontal,
      alignment: WrapAlignment.center,
      crossAxisAlignment: WrapCrossAlignment.center,
      runSpacing: 20,
      spacing: 20,
      children: [
        SizedBox(
          width: 200,
          height: 200,
          child: Image.asset(
            'assets/images/markcabalona_bnw.jpg',
          ),
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 400),
          child: Text.rich(
            const TextSpan(
              children: [
                TextSpan(
                  text: 'Hello! My name is ',
                ),
                TextSpan(
                    text: 'Mark Cabalona ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(
                  text:
                      "Amet ullamco nulla amet veniam qui excepteur aliqua sit sunt in ea quis incididunt.Dolor esse velit deserunt voluptate mollit occaecat. Excepteur sit excepteur culpa in aliquip labore sint elit dolore amet Lorem eiusmod. Anim exercitation sint ex nisi ad irure et exercitation amet reprehenderit excepteur duis consectetur. Occaecat occaecat ea exercitation nostrud Lorem quis nisi occaecat fugiat eiusmod quis dolor.",
                ),
              ],
            ),
            textAlign: Device.isDesktop(size.width)
                ? TextAlign.justify
                : TextAlign.center,

            style: Theme.of(context).textTheme.caption,
          ),
        ),
      ],
    );
  }
}
