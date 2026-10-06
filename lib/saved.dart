import 'package:flutter/material.dart';

import 'book_data.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BookPage(
      title: 'Your saved shelf',
      subtitle: 'Stories to come back to whenever you like.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            margin: const EdgeInsets.only(bottom: 20),
            decoration: BoxDecoration(
              color: bookPaleGreen,
              borderRadius: BorderRadius.circular(18),
            ),
            child: const Row(
              children: [
                Icon(Icons.bookmark_rounded, color: bookGreen, size: 24),
                SizedBox(width: 12),
                Expanded(
                  child: Text(
                    'Your reading list is a little promise to your future self.',
                    style: TextStyle(
                      color: bookInk,
                      fontSize: 13,
                      height: 1.4,
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SectionTitle('Saved for later'),
          for (final book in sampleBooks.take(3)) BookListCard(book: book),
        ],
      ),
    );
  }
}
