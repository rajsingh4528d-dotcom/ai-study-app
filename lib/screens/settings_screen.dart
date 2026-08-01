import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  bool notifications = true;
  bool darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,

      appBar: AppBar(
        title: const Text("⚙ Settings"),
        centerTitle: true,
      ),

      body: ListView(
        padding: const EdgeInsets.all(15),

        children: [

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.notifications),
              title: const Text("Notifications"),
              value: notifications,
              onChanged: (value) {
                setState(() {
                  notifications = value;
                });
              },
            ),
          ),

          Card(
            child: SwitchListTile(
              secondary: const Icon(Icons.dark_mode),
              title: const Text("Dark Mode"),
              value: darkMode,
              onChanged: (value) {
                setState(() {
                  darkMode = value;
                });
              },
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.language),
              title: const Text("Language"),
              subtitle: const Text("English"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.info),
              title: const Text("Version"),
              subtitle: const Text("1.0.0"),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.feedback),
              title: const Text("Send Feedback"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(Icons.star),
              title: const Text("Rate App"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () {},
            ),
          ),

          const SizedBox(height: 20),

          const Center(
            child: Text(
              "AI Study App ❤️",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 16,
              ),
            ),
          ),

        ],
      ),
    );
  }
}