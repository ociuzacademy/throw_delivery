// To parse this JSON data, do
//
//     final appovalStatus = appovalStatusFromJson(jsonString);

enum AppovalStatus {
  approved('approved'),
  pending('pending'),
  rejected('rejected');

  final String value;
  const AppovalStatus(this.value);

  factory AppovalStatus.fromString(String? name) {
    if (name == null) return AppovalStatus.pending;
    return AppovalStatus.values.firstWhere(
      (e) => e.value == name,
      orElse: () => AppovalStatus.pending,
    );
  }

  String toJson() => value;
}
