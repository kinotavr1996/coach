enum ReminderCadence {
  daily,
  weekly,
}

extension ReminderCadenceX on ReminderCadence {
  String get storageValue {
    switch (this) {
      case ReminderCadence.daily:
        return 'daily';
      case ReminderCadence.weekly:
        return 'weekly';
    }
  }

  static ReminderCadence fromStorage(String value) {
    switch (value) {
      case 'daily':
        return ReminderCadence.daily;
      case 'weekly':
      default:
        return ReminderCadence.weekly;
    }
  }
}

class Reminder {
  const Reminder({
    this.id,
    required this.title,
    required this.body,
    required this.cadence,
    required this.hour,
    required this.minute,
    this.weekday,
    required this.isEnabled,
    required this.updatedAt,
  });

  final int? id;
  final String title;
  final String body;
  final ReminderCadence cadence;
  final int hour;
  final int minute;
  final int? weekday;
  final bool isEnabled;
  final DateTime updatedAt;

  Reminder copyWith({
    int? id,
    String? title,
    String? body,
    ReminderCadence? cadence,
    int? hour,
    int? minute,
    int? weekday,
    bool? isEnabled,
    DateTime? updatedAt,
  }) {
    return Reminder(
      id: id ?? this.id,
      title: title ?? this.title,
      body: body ?? this.body,
      cadence: cadence ?? this.cadence,
      hour: hour ?? this.hour,
      minute: minute ?? this.minute,
      weekday: weekday ?? this.weekday,
      isEnabled: isEnabled ?? this.isEnabled,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
