import 'package:flutter/material.dart';

import 'book_data.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final currentBook = sampleBooks.first;

    return BookPage(
      title: 'Good morning, Alex',
      subtitle: 'A little time for a good story.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(19),
            decoration: BoxDecoration(
              color: bookInk,
              borderRadius: BorderRadius.circular(22),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  children: [
                    Icon(
                      Icons.auto_stories_rounded,
                      size: 17,
                      color: bookPaleGreen,
                    ),
                    SizedBox(width: 8),
                    Text(
                      'CONTINUE READING',
                      style: TextStyle(
                        color: bookPaleGreen,
                        fontSize: 10,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1.3,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 18),
                Row(
                  children: [
                    BookCover(book: currentBook, width: 76, height: 106),
                    const SizedBox(width: 15),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            currentBook.title,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(height: 5),
                          Text(
                            currentBook.author,
                            style: const TextStyle(
                              color: Color(0xFFC3CCC6),
                              fontSize: 12,
                            ),
                          ),
                          const SizedBox(height: 18),
                          const ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(8)),
                            child: LinearProgressIndicator(
                              value: 0.38,
                              minHeight: 5,
                              backgroundColor: Color(0xFF56645D),
                              valueColor: AlwaysStoppedAnimation(bookPaleGreen),
                            ),
                          ),
                          const SizedBox(height: 6),
                          const Text(
                            '38% complete',
                            style: TextStyle(
                              color: Color(0xFFC3CCC6),
                              fontSize: 11,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(height: 28),
          const SectionTitle('Picked for you'),
          for (final book in sampleBooks.skip(1).take(3))
            BookListCard(book: book),
        ],
      ),
    );
  }
}
