import 'package:flutter/material.dart';

import '../../widgets/place_holder_screen.dart';

class StylistScreen extends StatelessWidget {
  const StylistScreen({super.key});

  @override
  Widget build(BuildContext context) => const PlaceholderScreen(
    title: 'AI Stylist',
    icon: Icons.auto_awesome,
    message: 'Chat arrives in step 23',
    showAppBar: false,
  );
}