import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _notificationsEnabled = true;
  bool _autoplayEnabled = true;
  String _selectedLanguage = 'English';
  String _videoQuality = 'Auto';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile & Settings'),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Header
            _buildProfileHeader(),

            const SizedBox(height: 24),

            // Account Section
            _buildSectionHeader('Account'),
            _buildAccountSettings(),

            const SizedBox(height: 24),

            // Playback Section
            _buildSectionHeader('Playback'),
            _buildPlaybackSettings(),

            const SizedBox(height: 24),

            // App Section
            _buildSectionHeader('App'),
            _buildAppSettings(),

            const SizedBox(height: 24),

            // Support Section
            _buildSectionHeader('Support & Legal'),
            _buildSupportSettings(),

            const SizedBox(height: 32),

            // Sign Out Button
            _buildSignOutButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileHeader() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          // Profile Avatar
          Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: const Color(0xFFE50914),
              borderRadius: BorderRadius.circular(30),
            ),
            child: const Icon(
              Icons.person,
              color: Colors.white,
              size: 30,
            ),
          ),

          const SizedBox(width: 16),

          // Profile Info
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'StreamFlix User',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'Premium Member',
                  style: TextStyle(
                    color: Colors.grey[400],
                    fontSize: 14,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'streamflix@example.com',
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),

          // Edit Button
          TextButton(
            onPressed: () {
              // Navigate to edit profile
            },
            style: TextButton.styleFrom(
              foregroundColor: const Color(0xFFE50914),
            ),
            child: const Text('Edit'),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget _buildAccountSettings() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildSettingTile(
            'Change Password',
            'Update your account password',
            Icons.lock_outline,
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingTile(
            'Email Preferences',
            'Manage notification emails',
            Icons.email_outlined,
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingTile(
            'Privacy Settings',
            'Control your privacy options',
            Icons.privacy_tip_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildPlaybackSettings() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildSettingTile(
            'Autoplay',
            'Automatically play next episode',
            Icons.play_arrow_outlined,
            trailing: Switch(
              value: _autoplayEnabled,
              onChanged: (value) {
                setState(() {
                  _autoplayEnabled = value;
                });
              },
              activeColor: const Color(0xFFE50914),
            ),
          ),
          _buildDivider(),
          _buildSettingTile(
            'Video Quality',
            _videoQuality,
            Icons.high_quality_outlined,
            onTap: () {
              _showQualityDialog();
            },
          ),
          _buildDivider(),
          _buildSettingTile(
            'Download Quality',
            'Quality for downloaded content',
            Icons.download_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildAppSettings() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildSettingTile(
            'Notifications',
            'Push notifications and alerts',
            Icons.notifications_outlined,
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (value) {
                setState(() {
                  _notificationsEnabled = value;
                });
              },
              activeColor: const Color(0xFFE50914),
            ),
          ),
          _buildDivider(),
          _buildSettingTile(
            'Language',
            _selectedLanguage,
            Icons.language_outlined,
            onTap: () {
              _showLanguageDialog();
            },
          ),
          _buildDivider(),
          _buildSettingTile(
            'Theme',
            'Dark theme (current)',
            Icons.dark_mode_outlined,
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingTile(
            'Storage',
            'Manage downloaded content',
            Icons.storage_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _buildSupportSettings() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey[900],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          _buildSettingTile(
            'Help Center',
            'Get help and support',
            Icons.help_outline,
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingTile(
            'Terms of Service',
            'Read our terms and conditions',
            Icons.description_outlined,
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingTile(
            'Privacy Policy',
            'Learn about our privacy practices',
            Icons.policy_outlined,
            onTap: () {},
          ),
          _buildDivider(),
          _buildSettingTile(
            'About',
            'App version and information',
            Icons.info_outline,
            onTap: () {
              _showAboutDialog();
            },
          ),
        ],
      ),
    );
  }

  Widget _buildSettingTile(String title, String subtitle, IconData icon, {Widget? trailing, VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white, fontSize: 16),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(color: Colors.grey[400], fontSize: 12),
      ),
      trailing: trailing ?? const Icon(Icons.arrow_forward_ios, color: Colors.grey, size: 16),
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
    );
  }

  Widget _buildDivider() {
    return Divider(
      color: Colors.grey[800],
      height: 1,
      indent: 16,
      endIndent: 16,
    );
  }

  Widget _buildSignOutButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          _showSignOutDialog();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color(0xFFE50914),
          side: const BorderSide(color: Color(0xFFE50914)),
          padding: const EdgeInsets.symmetric(vertical: 16),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: const Text(
          'Sign Out',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  void _showQualityDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text('Video Quality', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildQualityOption('Auto', 'Automatically adjust quality'),
              _buildQualityOption('High', 'Best quality available'),
              _buildQualityOption('Medium', 'Balanced quality and data'),
              _buildQualityOption('Low', 'Save data usage'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildQualityOption(String quality, String description) {
    return ListTile(
      title: Text(quality, style: const TextStyle(color: Colors.white)),
      subtitle: Text(description, style: TextStyle(color: Colors.grey[400])),
      leading: Radio<String>(
        value: quality,
        groupValue: _videoQuality,
        onChanged: (value) {
          setState(() {
            _videoQuality = value!;
          });
          Navigator.of(context).pop();
        },
        activeColor: const Color(0xFFE50914),
      ),
      onTap: () {
        setState(() {
          _videoQuality = quality;
        });
        Navigator.of(context).pop();
      },
    );
  }

  void _showLanguageDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text('Language', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _buildLanguageOption('English'),
              _buildLanguageOption('Spanish'),
              _buildLanguageOption('French'),
              _buildLanguageOption('German'),
            ],
          ),
        );
      },
    );
  }

  Widget _buildLanguageOption(String language) {
    return ListTile(
      title: Text(language, style: const TextStyle(color: Colors.white)),
      leading: Radio<String>(
        value: language,
        groupValue: _selectedLanguage,
        onChanged: (value) {
          setState(() {
            _selectedLanguage = value!;
          });
          Navigator.of(context).pop();
        },
        activeColor: const Color(0xFFE50914),
      ),
      onTap: () {
        setState(() {
          _selectedLanguage = language;
        });
        Navigator.of(context).pop();
      },
    );
  }

  void _showSignOutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: const Text('Sign Out', style: TextStyle(color: Colors.white)),
          content: const Text(
            'Are you sure you want to sign out of your account?',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text('Cancel', style: TextStyle(color: Colors.grey[400])),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                // Perform sign out
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Signed out successfully'),
                    backgroundColor: Color(0xFFE50914),
                  ),
                );
              },
              child: const Text('Sign Out', style: TextStyle(color: Color(0xFFE50914))),
            ),
          ],
        );
      },
    );
  }

  void _showAboutDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.grey[900],
          title: Row(
            children: [
              Container(
                width: 32,
                height: 32,
                decoration: const BoxDecoration(
                  color: Color(0xFFE50914),
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.play_arrow,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              const SizedBox(width: 12),
              const Text('About StreamFlix', style: TextStyle(color: Colors.white)),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'StreamFlix - Netflix Clone',
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                'Version 1.0.0',
                style: TextStyle(color: Colors.grey[400]),
              ),
              const SizedBox(height: 8),
              Text(
                'A Flutter application demonstrating Netflix-style UI with TMDB API integration.',
                style: TextStyle(color: Colors.grey[400]),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('OK', style: TextStyle(color: Color(0xFFE50914))),
            ),
          ],
        );
      },
    );
  }
}
