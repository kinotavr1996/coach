enum CheckInCadence {
  daily,
  weekly,
  monthly,
}

extension CheckInCadenceX on CheckInCadence {
  String get storageValue {
    switch (this) {
      case CheckInCadence.daily:
        return 'daily';
      case CheckInCadence.weekly:
        return 'weekly';
      case CheckInCadence.monthly:
        return 'monthly';
    }
  }

  static CheckInCadence fromStorage(String value) {
    switch (value) {
      case 'daily':
        return CheckInCadence.daily;
      case 'weekly':
        return CheckInCadence.weekly;
      case 'monthly':
        return CheckInCadence.monthly;
      default:
        return CheckInCadence.weekly;
    }
  }
}

class CheckIn {
  const CheckIn({
    this.id,
    this.roleContextId,
    required this.cadence,
    required this.date,
    required this.progressPercent,
    required this.blockers,
    required this.lessons,
    required this.updatedAt,
  });

  final int? id;
  final int? roleContextId;
  final CheckInCadence cadence;
  final DateTime date;
  final int progressPercent;
  final String blockers;
  final String lessons;
  final DateTime updatedAt;

  CheckIn copyWith({
    int? id,
    int? roleContextId,
    CheckInCadence? cadence,
    DateTime? date,
    int? progressPercent,
    String? blockers,
    String? lessons,
    DateTime? updatedAt,
  }) {
    return CheckIn(
      id: id ?? this.id,
      roleContextId: roleContextId ?? this.roleContextId,
      cadence: cadence ?? this.cadence,
      date: date ?? this.date,
      progressPercent: progressPercent ?? this.progressPercent,
      blockers: blockers ?? this.blockers,
      lessons: lessons ?? this.lessons,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
