import 'package:flutter/material.dart';

const bookInk = Color(0xFF24352F);
const bookMutedInk = Color(0xFF78827B);
const bookGreen = Color(0xFF356B57);
const bookPaleGreen = Color(0xFFE5EDE5);

class Book {
  const Book({
    required this.title,
    required this.author,
    required this.category,
    required this.coverColor,
    required this.initial,
    this.rating = '4.8',
  });

  final String title;
  final String author;
  final String category;
  final Color coverColor;
  final String initial;
  final String rating;
}

const sampleBooks = [
  Book(
    title: 'The Midnight Library',
    author: 'Matt Haig',
    category: 'Fiction',
    coverColor: Color(0xFF344C52),
    initial: 'M',
    rating: '4.9',
  ),
  Book(
    title: 'Atomic Habits',
    author: 'James Clear',
    category: 'Personal Growth',
    coverColor: Color(0xFFC79650),
    initial: 'A',
    rating: '4.8',
  ),
  Book(
    title: 'The Alchemist',
    author: 'Paulo Coelho',
    category: 'Fiction',
    coverColor: Color(0xFF55745B),
    initial: 'A',
    rating: '4.7',
  ),
  Book(
    title: 'Educated',
    author: 'Tara Westover',
    category: 'Memoir',
    coverColor: Color(0xFF9D6554),
    initial: 'E',
    rating: '4.8',
  ),
  Book(
    title: 'Before the Coffee Gets Cold',
    author: 'Toshikazu Kawaguchi',
    category: 'Fiction',
    coverColor: Color(0xFF7C647E),
    initial: 'C',
    rating: '4.6',
  ),
];

class BookCover extends StatelessWidget {
  const BookCover({
    required this.book,
    this.width = 62,
    this.height = 84,
    super.key,
  });

  final Book book;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: book.coverColor,
        borderRadius: BorderRadius.circular(8),
        boxShadow: const [
          BoxShadow(
            color: Color(0x18000000),
            blurRadius: 7,
            offset: Offset(2, 3),
          ),
        ],
      ),
      child: Stack(
        children: [
          Positioned(
            left: 7,
            top: 8,
            bottom: 8,
            child: Container(width: 1, color: Colors.white24),
          ),
          Center(
            child: Text(
              book.initial,
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.9),
                fontSize: height * 0.42,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class BookListCard extends StatelessWidget {
  const BookListCard({required this.book, super.key});

  final Book book;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          BookCover(book: book),
          const SizedBox(width: 13),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  book.category.toUpperCase(),
                  style: const TextStyle(
                    color: bookGreen,
                    fontSize: 9,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  book.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    color: bookInk,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  book.author,
                  style: const TextStyle(color: bookMutedInk, fontSize: 12),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Column(
            children: [
              const Icon(Icons.star_rounded, color: Color(0xFFD19A42), size: 17),
              Text(
                book.rating,
                style: const TextStyle(color: bookMutedInk, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class BookPage extends StatelessWidget {
  const BookPage({
    required this.title,
    required this.subtitle,
    required this.child,
    super.key,
  });

  final String title;
  final String subtitle;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(22, 18, 22, 28),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                color: bookInk,
                fontSize: 28,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.5,
              ),
            ),
            const SizedBox(height: 6),
            Text(
              subtitle,
              style: const TextStyle(color: bookMutedInk, fontSize: 14),
            ),
            const SizedBox(height: 24),
            child,
          ],
        ),
      ),
    );
  }
}

class SectionTitle extends StatelessWidget {
  const SectionTitle(this.title, {super.key});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Text(
        title,
        style: const TextStyle(
          color: bookInk,
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}
