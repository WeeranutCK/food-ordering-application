import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class SettingsAppBar extends StatelessWidget {
  const SettingsAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Settings',
        style: TextStyle(
          fontSize: 34,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class Settings extends StatelessWidget {
  const Settings({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    NumberFormat format = NumberFormat("#,##0");

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 150,
              width: MediaQuery.of(context).size.width,
              child: Image.asset(
                'assets/images/food-table.jpg',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Transform.translate(
                offset: const Offset(0, -80),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Column(
                          children: <Widget>[
                            ProfileImage(),
                            SizedBox(height: 5),
                            Text(
                              'Username',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '@user123456',
                              style: TextStyle(
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        const Text(
                          'Total Points:',
                          style: TextStyle(
                            fontSize: 21,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Transform.translate(
                          offset: const Offset(0, -2),
                          child: Text(
                            format.format(3500),
                            style: const TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsetsDirectional.symmetric(vertical: 10),
                      child: Text(
                        'Appearance',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildCardOption(1, Icons.color_lens),
                    _buildCardOption(2, Icons.palette),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Text(
                        'Security',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildCardOption(3, Icons.security),
                    _buildCardOption(4, Icons.lock),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(0, 20, 0, 10),
                      child: Text(
                        'Account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    _buildCardOption(5, Icons.account_circle),
                    _buildCardOption(6, Icons.account_balance),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardOption(int index, IconData icon) {
    return Card(
      elevation: 1,
      child: ListTile(
        leading: Icon(
          icon,
          color: Colors.black,
        ),
        title: Text(
          'Option $index',
          style: const TextStyle(
            fontSize: 21,
          ),
        ),
        onTap: () {
          // Handle onTap event for the card option
        },
      ),
    );
  }
}

class ProfileImage extends StatelessWidget {
  const ProfileImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 6,
        ),
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/images/blank-profile-picture.png',
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
