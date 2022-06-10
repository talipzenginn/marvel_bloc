import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../../../core/base/model/dio_exceptions.dart';
import '../../../core/components/dialog/error_dialog.dart';
import '../../../core/constants/app_constants.dart';
import '../../../core/constants/secret_constants.dart';
import '../../../core/extension/hashing_extension.dart';
import '../../../view/home/model/character_model.dart';
import '../../../view/detail/service/detail_service.dart';
import '../../home/model/comic_model.dart';
import '../../home/model/response_model.dart';

class DetailViewmodel {
  final _comicsMaps = [];

  bool _isFetchingComics = false;

  int limit = 10;

  String orderByParameter = '-onsaleDate';
  List<ComicModel?> _comics = [];
  List<ComicModel?> get comics => _comics;

  Future fetchComics(
    CharacterModel characterModel,
    BuildContext context,
  ) async {
    if (_isFetchingComics) return;
    _isFetchingComics = true;

    int timeStamp = DateTime.now().millisecondsSinceEpoch;

    String input = timeStamp.toString() +
        SecretConstants.privateKey +
        AppConstants.publicKey;

    String hashCode = HashingExtension.generateMd5(input);

    ComicResponseModel comicResponse;
    try {
      comicResponse = await DetailService.getCharacters(
          characterModel, timeStamp, hashCode, limit, orderByParameter);

      _comicsMaps.clear();

      comicResponse.comicsMapsList!
          .map((e) =>
              DateTime.parse(e['dates'][0]['date']).isAfter(DateTime(2005))
                  ? _comicsMaps.add(e)
                  : null)
          .toList();

      _comics = _comicsMaps.map(
        (comicsMap) {
          DateTime dateTime = DateTime.parse(comicsMap['dates'][0]['date']);
          return ComicModel(
            title: comicsMap['title'] ?? 'No title',
            onsaleDate: dateTime,
          );
        },
      ).toList();
    } on DioError catch (e) {
      ErrorExtension(
        ErrorDialog(
          errorMessage: DioExceptions.fromDioError(e).message!,
        ),
      ).show(context);
    } catch (e) {
      rethrow;
    }
    _isFetchingComics = false;
    return _comics;
  }
}
