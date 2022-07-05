// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/works.dart';

import 'package:portfolio/core/utils/device_type.dart';
import 'package:portfolio/presentation/widgets/footer.dart';
import 'package:portfolio/presentation/widgets/section_contents/works.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

import '../../core/widgets/toggle_theme_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final introKey = GlobalKey();
    final aboutKey = GlobalKey();
    final skillsKey = GlobalKey();
    final worksKey = GlobalKey();
    final projectsKey = GlobalKey();
    final size = MediaQuery.of(context).size;
    final sectionButtonConfigs = [
      SectionButtonConfigs(sectionKey: introKey, text: "Home"),
      SectionButtonConfigs(sectionKey: aboutKey, text: "About"),
      SectionButtonConfigs(sectionKey: skillsKey, text: "Skills"),
      SectionButtonConfigs(sectionKey: worksKey, text: "Work"),
      SectionButtonConfigs(sectionKey: projectsKey, text: "Projects"),
    ];
    return Scaffold(
      appBar: AppBar(
        title: TextButton(
          onPressed: () {
            Scrollable.ensureVisible(
              introKey.currentContext ?? context,
              duration: const Duration(milliseconds: 500),
            );
          },
          child: FittedBox(
            fit: BoxFit.fitWidth,
            child: Text(
              '<Schmosby/>',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ),
        actions: Device.isDesktop(size.width)
            ? [
                ...buildActions(
                  context: context,
                  configs: sectionButtonConfigs,
                ),
                const Padding(
                  padding: EdgeInsets.only(right: 10.0),
                  child: ToggleThemeWidget(),
                ),
              ]
            : null,
      ),
      endDrawer: !Device.isDesktop(size.width)
          ? RepaintBoundary(
              child: Drawer(
                child: SizedBox.expand(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const ToggleThemeWidget(),
                      ...buildActions(
                        context: context,
                        configs: sectionButtonConfigs,
                      ),
                    ],
                  ),
                ),
              ),
            )
          : null,
      extendBodyBehindAppBar: true,
      extendBody: true,
      body: Center(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          constraints: BoxConstraints(
            // maxWidth: 1440,
            maxHeight: MediaQuery.of(context).size.height,
          ),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight + 20),
                  key: introKey,
                  child: const SectionContainer(
                    content: Introduction(),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                SectionContainer(
                  title: const TitleWidget(
                    text: 'About Me',
                  ),
                  key: aboutKey,
                  content: const About(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                SectionContainer(
                  title: const TitleWidget(text: 'Skills'),
                  key: skillsKey,
                  content: const Skills(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                SectionContainer(
                  title: const TitleWidget(text: 'Work Experiences'),
                  key: worksKey,
                  content: const Works(),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 60, vertical: 40),
                  child: Divider(
                    thickness: 5,
                  ),
                ),
                SectionContainer(
                  title: const TitleWidget(text: 'Projects'),
                  key: projectsKey,
                  content: const Projects(),
                ),
                const SizedBox(height: 40),
                const FooterWidget()
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<Widget> buildActions({
    required List<SectionButtonConfigs> configs,
    required BuildContext context,
  }) {
    return configs.map((config) => SectionButtons(configs: config)).toList();
  }
}

class SectionButtons extends StatelessWidget {
  final SectionButtonConfigs configs;
  const SectionButtons({
    Key? key,
    required this.configs,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Scrollable.ensureVisible(
          configs.sectionKey.currentContext ?? context,
          duration: const Duration(milliseconds: 500),
        );
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      child: Text(
        configs.text,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }
}

class SectionButtonConfigs {
  final GlobalKey<State<StatefulWidget>> sectionKey;
  final String text;
  const SectionButtonConfigs({
    required this.sectionKey,
    required this.text,
  });
}
