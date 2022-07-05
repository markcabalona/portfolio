// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:portfolio/core/constants/constants.dart';
import 'package:portfolio/presentation/widgets/widgets.dart';

class Projects extends StatefulWidget {
  const Projects({
    Key? key,
  }) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  late final List<Project> visibleProjects;
  late final int projectsCount;

  @override
  void initState() {
    super.initState();
    projectsCount = projects.length;
    visibleProjects = projects
        .getRange(
          0,
          projectsCount > 3 ? 3 : projectsCount,
        )
        .toList();
  }

  void _loadMoreProjects() {
    setState(() {
      int visibleCount = visibleProjects.length;
      visibleProjects.addAll(
        projects.getRange(
          visibleCount,
          projectsCount - visibleCount > 3 ? visibleCount + 3 : projectsCount,
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Wrap(
        alignment: WrapAlignment.start,
        crossAxisAlignment: WrapCrossAlignment.center,
        runAlignment: WrapAlignment.center,
        children: [
          ...visibleProjects.map(
            (project) => ConstrainedBox(
              constraints: const BoxConstraints(
                maxWidth: 300,
              ),
              child: ProjectCard(project: project),
            ),
          ),
          if (visibleProjects.length < projectsCount)
            Container(
              width: 300,
              height: 272,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
              ),
              alignment: Alignment.center,
              child: Tooltip(
                message: 'See more projects',
                child: TextButton(
                  onPressed: _loadMoreProjects,
                  child: Container(
                    alignment: Alignment.center,
                    height: 150,
                    width: 150,
                    child: Text(
                      'See more...',
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
