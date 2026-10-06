import 'package:flutter/material.dart';

import 'book_data.dart';

class InboxPage extends StatelessWidget {
  const InboxPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Your inbox',
      subtitle: 'Notes and good things from your reading corner.',
      child: Column(
        children: const [
          _InboxMessage(
            icon: Icons.auto_stories_rounded,
            color: bookPaleGreen,
            title: 'Your weekly reading note',
            time: 'Today',
            message:
                'You spent 2 hours with The Midnight Library this week. Keep turning those pages!',
          ),
          SizedBox(height: 12),
          _InboxMessage(
            icon: Icons.recommend_rounded,
            color: Color(0xFFF2E9D8),
            title: 'A story picked for you',
            time: 'Yesterday',
            message:
                'The Alchemist is finding its way onto readers’ shelves again. It might be your kind of journey.',
          ),
          SizedBox(height: 12),
          _InboxMessage(
            icon: Icons.celebration_rounded,
            color: Color(0xFFF2E2E0),
            title: 'A little reading milestone',
            time: 'Monday',
            message:
                'You’ve finished 12 books this year. That’s 12 new worlds explored!',
          ),
        ],
      ),
    );
  }
}

class _InboxMessage extends StatelessWidget {
  const _InboxMessage({
    required this.icon,
    required this.color,
    required this.title,
    required this.time,
    required this.message,
  });

  final IconData icon;
  final Color color;
  final String title;
  final String time;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 42,
            height: 42,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Icon(icon, color: bookGreen, size: 21),
          ),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: const TextStyle(
                          color: bookInk,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Text(
                      time,
                      style: const TextStyle(color: bookMutedInk, fontSize: 10),
                    ),
                  ],
                ),
                const SizedBox(height: 7),
                Text(
                  message,
                  style: const TextStyle(
                    color: bookMutedInk,
                    fontSize: 12,
                    height: 1.45,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
