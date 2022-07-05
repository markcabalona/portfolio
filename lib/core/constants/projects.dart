// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:portfolio/core/constants/constants.dart';

class Platform {
  final String name;
  final String assetImagePath;
  const Platform({
    required this.name,
    required this.assetImagePath,
  });
}

abstract class SupportedPlatforms {
  static const android =
      Platform(name: 'Android', assetImagePath: 'assets/icons/android.png');
  static const web =
      Platform(name: 'Web', assetImagePath: 'assets/icons/web.png');
}

class Project {
  final String projectTitle;
  final String desscription;
  final String? repoUrl;
  final String? liveDemo;
  final String imageUrl;
  final List<Platform> supportedPlatforms;
  final List<SkillModel> techStack;
  const Project({
    required this.projectTitle,
    required this.desscription,
    this.repoUrl,
    this.liveDemo,
    required this.imageUrl,
    required this.supportedPlatforms,
    required this.techStack,
  });
}

const projects = [
  Projects.projectManager,
  Projects.freedomWall,
  Projects.newsApp,
  Projects.axieMonitoring,
];

abstract class Projects {
  static const projectManager = Project(
    projectTitle: 'Project Manager',
    desscription:
        'This is actually a remake of my first ever flutter app (a todo app). I improved its UI and added more features such as email verification, dark mode, google sign in, and more.\nNOTE: EMAIL VERIFICATION PLUGIN IS UNDERMAINTENANCE OTP MIGHT NOT WORK ATM',
    repoUrl: 'https://github.com/markcabalona/project-manager',
    liveDemo: 'https://markcabalona.github.io/project-manager',
    imageUrl: 'assets/project-images/project-manager.png',
    supportedPlatforms: [SupportedPlatforms.android, SupportedPlatforms.web],
    techStack: [
      Skills.flutter,
      Skills.dart,
      Skills.firebase,
    ],
  );
  static const freedomWall = Project(
    projectTitle: 'FreedomWall',
    desscription:
        'A simple web applicaton where anyone can post anything on the wall anonymously.',
    repoUrl: 'https://github.com/markcabalona/freedomwall',
    imageUrl: 'assets/project-images/freedomwall.png',
    liveDemo: 'https://markcabalona.github.io/freedomwall-webapp',
    supportedPlatforms: [SupportedPlatforms.web],
    techStack: [
      Skills.flutter,
      Skills.dart,
      Skills.python,
      Skills.fastAPI,
    ],
  );
  static const newsApp = Project(
    projectTitle: 'NewsApp',
    desscription: 'A simple news mobile app with restful api integration.',
    repoUrl: 'https://github.com/markcabalona/newsapp',
    imageUrl: 'assets/project-images/news-app.png',
    supportedPlatforms: [SupportedPlatforms.android],
    techStack: [
      Skills.flutter,
      Skills.dart,
    ],
  );
  static const axieMonitoring = Project(
    projectTitle: 'Axie Monitoring',
    desscription:
        'Mobile and web applicaton where users can track and monitor xtheir axie infinity assets.',
    imageUrl: 'assets/project-images/axie-monitoring.png',
    supportedPlatforms: [SupportedPlatforms.android],
    techStack: [
      Skills.flutter,
      Skills.dart,
    ],
  );
}
