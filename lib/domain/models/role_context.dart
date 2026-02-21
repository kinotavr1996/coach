class RoleContext {
  const RoleContext({
    this.id,
    required this.profileId,
    required this.name,
    required this.description,
    required this.isActive,
    required this.updatedAt,
  });

  final int? id;
  final int profileId;
  final String name;
  final String description;
  final bool isActive;
  final DateTime updatedAt;
}
