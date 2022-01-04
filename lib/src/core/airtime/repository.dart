import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import 'api_urls.dart';
import 'models/access_token.dart';

class Repository {
  late AirtimeAccessToken _accessToken;

  /// returns the access token model for the sesssion
  Future<AirtimeAccessToken?> getAccessToken({
    required String clientID,
    required String clientSecret,
  }) async {
    Uri url = Uri.parse(AirtimeApiUrls.authToken);
    final header = _getHeader();
    final body = jsonEncode({
      "client_id": clientID,
      "client_secret": clientSecret,
      "grant_type": "client_credentials",
      "audience": AirtimeApiUrls.audienceUrl,
    });

    log(body.toString());
    http.Response response = await http.post(url, headers: header, body: body);

    if (response.statusCode == 200) {
      log("success");
      AirtimeAccessToken accessToken =
          AirtimeAccessToken.fromMap(jsonDecode(response.body));

      log(accessToken.toString());
      _accessToken = accessToken;

      return accessToken;
    } else {
      log(response.body.toString());
      return null;
    }
  }

  Map<String, String> _getHeader() {
    Map<String, String> header = {
      'Content-Type': 'application/json',
    };

    return header;
  }
}
