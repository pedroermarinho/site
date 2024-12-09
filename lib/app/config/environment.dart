import 'package:flutter_dotenv/flutter_dotenv.dart';

final rawGitHub = dotenv.get('RAW_GITHUB');
final apiGitHub = dotenv.get('API_GITHUB');
final settingsUrl = dotenv.get('SETTINGS_URL');
final isProduction = dotenv.getBool('IS_PRODUCTION');
