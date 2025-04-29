class ContributionModel {
  final String name;
  final String description;
  final String credential;

  ContributionModel({
    required this.name,
    required this.description,
    required this.credential,
  });
}

List<ContributionModel> contributionList = [
  ContributionModel(
    name: 'saudi_riyal_symbol',
    description:
        'A lightweight Flutter widget to elegantly display prices in Saudi Riyals using a custom SAR symbol font.',
    credential: 'https://pub.dev/packages/saudi_riyal_symbol',
  ),
  ContributionModel(
    name: 'flutter_project_booster',
    description:
        'A CLI tool to quickly bootstrap your Flutter project\'s structure, clean up your pubspec.yaml, and remove unused dependencies.',
    credential: 'https://pub.dev/packages/flutter_project_booster',
  ),
  ContributionModel(
    name: 'unused_assets_removal',
    description:
        'A CLI tool to scan and delete unused asset files in your Flutter project. Optimize your app size and keep your project clean!',
    credential: 'https://pub.dev/packages/unused_assets_removal',
  ),
  ContributionModel(
    name: 'smart_dropdown_plus',
    description: 'A simple yet flexible dropdown widget for Flutter',
    credential: 'https://pub.dev/packages/smart_dropdown_plus',
  ),
];
