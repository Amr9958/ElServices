const kApiKey = "AIzaSyDCB0JbWFIAuDOiqzK_fkjgzryNR1xkthA";
const kGeminiV = 'gemini-1.5-flash';
bool IsOnboardingFinished = false;
String? language;
String? brightness;
late bool Islogin;
int currentThemeType = 0;
int navigationIndexfromRouting = 0;
late String appName_;
late String packageName_;
late String version_;
late String buildNumber_;
late List<AppVersionModel> version;

bool compareVersions(String version1, String version2) {
  // بترجع true لو اول رقم كبير
  List<int> v1Parts = version1.split('.').map(int.parse).toList();
  List<int> v2Parts = version2.split('.').map(int.parse).toList();

  int length =
      v1Parts.length > v2Parts.length ? v1Parts.length : v2Parts.length;

  for (int i = 0; i < length; i++) {
    int v1 = i < v1Parts.length ? v1Parts[i] : 0;
    int v2 = i < v2Parts.length ? v2Parts[i] : 0;

    if (v1 > v2) {
      return true;
    } else if (v1 < v2) {
      return false;
    }
  }

  return false;
}

class AppVersionModel {
  final String versionName;
  final String versionCode;
  final String minVersion;
  final bool showIgnore;
  final bool showLater;

  AppVersionModel({
    required this.versionName,
    required this.versionCode,
    required this.minVersion,
    required this.showIgnore,
    required this.showLater,
  });

  factory AppVersionModel.fromJson(Map<String, dynamic> json) {
    return AppVersionModel(
      versionName: json['versionName'],
      versionCode: json['versionCode'],
      minVersion: json['minVersion'],
      showIgnore: json['showIgnore'],
      showLater: json['showLater'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'versionName': versionName,
      'versionCode': versionCode,
      'minVersion': minVersion,
      'showIgnore': showIgnore,
      'showLater': showLater,
    };
  }
}
