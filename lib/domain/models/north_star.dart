enum NorthStarHorizon {
  quarter,
  year,
}

extension NorthStarHorizonX on NorthStarHorizon {
  String get storageValue {
    switch (this) {
      case NorthStarHorizon.quarter:
        return 'quarter';
      case NorthStarHorizon.year:
        return 'year';
    }
  }

  static NorthStarHorizon fromStorage(String value) {
    switch (value) {
      case 'quarter':
        return NorthStarHorizon.quarter;
      case 'year':
      default:
        return NorthStarHorizon.year;
    }
  }
}

class NorthStar {
  const NorthStar({
    this.id,
    this.roleContextId,
    required this.title,
    required this.description,
    required this.horizon,
    required this.keyword,
    required this.emotion,
    this.imagePath,
    required this.updatedAt,
  });

  final int? id;
  final int? roleContextId;
  final String title;
  final String description;
  final NorthStarHorizon horizon;
  final String keyword;
  final String emotion;
  final String? imagePath;
  final DateTime updatedAt;

  NorthStar copyWith({
    int? id,
    int? roleContextId,
    String? title,
    String? description,
    NorthStarHorizon? horizon,
    String? keyword,
    String? emotion,
    String? imagePath,
    DateTime? updatedAt,
  }) {
    return NorthStar(
      id: id ?? this.id,
      roleContextId: roleContextId ?? this.roleContextId,
      title: title ?? this.title,
      description: description ?? this.description,
      horizon: horizon ?? this.horizon,
      keyword: keyword ?? this.keyword,
      emotion: emotion ?? this.emotion,
      imagePath: imagePath ?? this.imagePath,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }
}
