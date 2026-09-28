import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../../core/app_theme.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            const SizedBox(height: 12),
            const Center(
              child: CircleAvatar(
                radius: 44,
                backgroundColor: AppColors.primary,
                child: Icon(Icons.person, size: 44, color: Colors.white),
              ),
            ),
            const SizedBox(height: 14),
            Center(child: Text('Demo User', style: theme.textTheme.headlineMedium?.copyWith(fontSize: 22))),
            Center(child: Text('demo@email.com', style: theme.textTheme.bodyMedium)),
            const SizedBox(height: 28),
            _tile(Icons.bookmark_border_rounded, 'Saved Looks',
                    () => context.push('/saved-looks')),
            _tile(Icons.palette_outlined, 'Style preferences', () {}),
            _tile(Icons.notifications_none_rounded, 'Notifications', () {}),
            _tile(Icons.help_outline_rounded, 'Help & support', () {}),
            const SizedBox(height: 12),
            _tile(Icons.logout_rounded, 'Log out', () {
              context.go('/login');
            }, color: AppColors.error),
          ],
        ),
      ),
    );
  }

  Widget _tile(IconData icon, String label, VoidCallback onTap,
      {Color color = AppColors.textDark}) {
    return Card(
      elevation: 0,
      color: AppColors.surface,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
        side: const BorderSide(color: Color(0xFFE3DFF0)),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(label, style: TextStyle(color: color)),
        trailing: const Icon(Icons.chevron_right_rounded),
        onTap: onTap,
      ),
    );
  }
}