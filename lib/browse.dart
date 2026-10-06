  import 'package:flutter/material.dart';

import 'book_data.dart';

class BrowsePage extends StatefulWidget {
  const BrowsePage({super.key});

  @override
  State<BrowsePage> createState() => _BrowsePageState();
}

class _BrowsePageState extends State<BrowsePage> {
  final _searchController = TextEditingController();
  String _selectedCategory = 'All';

  static const _categories = ['All', 'Fiction', 'Memoir', 'Personal Growth'];

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final query = _searchController.text.trim().toLowerCase();
    final books = sampleBooks.where((book) {
      final matchesCategory =
          _selectedCategory == 'All' || book.category == _selectedCategory;
      final matchesQuery =
          book.title.toLowerCase().contains(query) ||
          book.author.toLowerCase().contains(query);
      return matchesCategory && matchesQuery;
    });

    return BookPage(
      title: 'Find your next read',
      subtitle: 'A shelf full of places to go.',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextField(
            controller: _searchController,
            onChanged: (_) => setState(() {}),
            decoration: InputDecoration(
              hintText: 'Search books or authors',
              hintStyle: const TextStyle(color: bookMutedInk, fontSize: 14),
              prefixIcon: const Icon(Icons.search_rounded, color: bookMutedInk),
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16),
                borderSide: BorderSide.none,
              ),
              contentPadding: const EdgeInsets.symmetric(vertical: 15),
            ),
          ),
          const SizedBox(height: 18),
          SizedBox(
            height: 39,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemCount: _categories.length,
              separatorBuilder: (_, index) => const SizedBox(width: 8),
              itemBuilder: (context, index) {
                final category = _categories[index];
                final selected = category == _selectedCategory;
                return ChoiceChip(
                  label: Text(category),
                  selected: selected,
                  onSelected: (_) => setState(() => _selectedCategory = category),
                  selectedColor: bookPaleGreen,
                  backgroundColor: Colors.white,
                  side: BorderSide.none,
                  labelStyle: TextStyle(
                    color: selected ? bookGreen : bookMutedInk,
                    fontSize: 12,
                    fontWeight: selected ? FontWeight.w600 : FontWeight.w400,
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: 23),
          SectionTitle('${books.length} books to explore'),
          if (books.isEmpty)
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 28),
              child: Center(
                child: Text(
                  'No books found. Try another search.',
                  style: TextStyle(color: bookMutedInk),
                ),
              ),
            )
          else
            for (final book in books) BookListCard(book: book),
        ],
      ),
    );
  }
}
