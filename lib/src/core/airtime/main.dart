import '/src/core/airtime/models/access_token.dart';
import 'models/topup_with_operator_model.dart';
import 'repository.dart';
import '../exceptions/error_initializing.dart';

class ReloadlyAirtime {
  final String _clientID;
  final String _clientSecret;
  AirtimeAccessToken? _accessToken;

  ReloadlyAirtime({
    required String clientID,
    required String clientSecret,
  })  : _clientID = clientID,
        _clientSecret = clientSecret;

  final _repository = Repository();

  /// initialize the package and prepare the accessToken
  /// Will throw an [InitializationError] if anything goes wrong
  Future<void> initialize() async {
    _accessToken = await _repository.getAccessToken(
        clientID: _clientID, clientSecret: _clientSecret);

    if (_accessToken == null) {
      throw InitializationError("Access Token not gotten");
    }
  }

  //TODO complete this feature
  Future<void> makeATopupWithOperator(
      {required TopUpWithOperatorModel topupModel}) async {}
}
