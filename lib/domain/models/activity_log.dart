class ActivityLog {
  const ActivityLog({
    this.id,
    required this.actionType,
    required this.entityType,
    this.entityId,
    required this.status,
    required this.createdAt,
  });

  final int? id;
  final String actionType;
  final String entityType;
  final int? entityId;
  final String status;
  final DateTime createdAt;
}
