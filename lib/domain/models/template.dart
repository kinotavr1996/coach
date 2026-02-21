class Template {
  const Template({
    this.id,
    required this.type,
    required this.title,
    required this.content,
    required this.tags,
  });

  final int? id;
  final String type;
  final String title;
  final String content;
  final String tags;
}
