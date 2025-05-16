import '../target/target.dart';

class ScoresheetCard {
  ScoresheetCard({
    required this.name,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
  });

  factory ScoresheetCard.fromMap({required Map<String, Object?> map}) {
    return ScoresheetCard(
      name: map['name'].toString(),
      ends: int.tryParse(map['ends'].toString()) ?? 0,
      shotsPerEnd: int.tryParse(map['shotsPerEnd'].toString()) ?? 0,
      target: Target.USA(),
    );
  }

  String name;
  Target target;
  int shotsPerEnd;
  int ends;
}
