import 'package:flutter/material.dart';
import '../utils/language_helper.dart';
import '../utils/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _currentLanguage = 'en';

  @override
  void initState() {
    super.initState();
    _loadLanguage();
  }

  Future<void> _loadLanguage() async {
    final language = await LanguageHelper.getCurrentLanguage();
    setState(() {
      _currentLanguage = language;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          _currentLanguage == 'ta' ? 'TNPSC திருத்தல் பயிற்சி' : 'TNPSC Revision App',
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(
            onPressed: _toggleLanguage,
            icon: const Icon(Icons.language),
            tooltip: _currentLanguage == 'ta' ? 'மொழி மாற்று' : 'Switch Language',
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppConstants.defaultPadding),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.school,
              size: 100,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 32),
            Text(
              _currentLanguage == 'ta' 
                ? 'TNPSC தேர்வுகளுக்கு தயாராகுங்கள்'
                : 'Prepare for TNPSC Examinations',
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 16),
            Text(
              _currentLanguage == 'ta'
                ? 'Tamil Nadu பாடநூல்களை அடிப்படையாகக் கொண்ட MCQ கள்'
                : 'MCQs based on Tamil Nadu textbooks',
              style: Theme.of(context).textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 48),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: _navigateToTopicSelection,
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                ),
                child: Text(
                  _currentLanguage == 'ta' ? 'பயிற்சி தொடங்கு' : 'Start Practice',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _navigateToAdmin,
                style: OutlinedButton.styleFrom(
                  padding: const EdgeInsets.all(16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppConstants.defaultRadius),
                  ),
                ),
                child: Text(
                  _currentLanguage == 'ta' ? 'நிர்வாகம்' : 'Admin',
                  style: const TextStyle(fontSize: 18),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _toggleLanguage() async {
    await LanguageHelper.toggleLanguage();
    await _loadLanguage();
  }

  void _navigateToTopicSelection() {
    // TODO: Navigate to topic selection screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _currentLanguage == 'ta' 
            ? 'தலைப்பு தேர்வு திரையை செயல்படுத்த வேண்டும்'
            : 'Topic selection screen to be implemented',
        ),
      ),
    );
  }

  void _navigateToAdmin() {
    // TODO: Navigate to admin screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          _currentLanguage == 'ta' 
            ? 'நிர்வாக திரையை செயல்படுத்த வேண்டும்'
            : 'Admin screen to be implemented',
        ),
      ),
    );
  }
}
