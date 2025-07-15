import '../target/target.dart';

class ScoresheetCard {
  ScoresheetCard({
    required this.id,
    required this.name,
    required this.target,
    required this.shotsPerEnd,
    required this.ends,
  });

  factory ScoresheetCard.fromMap({required Map<String, Object?> map}) => ScoresheetCard(
        id: int.tryParse(map['id'].toString()) ?? 0,
        name: map['name'].toString(),
        ends: int.tryParse(map['ends'].toString()) ?? 0,
        shotsPerEnd: int.tryParse(map['shotsPerEnd'].toString()) ?? 0,
        target: Target.fromName(map['target'].toString()),
      );

  final int id;
  final String name;
  final Target target;
  final int shotsPerEnd;
  final int ends;
}
