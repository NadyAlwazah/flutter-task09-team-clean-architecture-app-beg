import 'package:flutter/material.dart';
import '../../../data/models/user_model.dart';

class SideMenuViewBody extends StatelessWidget {
  final UserModel user;

  const SideMenuViewBody({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 20),
          CircleAvatar(
            radius: 45,
            backgroundColor: Colors.white24,
            backgroundImage: user.image.isNotEmpty
                ? NetworkImage(user.image) as ImageProvider
                : const AssetImage('assets/images/programmer_avatar.png'),
          ),
          const SizedBox(height: 16),
          Text(
            user.username, // تم التعديل لتطابق خاصية ملفكِ الحقيقي
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            user.email, // تم التعديل لتطابق خاصية ملفكِ الحقيقي
            style: TextStyle(color: Colors.grey[400], fontSize: 14),
          ),
          const SizedBox(height: 40),
          _buildMenuItem(Icons.person_outline, 'Profile', () {}),
          _buildMenuItem(Icons.shopping_bag_outlined, 'My Cart', () {}),
          _buildMenuItem(Icons.favorite_border, 'Favorite', () {}),
          _buildMenuItem(Icons.local_shipping_outlined, 'Orders', () {}),
          _buildMenuItem(Icons.notifications_none, 'Notifications', () {}),
          _buildMenuItem(Icons.settings_outlined, 'Settings', () {}),
          const SizedBox(height: 24),
          const Divider(color: Colors.white38, thickness: 1),
          const SizedBox(height: 16),
          _buildMenuItem(Icons.logout, 'Sign Out', () {}, hasArrow: false),
        ],
      ),
    );
  }

  Widget _buildMenuItem(
    IconData icon,
    String title,
    VoidCallback onTap, {
    bool hasArrow = true,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: ListTile(
        onTap: onTap,
        contentPadding: EdgeInsets.zero,
        leading: Icon(icon, color: Colors.white, size: 24),
        title: Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        trailing: hasArrow
            ? const Icon(
                Icons.arrow_forward_ios,
                color: Colors.white70,
                size: 16,
              )
            : null,
      ),
    );
  }
}
