class CertificateModel {
  final String name;
  final String organization;
  final String date;
  final String skills;
  final String credential;

  CertificateModel({
    required this.name,
    required this.organization,
    required this.date,
    required this.skills,
    required this.credential,
  });
}

List<CertificateModel> certificateList = [
  CertificateModel(
    name: 'Flutter – Ecommerce Complete App',
    organization: 'Udemy',
    date: 'MAY 2020',
    skills: 'Flutter . Dart',
    credential:  'https://www.udemy.com/share/105HNe3@v1tf1hSuErc0QGnJ4fO_q5burUQ3LUWSS6EO4DRbDni1D3QZEZsOiFPwqJiJNe0C/',
  ),
  CertificateModel(
    name: 'BI – Basic Course',
    organization: 'Udemy',
    date: 'MAR 2020',
    skills: 'Power BI & Tableau . SQL',
    credential:  'https://www.udemy.com/share/1020Zy3@PHEosl-CNIpvaxZvqW2U2jyR1yG_VARuWxWKgZWXpszvXBCswKzp_dXCQvPTzJ3h/',
  ),
  CertificateModel(
    name: 'Flutter – Advanced Course',
    organization: 'Udemy',
    date: 'JAN 2020',
    skills: 'Flutter . Dart',
    credential:  'https://www.udemy.com/share/106PyU3@IM6ijXaZt2UZWxtedp7kjLQOrU0lqdKavqLOINUYXBHLyiUGIpRu19eYZjlZ6BLX/',
  ),
  CertificateModel(
    name: 'Flutter Internship - Orange',
    organization: 'Orange Lab',
    date: 'JUN 2019',
    skills: 'Flutter . Dart . Programming',
    credential:  '',
  ),
  CertificateModel(
    name: 'Flutter Create - Google',
    organization: 'Udacity',
    date: 'MAY 2019',
    skills: 'Flutter . Dart . Programming',
    credential:  '',
  ),
  CertificateModel(
    name: 'Android Basics Nanodegree by Google',
    organization: 'Udacity',
    date: 'JAN 2018',
    skills: 'Java Basic and Kotlin with Android ',
    credential:  '',
  ),
];
