import '../../../core/constants/app_constants.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../view/home/model/response_model.dart';

class HomeService {
  static Future<CharacterResponseModel> getCharacters(
    int timeStamp,
    String hashCode,
    int offset,
    int limit,
  ) async {
    CharacterResponseModel characterResponseModel;

    try {
      characterResponseModel = await NetworkManager.instance!.get(
        'characters?ts=$timeStamp&apikey=${AppConstants.publicKey}&hash=$hashCode&offset=$offset&limit=$limit',
        CharacterResponseModel.fromJson,
      );
      return characterResponseModel;
    } catch (e) {
      rethrow;
    }
  }
}
