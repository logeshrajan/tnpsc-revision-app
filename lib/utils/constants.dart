class AppConstants {
  // Azure Configuration
  static const String azureFoundryEndpoint = 'YOUR_FOUNDRY_ENDPOINT';
  static const String azureFoundryApiKey = 'YOUR_API_KEY';
  static const String azureFoundryDeploymentName = 'YOUR_DEPLOYMENT_NAME';
  
  static const String azureBlobStorageAccount = 'YOUR_STORAGE_ACCOUNT';
  static const String azureBlobContainerName = 'textbooks';
  static const String azureBlobSasToken = 'YOUR_SAS_TOKEN';
  
  static const String azureSearchEndpoint = 'YOUR_SEARCH_ENDPOINT';
  static const String azureSearchApiKey = 'YOUR_SEARCH_API_KEY';
  static const String azureSearchIndexName = 'textbook-index';
  
  // App Configuration
  static const String appName = 'TNPSC Revision App';
  static const String appVersion = '1.0.0';
  
  // UI Constants
  static const double defaultPadding = 16.0;
  static const double defaultRadius = 8.0;
  static const int defaultMCQCount = 10;
  static const int mcqTimeoutSeconds = 30;
  
  // Cache Configuration
  static const Duration mcqCacheDuration = Duration(hours: 24);
  static const Duration topicCacheDuration = Duration(hours: 12);
  
  // Supported Languages
  static const List<String> supportedLanguages = ['en', 'ta'];
  static const String defaultLanguage = 'en';
  
  // TNPSC Exam Categories
  static const List<String> examCategories = [
    'Group 1',
    'Group 2',
    'Group 3',
    'Group 4',
  ];
  
  // Subject Categories
  static const List<String> subjects = [
    'History',
    'Geography',
    'Economics',
    'Science',
    'Tamil Literature',
    'General Knowledge',
  ];
  
  // Difficulty Levels
  static const List<String> difficultyLevels = [
    'easy',
    'medium',
    'hard',
  ];
}
