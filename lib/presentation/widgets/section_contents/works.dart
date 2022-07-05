// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:portfolio/core/constants/works.dart';
import 'package:portfolio/core/utils/device_type.dart';

class Works extends StatelessWidget {
  const Works({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...works
              .map<Widget>(
                (work) => Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Wrap(
                    direction: Axis.horizontal,
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.start,
                    runSpacing: 60,
                    spacing: 60,
                    children: [
                      ConstrainedBox(
                        constraints: const BoxConstraints(maxWidth: 210),
                        child: SizedBox(
                          width: double.infinity,
                          child: Text.rich(
                            TextSpan(
                              text: work.company,
                              style: Theme.of(context).textTheme.headlineSmall,
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {
                                  launchUrl(Uri.parse(work.companyUrl));
                                },
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                      WorkDetails(
                        work: work,
                      ),
                    ],
                  ),
                ),
              )
              .toList(),
        ],
      ),
    );
  }
}

class WorkDetails extends StatelessWidget {
  final Work work;
  const WorkDetails({
    Key? key,
    required this.work,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: !Device.isDesktop(MediaQuery.of(context).size.width)
          ? CrossAxisAlignment.center
          : CrossAxisAlignment.start,
      children: [
        Text(
          work.jobTitle,
          style: Theme.of(context).textTheme.titleLarge,
        ),
        Text(
          work.dateStarted,
          style: Theme.of(context).textTheme.labelMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: 450,
          ),
          child: Text(
            work.accomplishments,
            style: Theme.of(context).textTheme.bodySmall,
            textAlign: !Device.isDesktop(MediaQuery.of(context).size.width)
                ? TextAlign.center
                : TextAlign.start,
          ),
        ),
      ],
    );
  }
}
