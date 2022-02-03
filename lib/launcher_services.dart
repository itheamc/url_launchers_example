
import 'package:url_launcher/url_launcher.dart';

class LauncherService {
  /// Static function to handle phone calls
  static Future<bool> handleCallLauncher(String tel) async {
    final Uri uri = Uri(
      scheme: "tel",
      path: tel
    );
    if (await _canLaunch(uri.toString())) return await launch(uri.toString());
    return false;
  }


  /// Static function to handle sms handler
  static Future<bool> handleSmsLauncher(String tel) async {
    final Uri uri = Uri(
        scheme: "sms",
        path: tel
    );
    if (await _canLaunch(uri.toString())) return await launch(uri.toString());
    return false;
  }

  /// Static function to handle whatsapp open
  static Future<bool> handleWhatsAppLauncher(String tel) async {
    final String url = "https://api.whatsapp.com/send?phone=$tel";
    if (await _canLaunch(url)) return await launch(url);
    return false;
  }

  /// Static function to handle email
  static Future<bool> handleEmailLauncher(String to, {String? subject, String? message}) async {
    final Uri uri = Uri(
      scheme: 'mailto',
      path: to,
      query: _encodeQueryParameters(<String, String>{
        'subject': subject ?? '',
        'message': message ?? '',
      }),
    );

    if (await _canLaunch(uri.toString())) return await launch(uri.toString());
    return false;
  }

  /// Static private function to encode query parameters
  static String? _encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((e) => '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }


  /// Static private function to check if the url is valid and launcher can be successfully launched
  static Future<bool> _canLaunch(String url) async {
    return await canLaunch(url);
  }
}