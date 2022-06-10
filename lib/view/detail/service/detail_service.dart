import '../../../core/constants/app_constants.dart';
import '../../../core/init/network/network_manager.dart';
import '../../../view/home/model/response_model.dart';
import '../../home/model/character_model.dart';

class DetailService {
  static Future<ComicResponseModel> getCharacters(
    CharacterModel characterModel,
    int timeStamp,
    String hashCode,
    int limit,
    String orderByParameter,
  ) async {
    ComicResponseModel comicResponseModel;

    try {
      comicResponseModel = await NetworkManager.instance!.get(
        'characters/${characterModel.id}/comics?ts=$timeStamp&apikey=${AppConstants.publicKey}&hash=$hashCode&limit=$limit&orderBy=$orderByParameter',
        ComicResponseModel.fromJson,
      );
      return comicResponseModel;
    } catch (e) {
      rethrow;
    }
  }
}
