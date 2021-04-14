import 'constants.dart';

class ReadmeUtils {
  static String projectImgUrl(String projectName, String imgSrc) =>
      "${Constants.rawGitHub}/$projectName/master/$imgSrc";
}
