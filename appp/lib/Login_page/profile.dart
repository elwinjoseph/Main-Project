import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Profile',
          style: TextStyle(
              color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: Colors.white,
          onPressed: () {
            ();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            color: Colors.black,
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Profile Header Section
          Container(
            color: Colors.black12,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(19.0),
              child: Column(
                children: [
                  Image.asset(
                    'assets/image/profile.png', height: 145, width: 145,

                    fit:
                        BoxFit.cover, // Ensure the image fits within the circle
                  ),
                  const Text(
                    'Elwin Joseph',
                    style: TextStyle(
                      fontSize: 22,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('elwinjoseph.com',
                      style: TextStyle(color: Colors.black)),
                ],
              ),
            ),
          ),
          // Contact Information Section
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: const [
                Card(
                  color: Colors.white,
                  child: ContactItem(
                    icon: Icons.person,
                    text: 'User Details',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  child: ContactItem(
                    icon: Icons.card_giftcard,
                    text: 'My Rewards',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  child: ContactItem(
                    icon: Icons.favorite_border,
                    text: 'Favorites',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  child: ContactItem(
                    icon: Icons.help_outline_outlined,
                    text: 'FAQ & Help',
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.white,
                  child: ContactItem(
                    icon: Icons.logout_outlined,
                    text: 'Logout',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ContactItem extends StatelessWidget {
  final IconData icon;
  final String text;

  const ContactItem({super.key, required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Icon(icon, color: Colors.grey),
          const SizedBox(width: 10),
          Text(
            text,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}
