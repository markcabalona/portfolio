import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/presentation/widgets/skills/skill_iconbutton.dart';

import 'package:url_launcher/url_launcher.dart';
import 'project_details.dart';

class ProjectCard extends StatelessWidget {
  final Project project;
  const ProjectCard({
    Key? key,
    required this.project,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 10,
      borderOnForeground: true,
      clipBehavior: Clip.hardEdge,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          MouseRegion(
            cursor: SystemMouseCursors.click,
            child: GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => ProjectDetails(project: project),
                  ),
                );
              },
              child: Stack(
                children: [
                  Hero(
                    tag: project,
                    child: SizedBox(
                      width: double.infinity,
                      height: 220,
                      child: Image.asset(
                        project.imageUrl,
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        color: Theme.of(context)
                            .colorScheme
                            .onSecondaryContainer
                            .withOpacity(.6),
                      ),
                      child: Text(
                        project.projectTitle,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: Theme.of(context)
                                  .colorScheme
                                  .secondaryContainer,
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ...project.techStack
                  .map<Widget>(
                    (tech) => Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SkillIconButton(
                        skill: tech,
                        size: 20,
                      ),
                    ),
                  )
                  .toList(),
              const Spacer(),
              if (project.repoUrl != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text.rich(
                    TextSpan(
                      text: 'Github Repo',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(project.repoUrl!));
                        },
                    ),
                  ),
                ),
            ],
          ),
          Row(
            children: [
              ...project.supportedPlatforms
                  .map<Widget>(
                    (platform) => Padding(
                      padding: const EdgeInsets.all(4),
                      child: Tooltip(
                        message: platform.name,
                        child: Image.asset(
                          platform.assetImagePath,
                          color: Theme.of(context).colorScheme.primary,
                          semanticLabel: '${platform.name} icon',
                          height: 24,
                        ),
                      ),
                    ),
                  )
                  .toList(),
              const Spacer(),
              if (project.liveDemo != null)
                Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Text.rich(
                    TextSpan(
                      text: 'Live Demo',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            decoration: TextDecoration.underline,
                          ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          launchUrl(Uri.parse(project.liveDemo!));
                        },
                    ),
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
