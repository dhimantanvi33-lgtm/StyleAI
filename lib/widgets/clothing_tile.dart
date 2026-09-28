import 'package:flutter/material.dart';
import '../core/app_theme.dart';
import '../models/clothing_item.dart';

Color colorFromName(String name) {
  const map = {
    'black': Color(0xFF222222),
    'white': Color(0xFFF2F2F2),
    'grey': Color(0xFF9E9E9E),
    'blue': Color(0xFF4A78C2),
    'beige': Color(0xFFD9C7A3),
    'silver': Color(0xFFC0C0C8),
    'red': Color(0xFFD64545),
    'green': Color(0xFF4C9A6A),
  };
  return map[name.toLowerCase()] ?? AppColors.accent;
}

IconData iconForCategory(String category) {
  switch (category) {
    case 'top':
      return Icons.checkroom_rounded;
    case 'bottom':
      return Icons.straighten_rounded;
    case 'shoes':
      return Icons.directions_walk_rounded;
    default:
      return Icons.watch_rounded;
  }
}

class ClothingTile extends StatelessWidget {
  final ClothingItem item;
  final double size;
  final VoidCallback? onTap;

  const ClothingTile(
      {super.key, required this.item, this.size = 110, this.onTap});

  @override
  Widget build(BuildContext context) {
    final c = colorFromName(item.color);
    final iconColor =
    c.computeLuminance() > 0.6 ? AppColors.textDark : Colors.white;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: size,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                color: c,
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: const Color(0xFFE3DFF0)),
              ),
              child: Icon(iconForCategory(item.category),
                  size: size * 0.4, color: iconColor),
            ),
            const SizedBox(height: 6),
            Text(item.displayName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.titleMedium?.copyWith(fontSize: 13)),
          ],
        ),
      ),
    );
  }
}