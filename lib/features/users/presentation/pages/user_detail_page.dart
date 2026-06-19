import 'package:flutter/material.dart';
import '../../../../core/utils/string_extensions.dart';
import '../../domain/entities/user.dart';

class UserDetailPage extends StatelessWidget {
  final User user;

  const UserDetailPage({
    super.key,
    required this.user,
  });

  @override
  Widget build(BuildContext context) {
    final initials = user.name.getInitials();

    return Scaffold(
      appBar: AppBar(
        title: const Text('User Details'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Header Section (Avatar & Name)
              const SizedBox(height: 16),
              CircleAvatar(
                radius: 50,
                backgroundColor: Theme.of(context).primaryColor.withAlpha(25),
                child: Text(
                  initials,
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              const SizedBox(height: 16),
              Text(
                user.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                '@${user.username}',
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              const SizedBox(height: 24),

              // Contact Info Section
              _buildSectionTitle(context, 'Contact Information'),
              Card(
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    _buildInfoTile(
                      icon: Icons.email_outlined,
                      title: 'Email',
                      subtitle: user.email,
                    ),
                    const Divider(height: 1, indent: 56),
                    _buildInfoTile(
                      icon: Icons.phone_outlined,
                      title: 'Phone',
                      subtitle: user.phone,
                    ),
                    const Divider(height: 1, indent: 56),
                    _buildInfoTile(
                      icon: Icons.language_outlined,
                      title: 'Website',
                      subtitle: user.website,
                    ),
                  ],
                ),
              ),

              // Address Section
              _buildSectionTitle(context, 'Address Details'),
              Card(
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    _buildInfoTile(
                      icon: Icons.home_outlined,
                      title: 'Street & Suite',
                      subtitle: '${user.address.street}, ${user.address.suite}',
                    ),
                    const Divider(height: 1, indent: 56),
                    _buildInfoTile(
                      icon: Icons.location_city_outlined,
                      title: 'City & Zipcode',
                      subtitle: '${user.address.city}, ${user.address.zipcode}',
                    ),
                    const Divider(height: 1, indent: 56),
                    _buildInfoTile(
                      icon: Icons.map_outlined,
                      title: 'Geo Location',
                      subtitle: 'Lat: ${user.address.geo.lat}, Lng: ${user.address.geo.lng}',
                    ),
                  ],
                ),
              ),

              // Company Section
              _buildSectionTitle(context, 'Company Details'),
              Card(
                margin: const EdgeInsets.only(bottom: 24),
                child: Column(
                  children: [
                    _buildInfoTile(
                      icon: Icons.business_outlined,
                      title: 'Name',
                      subtitle: user.company.name,
                    ),
                    const Divider(height: 1, indent: 56),
                    _buildInfoTile(
                      icon: Icons.chat_bubble_outline,
                      title: 'Catchphrase',
                      subtitle: '"${user.company.catchPhrase}"',
                      subtitleStyle: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    const Divider(height: 1, indent: 56),
                    _buildInfoTile(
                      icon: Icons.work_outline,
                      title: 'Business Strategy',
                      subtitle: user.company.bs,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(BuildContext context, String title) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(left: 4.0, bottom: 8.0),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
            letterSpacing: 1.1,
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile({
    required IconData icon,
    required String title,
    required String subtitle,
    TextStyle? subtitleStyle,
  }) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 12,
          color: Colors.grey,
        ),
      ),
      subtitle: Padding(
        padding: const EdgeInsets.only(top: 2.0),
        child: Text(
          subtitle,
          style: subtitleStyle ??
              const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
              ),
        ),
      ),
    );
  }
}
