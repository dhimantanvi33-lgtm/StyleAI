import 'package:flutter/material.dart';
import 'package:style_ai/widgets/place_holder_screen.dart';

class WardrobeScreen extends StatelessWidget {
  const WardrobeScreen({super.key});

  @override
  Widget build(BuildContext context) => const PlaceholderScreen(
    title: 'My Wardrobe',
    icon: Icons.checkroom_rounded,
    message: 'Wardrobe grid arrives in step 9',
    showAppBar: false,
  );
}