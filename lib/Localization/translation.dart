import 'package:get/get.dart';

class AppTranslation extends Translations {
  @override
  // TODO: implement keys
  Map<String, Map<String, String>> get keys => {
        "en_US": {
          "This is English Word": "This is English Word",
          "Localization": "Localization",
        },
        "ar_AE": {
          "This is English Word": "هذه كلمة إنجليزية",
          "Localization": "الموقع",
        }
      };
}
