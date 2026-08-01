import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController controller = TextEditingController();

  final List<String> allItems = [
    "Knowing Our Numbers",
    "Whole Numbers",
    "Playing with Numbers",
    "Basic Geometrical Ideas",
    "Understanding Elementary Shapes",
    "Integers",
    "Fractions",
    "Decimals",
    "Data Handling",
    "Mensuration",
    "Algebra",
    "Ratio and Proportion",
    "Symmetry",
    "Practical Geometry",
  ];

  List<String> results = [];

  @override
  void initState() {
    super.initState();
    results = allItems;
  }

  void search(String value) {
    setState(() {
      results = allItems
          .where((item) =>
              item.toLowerCase().contains(value.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: TextField(
              controller: controller,
              onChanged: search,
              decoration: InputDecoration(
                hintText: "Search Chapter...",
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: results.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.menu_book),
                  title: Text(results[index]),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}