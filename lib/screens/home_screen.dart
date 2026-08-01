import 'package:flutter/material.dart';
import 'category_screen.dart';
import 'ai_chat_screen.dart';
import 'profile_screen.dart';
import 'settings_screen.dart';
import 'progress_screen.dart';
import 'bookmark_screen.dart';
import 'search_screen.dart';
import '../widgets/feature_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("AI Study App"),
        centerTitle: true,
        elevation: 0,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),

        child: Column(
          children: [

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(24),

              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.indigo,
                  ],
                ),
                borderRadius: BorderRadius.circular(22),
              ),

              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    "👋 Welcome Raj",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 8),

                  Text(
                    "Learn Anything with AI 🚀",
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 18,
                    ),
                  ),

                ],
              ),
            ),

            const SizedBox(height: 25),

            Expanded(
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,

                children: [

                  FeatureCard(
                    icon: Icons.school,
                    title: "Study",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const CategoryScreen(),
                        ),
                      );
                    },
                  ),

                  FeatureCard(
                    icon: Icons.smart_toy,
                    title: "AI Teacher",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const AIChatScreen(),
                        ),
                      );
                    },
                  ),

                  FeatureCard(
                    icon: Icons.search,
                    title: "Search",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SearchScreen(),
                        ),
                      );
                    },
                  ),

                  FeatureCard(
                    icon: Icons.bookmark,
                    title: "Bookmarks",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const BookmarkScreen(),
                        ),
                      );
                    },
                  ),

                  FeatureCard(
                    icon: Icons.bar_chart,
                    title: "Progress",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProgressScreen(),
                        ),
                      );
                    },
                  ),

                  FeatureCard(
                    icon: Icons.person,
                    title: "Profile",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ProfileScreen(),
                        ),
                      );
                    },
                  ),

                  FeatureCard(
                    icon: Icons.settings,
                    title: "Settings",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const SettingsScreen(),
                        ),
                      );
                    },
                  ),

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}