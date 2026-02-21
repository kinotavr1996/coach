class Profile {
  const Profile({
    this.id,
    required this.role,
    required this.scope,
    required this.vision,
    required this.responsibility,
    required this.mission,
    required this.kpis,
    required this.stakeholders,
    required this.values,
    required this.updatedAt,
  });

  final int? id;
  final String role;
  final String scope;
  final String vision;
  final String responsibility;
  final String mission;
  final String kpis;
  final String stakeholders;
  final String values;
  final DateTime updatedAt;

  Profile copyWith({
    int? id,
    String? role,
    String? scope,
    String? vision,
    String? responsibility,
    String? mission,
    String? kpis,
    String? stakeholders,
    String? values,
    DateTime? updatedAt,
  }) {
    return Profile(
      id: id ?? this.id,
      role: role ?? this.role,
      scope: scope ?? this.scope,
      vision: vision ?? this.vision,
      responsibility: responsibility ?? this.responsibility,
      mission: mission ?? this.mission,
      kpis: kpis ?? this.kpis,
      stakeholders: stakeholders ?? this.stakeholders,
      values: values ?? this.values,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
