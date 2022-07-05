// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';

import 'package:portfolio/core/utils/device_type.dart';

class SectionContainer extends StatelessWidget {
  final Widget? title;
  final Widget content;
  const SectionContainer({
    Key? key,
    this.title,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return RepaintBoundary(
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: Device.isMobile(size.width) ? 20 : 40,
        ),
        alignment: Alignment.center,
        constraints: const BoxConstraints(
          maxWidth: 1100,
          // maxHeight: 600,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Device.isMobile(size.width)
                  ? Alignment.center
                  : Alignment.centerLeft,
              child: title,
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.center,
              child: content,
            ),
          ],
        ),
      ),
    );
  }
}
