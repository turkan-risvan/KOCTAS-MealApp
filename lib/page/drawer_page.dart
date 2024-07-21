 
import 'package:flutter/material.dart';

class DrawerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children:[
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(
                    'John Doe',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  SizedBox(height: 4),
                  Text(
                    'john.doe@example.com',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.person),
              title: const Text('Profile'),
              onTap: () {
                // Handle profile page navigation
                Navigator.pop(context); // Close the drawer
                // Navigate to profile page or perform related action
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle settings page navigation
                Navigator.pop(context); // Close the drawer
                // Navigate to settings page or perform related action
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle logout
                Navigator.pop(context); // Close the drawer
                // Perform logout action, clear session, etc.
              },
            ),
          ],
        ),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assets/profile_picture.jpg'),
            ),
            SizedBox(height: 16),
            Text(
              'John Doe',
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 8),
            Text(
              'Software Developer',
              style: TextStyle(fontSize: 18, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
