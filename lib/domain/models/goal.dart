enum GoalPriority {
  p0,
  p1,
  p2,
}

extension GoalPriorityX on GoalPriority {
  String get storageValue {
    switch (this) {
      case GoalPriority.p0:
        return 'p0';
      case GoalPriority.p1:
        return 'p1';
      case GoalPriority.p2:
        return 'p2';
    }
  }

  static GoalPriority fromStorage(String value) {
    switch (value) {
      case 'p0':
        return GoalPriority.p0;
      case 'p1':
        return GoalPriority.p1;
      case 'p2':
      default:
        return GoalPriority.p2;
    }
  }
}

enum GoalStatus {
  active,
  paused,
  done,
  archived,
}

extension GoalStatusX on GoalStatus {
  String get storageValue {
    switch (this) {
      case GoalStatus.active:
        return 'active';
      case GoalStatus.paused:
        return 'paused';
      case GoalStatus.done:
        return 'done';
      case GoalStatus.archived:
        return 'archived';
    }
  }

  static GoalStatus fromStorage(String value) {
    switch (value) {
      case 'active':
        return GoalStatus.active;
      case 'paused':
        return GoalStatus.paused;
      case 'done':
        return GoalStatus.done;
      case 'archived':
      default:
        return GoalStatus.archived;
    }
  }
}

class Goal {
  const Goal({
    this.id,
    this.roleContextId,
    this.northStarId,
    required this.title,
    required this.priority,
    required this.status,
    required this.growGoal,
    required this.growReality,
    required this.growOptions,
    required this.growWayForward,
    required this.smartSpecific,
    required this.smartMeasurable,
    required this.smartAchievable,
    required this.smartRelevant,
    required this.smartTimeBound,
    this.deadline,
    required this.resources,
    required this.obstacles,
    required this.updatedAt,
  });

  final int? id;
  final int? roleContextId;
  final int? northStarId;
  final String title;
  final GoalPriority priority;
  final GoalStatus status;
  final String growGoal;
  final String growReality;
  final String growOptions;
  final String growWayForward;
  final String smartSpecific;
  final String smartMeasurable;
  final String smartAchievable;
  final String smartRelevant;
  final String smartTimeBound;
  final DateTime? deadline;
  final String resources;
  final String obstacles;
  final DateTime updatedAt;

  Goal copyWith({
    int? id,
    int? roleContextId,
    int? northStarId,
    String? title,
    GoalPriority? priority,
    GoalStatus? status,
    String? growGoal,
    String? growReality,
    String? growOptions,
    String? growWayForward,
    String? smartSpecific,
    String? smartMeasurable,
    String? smartAchievable,
    String? smartRelevant,
    String? smartTimeBound,
    DateTime? deadline,
    String? resources,
    String? obstacles,
    DateTime? updatedAt,
  }) {
    return Goal(
      id: id ?? this.id,
      roleContextId: roleContextId ?? this.roleContextId,
      northStarId: northStarId ?? this.northStarId,
      title: title ?? this.title,
      priority: priority ?? this.priority,
      status: status ?? this.status,
      growGoal: growGoal ?? this.growGoal,
      growReality: growReality ?? this.growReality,
      growOptions: growOptions ?? this.growOptions,
      growWayForward: growWayForward ?? this.growWayForward,
      smartSpecific: smartSpecific ?? this.smartSpecific,
      smartMeasurable: smartMeasurable ?? this.smartMeasurable,
      smartAchievable: smartAchievable ?? this.smartAchievable,
      smartRelevant: smartRelevant ?? this.smartRelevant,
      smartTimeBound: smartTimeBound ?? this.smartTimeBound,
      deadline: deadline ?? this.deadline,
      resources: resources ?? this.resources,
      obstacles: obstacles ?? this.obstacles,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
