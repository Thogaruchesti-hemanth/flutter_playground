import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool value = false;
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_typing_uninitialized_variables
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 36),
          child: Column(
            children: [
              SizedBox(height: 20),
              CircleAvatar(
                radius: 40,
                backgroundImage: AssetImage('assets/images/profile.png'),
                backgroundColor: Colors.greenAccent,
              ),
              const SizedBox(height: 10),
              Text(
                "CoffeeStories",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const Text(
                'mark.brock@icloud.com',
                style: TextStyle(color: Colors.grey),
              ),
              const SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Edit Profile",
                  style: TextStyle(color: Colors.white),
                ),
              ),

              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Inventories",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: _buildContainer(Icons.store),
                      title: Row(
                        children: [
                          const Text(
                            "My Stores  ",
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Container(
                            padding: EdgeInsets.all(6),
                            decoration: BoxDecoration(
                              color: Colors.green,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              "2",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 16,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: _buildContainer(Icons.help_outline),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text("Support"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Preferences",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.all(8),

                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black26, width: 1),
                ),
                child: Column(
                  children: [
                    ListTile(
                      leading: _buildContainer(Icons.notifications),
                      title: Text("Push notifications"),
                      trailing: Switch(
                        value: value,
                        onChanged: (bool newValue) {
                          setState(() {
                            value = newValue;
                          });
                        },
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 16,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: _buildContainer(Icons.face),
                      title: Text("Face ID"),
                      trailing: Switch(
                        value: value,
                        onChanged: (bool newValue) {
                          value = newValue;
                        },
                      ),
                      onTap: () {},
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 16,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: _buildContainer(Icons.lock),
                      tileColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      title: Text("PIN Code"),
                      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                    ),
                    Divider(
                      thickness: 1,
                      color: Colors.grey,
                      indent: 16,
                      endIndent: 16,
                    ),
                    ListTile(
                      leading: _buildContainer(Icons.logout, Colors.red),

                      title: Text(
                        "Logout",
                        style: TextStyle(color: Colors.red),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.transparent,
        currentIndex: 2,
        elevation: 0,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.notifications), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: ''),
        ],
      ),
    );
  }

  Widget _buildContainer(IconData icon, [color]) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Icon(icon, color: color ?? Colors.black),
    );
  }
}
