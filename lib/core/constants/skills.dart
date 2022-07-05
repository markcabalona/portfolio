// ignore_for_file: public_member_api_docs, sort_constructors_first

abstract class Skills {
  static const dart = SkillModel(
    name: 'Dart',
    percentage: .7,
    assetImagePath: 'assets/icons/dart.png',
    url: 'https://dart.dev/',
  );
  static const flutter = SkillModel(
    name: 'Flutter',
    percentage: .7,
    assetImagePath: 'assets/icons/flutter.png',
    url: 'https://flutter.dev/',
  );
  static const python = SkillModel(
    name: 'Python',
    percentage: .6,
    assetImagePath: 'assets/icons/python.png',
    url: 'https://www.python.org/',
  );
  static const fastAPI = SkillModel(
    name: 'FastAPI',
    percentage: .5,
    assetImagePath: 'assets/icons/fastapi.png',
    url: 'https://fastapi.tiangolo.com/',
  );
  static const git = SkillModel(
    name: 'Git',
    percentage: .3,
    assetImagePath: 'assets/icons/git.png',
    url: 'https://git-scm.com/',
  );
  static const firebase = SkillModel(
    name: 'Firebase',
    percentage: .4,
    assetImagePath: 'assets/icons/firebase.png',
    url: 'https://firebase.google.com/',
  );
}

const List<SkillModel> skills = [
  Skills.dart,
  Skills.flutter,
  Skills.python,
  Skills.fastAPI,
  Skills.git,
  Skills.firebase,
];

class SkillModel {
  final String name;
  final double percentage;
  final String assetImagePath;
  final String url;
  const SkillModel({
    required this.name,
    required this.percentage,
    required this.assetImagePath,
    required this.url,
  });
}
