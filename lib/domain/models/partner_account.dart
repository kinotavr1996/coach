class PartnerAccount {
  const PartnerAccount({
    this.id,
    required this.email,
    required this.accessLevel,
    required this.reportSchedule,
    required this.isEnabled,
    required this.createdAt,
    required this.updatedAt,
  });

  final int? id;
  final String email;
  final String accessLevel;
  final String reportSchedule;
  final bool isEnabled;
  final DateTime createdAt;
  final DateTime updatedAt;
}
