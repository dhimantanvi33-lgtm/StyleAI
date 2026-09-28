class ClothingItem {
  final String id;
  final String userId;
  final String imageUrl;
  final String type; // tshirt, jeans, sneakers...
  final String category; // top, bottom, shoes, accessory
  final String color;
  final String pattern;
  final String season;
  final DateTime createdAt;

  const ClothingItem({
    required this.id,
    required this.userId,
    required this.imageUrl,
    required this.type,
    required this.category,
    required this.color,
    required this.pattern,
    required this.season,
    required this.createdAt,
  });

  String get displayName => '${color[0].toUpperCase()}${color.substring(1)} $type';
}