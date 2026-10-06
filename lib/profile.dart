import 'package:flutter/material.dart';

import 'book_data.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Your profile',
      subtitle: 'A little snapshot of your reading life.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 42,
                  backgroundColor: Color(0xFFE8D8C8),
                  child: Text(
                    'A',
                    style: TextStyle(
                      color: bookInk,
                      fontSize: 30,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  'Alex Morgan',
                  style: TextStyle(
                    color: bookInk,
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                const SizedBox(height: 4),
                const Text(
                  'A reader since 2024',
                  style: TextStyle(color: bookMutedInk, fontSize: 13),
                ),
              ],
            ),
          ),
          const SizedBox(height: 25),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 8),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                _ProfileStat(value: '12', label: 'Books read'),
                _ProfileStat(value: '36', label: 'Hours read'),
                _ProfileStat(value: '4', label: 'Day streak'),
              ],
            ),
          ),
          const SizedBox(height: 25),
          const SectionTitle('Your reading life'),
          const _ProfileOption(
            icon: Icons.flag_outlined,
            title: 'Reading goal',
            detail: '12 of 20 books this year',
          ),
          const _ProfileOption(
            icon: Icons.tune_rounded,
            title: 'Reading preferences',
            detail: 'Genres, reminders and more',
          ),
          const _ProfileOption(
            icon: Icons.help_outline_rounded,
            title: 'Help & support',
            detail: 'We’re happy to help',
          ),
        ],
      ),
    );
  }
}

class _ProfileStat extends StatelessWidget {
  const _ProfileStat({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: bookInk,
              fontSize: 21,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(color: bookMutedInk, fontSize: 10),
          ),
        ],
      ),
    );
  }
}

class _ProfileOption extends StatelessWidget {
  const _ProfileOption({
    required this.icon,
    required this.title,
    required this.detail,
  });

  final IconData icon;
  final String title;
  final String detail;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: bookGreen),
      title: Text(
        title,
        style: const TextStyle(
          color: bookInk,
          fontSize: 14,
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: Text(
        detail,
        style: const TextStyle(color: bookMutedInk, fontSize: 12),
      ),
      trailing: const Icon(Icons.chevron_right_rounded, color: bookMutedInk),
    );
  }
}
