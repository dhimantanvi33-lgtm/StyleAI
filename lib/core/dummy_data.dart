import '../models/clothing_item.dart';

class DummyData {
  static final _now = DateTime.now();

  static ClothingItem _item(String id, String type, String category,
      String color, String pattern, String season) =>
      ClothingItem(
        id: id,
        userId: 'demo',
        imageUrl: '',
        type: type,
        category: category,
        color: color,
        pattern: pattern,
        season: season,
        createdAt: _now,
      );

  static final List<ClothingItem> wardrobe = [
    _item('1', 'tshirt', 'top', 'black', 'solid', 'all'),
    _item('2', 'shirt', 'top', 'white', 'solid', 'summer'),
    _item('3', 'hoodie', 'top', 'grey', 'solid', 'winter'),
    _item('4', 'jeans', 'bottom', 'blue', 'solid', 'all'),
    _item('5', 'chinos', 'bottom', 'beige', 'solid', 'summer'),
    _item('6', 'sneakers', 'shoes', 'white', 'solid', 'all'),
    _item('7', 'watch', 'accessory', 'silver', 'solid', 'all'),
  ];

  static ClothingItem byId(String id) =>
      wardrobe.firstWhere((e) => e.id == id);

  static List<ClothingItem> get todaysOutfit =>
      [byId('2'), byId('4'), byId('6')];

  static const todaysReason =
      'A crisp white shirt with blue jeans keeps you cool and smart for a warm day.';
  static const weatherText = '28°C · Sunny';
}