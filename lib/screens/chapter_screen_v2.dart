import 'package:flutter/material.dart';
import '../data/school/class6/mathematics/mathematics.dart';
import 'chapter_details_screen.dart';

class ChapterScreenV2 extends StatefulWidget {
  const ChapterScreenV2({super.key});

  @override
  State<ChapterScreenV2> createState() => _ChapterScreenV2State();
}

class _ChapterScreenV2State extends State<ChapterScreenV2> {
  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final filteredChapters = class6MathChapters.where((chapter) {
      return chapter.title.toLowerCase().contains(
            searchController.text.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("Class 6 Mathematics"),
        centerTitle: true,
      ),

      body: Column(
        children: [

          // Search Box
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search Chapter...",
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(18),
                  borderSide: BorderSide.none,
                ),
              ),
              onChanged: (_) {
                setState(() {});
              },
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: filteredChapters.length,
              itemBuilder: (context, index) {

                final chapter = filteredChapters[index];

                return Card(
                  margin: const EdgeInsets.symmetric(
                    horizontal: 16,
                    vertical: 8,
                  ),
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.all(14),

                    leading: CircleAvatar(
                      radius: 24,
                      backgroundColor: Colors.blue,
                      child: Text(
                        "${chapter.id}",
                        style: const TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),

                    title: Text(
                      chapter.title,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),

                    subtitle: Padding(
                      padding: const EdgeInsets.only(top: 6),
                      child: Text(
                        chapter.description,
                      ),
                    ),

                    trailing: const Icon(Icons.arrow_forward_ios),

                    onTap: () {

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => ChapterDetailsScreen(
                            chapterTitle: chapter.title,
                          ),
                        ),
                      );

                    },
                  ),
                );
              },
            ),
          ),

        ],
      ),
    );
  }
}