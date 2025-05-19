import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/navigation/routes.dart';
import 'package:social_media/pages/auth/utils/utils.dart';
import 'package:social_media/provider/provider.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    // логика получения постов конкретного пользователя при клике на "Profile"
    final listenToUserPosts =
        context.read<PostsProvider>().listenToUserPostsChanges;
    final uid = context.read<AuthProvider>().user?.uid;

    return Drawer(
      child: Padding(
        // отступы
        padding: const EdgeInsets.fromLTRB(8, 8, 8, 30),

        // контент
        child: Column(
          children: [
            // лого
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50, vertical: 50),
              child: Icon(
                Icons.person,
                size: 100,
              ),
            ),

            // дом
            _DrawerTile(
              const Icon(Icons.home),
              'Home',
              () => Navigator.pop(context),
            ),

            // профиль
            _DrawerTile(
              const Icon(Icons.person),
              'Profile',
              () {
                if (uid != null) listenToUserPosts(uid);
                goToProfilePage(context);
              },
            ),

            // пространство между элементами
            const Spacer(),

            // выход
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
        style: const TextStyle(
          letterSpacing: 4,
          fontSize: 14,
        ),
      ),
      onTap: onTap,
    );
  }
}
