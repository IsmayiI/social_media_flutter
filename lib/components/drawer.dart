import 'package:flutter/material.dart';
import 'package:social_media/pages/auth/utils/utils.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Padding(
        // отступы
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 30),

        // контент
        child: Column(
          children: [
            // logo
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),

            // Дом
            _DrawerTile(
              const Icon(Icons.home),
              'Home',
              () => Navigator.pop(context),
            ),

            // Профиль
            _DrawerTile(
              const Icon(Icons.person),
              'Profile',
              () => Navigator.pop(context),
            ),

            // пространство между элементами
            const Spacer(),

            // Выход
            _DrawerTile(
              const Icon(Icons.logout),
              'Logout',
              () => signOut(context),
            ),
          ],
        ),
      ),
    );
  }
}

// элемент меню
class _DrawerTile extends StatelessWidget {
  final Icon icon;
  final String title;
  final VoidCallback onTap;
  const _DrawerTile(
    this.icon,
    this.title,
    this.onTap,
  );

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: icon,
      title: Text(
        title.toUpperCase(),
        style: TextStyle(
          letterSpacing: 4,
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }
}
