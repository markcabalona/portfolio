// ignore_for_file: public_member_api_docs, sort_constructors_first
class Work {
  final String company;
  final String companyUrl;
  final String jobTitle;
  final String accomplishments;
  final String dateStarted;
  const Work({
    required this.company,
    required this.companyUrl,
    required this.jobTitle,
    required this.accomplishments,
    required this.dateStarted,
  });
}

abstract class WorkExperiences {
  static const xtendly = Work(
    company: 'Xtendly',
    companyUrl: 'https://xtendly.com/',
    jobTitle: 'Junior Flutter Developer',
    accomplishments:
        'Consequat eiusmod minim irure ad aute mollit excepteur tempor adipisicing consectetur voluptate pariatur. Exercitation incididunt deserunt est tempor Lorem nisi proident reprehenderit commodo. Irure ipsum eu voluptate eu dolore culpa excepteur enim eiusmod tempor nisi et id. Ullamco est tempor occaecat cillum laborum elit aliqua sint excepteur. Aliquip voluptate aliquip ut mollit dolore nostrud.',
    dateStarted: '2022 June',
  );
  static const nittiv = Work(
    company: 'Nittiv',
    companyUrl: 'https://nittiv.com/',
    jobTitle: 'Developer (Voluntary Work)',
    accomplishments:
        'Consequat eiusmod minim irure ad aute mollit excepteur tempor adipisicing consectetur voluptate pariatur. Exercitation incididunt deserunt est tempor Lorem nisi proident reprehenderit commodo. Irure ipsum eu voluptate eu dolore culpa excepteur enim eiusmod tempor nisi et id. Ullamco est tempor occaecat cillum laborum elit aliqua sint excepteur. Aliquip voluptate aliquip ut mollit dolore nostrud.',
    dateStarted: '2022 May',
  );
}

const works = [
  WorkExperiences.xtendly,
  WorkExperiences.nittiv,
];
