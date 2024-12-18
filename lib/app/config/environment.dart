import 'package:flutter_dotenv/flutter_dotenv.dart';

final isProduction = dotenv.getBool('IS_PRODUCTION');
final gitHubUsername = dotenv.get('GITHUB_USERNAME');
