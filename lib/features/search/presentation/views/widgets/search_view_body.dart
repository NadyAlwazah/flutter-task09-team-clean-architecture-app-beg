import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> recentSearches = [
      'New T-Shirt',
      'Top T-shirt',
      'Programmer',
      'Shirt',
      'Black Shirt',
      'White Shirt'
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back_ios, size: 20, color: Colors.black),
                onPressed: () => Navigator.pop(context),
              ),
              const Text(
                'Search',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.black),
              ),
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'Cancel',
                  style: TextStyle(fontSize: 16, color: Color(0xFF2ECC71), fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 8.0),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(30),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 8,
                  offset: const Offset(0, 4),
                ),
              ],
            ),
            child: const TextField(
              decoration: InputDecoration(
                hintText: 'Search Your Shirt',
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                prefixIcon: Icon(Icons.search, color: Colors.grey, size: 22),
                suffixIcon: Icon(Icons.mic_none, color: Colors.grey, size: 22),
                border: InputBorder.none,
                contentPadding: EdgeInsets.symmetric(vertical: 14),
              ),
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          child: Text(
            'Shirt',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
          ),
        ),
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            itemCount: recentSearches.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: const Icon(Icons.access_time, color: Colors.grey, size: 22),
                title: Text(
                  recentSearches[index],
                  style: const TextStyle(fontSize: 16, color: Color(0xFF555555), fontWeight: FontWeight.w400),
                ),
                onTap: () {},
              );
            },
          ),
        ),
      ],
    );
  }
}