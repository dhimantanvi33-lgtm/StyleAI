import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';
import '../core/dummy_data.dart';
import '../widgets/clothing_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  String get _greeting {
    final h = DateTime.now().hour;
    if (h < 12) return 'Good morning';
    if (h < 17) return 'Good afternoon';
    return 'Good evening';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            // Header
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('$_greeting 👋', style: theme.textTheme.bodyMedium),
                      const SizedBox(height: 4),
                      Text('What are you wearing today?',
                          style: theme.textTheme.headlineMedium
                              ?.copyWith(fontSize: 24)),
                    ],
                  ),
                ),
                Container(
                  padding:
                  const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.surface,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(color: const Color(0xFFE3DFF0)),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.wb_sunny_rounded,
                          size: 18, color: Colors.orange),
                      const SizedBox(width: 6),
                      Text(DummyData.weatherText,
                          style: const TextStyle(fontSize: 12)),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),

            // Quick actions
            GridView.count(
              crossAxisCount: 2,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              mainAxisSpacing: 14,
              crossAxisSpacing: 14,
              childAspectRatio: 1.35,
              children: [
                _ActionCard(
                  icon: Icons.document_scanner_outlined,
                  label: 'Scan Clothes',
                  color: AppColors.primary,
                  onTap: () => context.push('/scanner'),
                ),
                _ActionCard(
                  icon: Icons.checkroom_rounded,
                  label: 'My Wardrobe',
                  color: const Color(0xFF3E8E9E),
                  onTap: () => context.go('/wardrobe'),
                ),
                _ActionCard(
                  icon: Icons.style_outlined,
                  label: "Today's Outfit",
                  color: const Color(0xFFE07A5F),
                  onTap: () => context.push('/outfit'),
                ),
                _ActionCard(
                  icon: Icons.bookmark_border_rounded,
                  label: 'Saved Looks',
                  color: const Color(0xFFD16BA5),
                  onTap: () => context.push('/saved-looks'),
                ),
              ],
            ),
            const SizedBox(height: 28),

            // Today's outfit
            Text("Today's outfit", style: theme.textTheme.titleMedium),
            const SizedBox(height: 12),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.surface,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFE3DFF0)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      for (final item in DummyData.todaysOutfit)
                        ClothingTile(item: item, size: 92),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(Icons.auto_awesome,
                          size: 18, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(DummyData.todaysReason,
                            style: theme.textTheme.bodyMedium),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 28),

            // Recently added
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Recently added', style: theme.textTheme.titleMedium),
                TextButton(
                  onPressed: () => context.go('/wardrobe'),
                  child: const Text('See all'),
                ),
              ],
            ),
            SizedBox(
              height: 150,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: DummyData.wardrobe.length,
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemBuilder: (_, i) =>
                    ClothingTile(item: DummyData.wardrobe[i], size: 110),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ActionCard extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onTap;

  const _ActionCard({
    required this.icon,
    required this.label,
    required this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: color,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        borderRadius: BorderRadius.circular(20),
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Icon(icon, color: Colors.white),
              ),
              Text(label,
                  style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 15)),
            ],
          ),
        ),
      ),
    );
  }
}