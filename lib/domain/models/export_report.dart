class ExportReport {
  const ExportReport({
    this.id,
    required this.period,
    required this.format,
    required this.filePath,
    required this.createdAt,
  });

  final int? id;
  final String period;
  final String format;
  final String filePath;
  final DateTime createdAt;
}
