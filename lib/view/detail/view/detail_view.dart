import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../core/components/custom_future_builder.dart';
import '../../../core/components/shimmers.dart';
import '../../../core/extension/context_extensions.dart';
import '../../../core/constants/app_constants.dart';
import '../../../view/home/model/character_model.dart';
import '../viewmodel/detail_viewmodel.dart';

class DetailView extends StatelessWidget {
  const DetailView({
    Key? key,
    required this.characterModel,
    required this.detailViewmodel,
  }) : super(key: key);
  final CharacterModel characterModel;
  final DetailViewmodel detailViewmodel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SafeArea(
        child: Padding(
          padding: context.paddingLowVertical,
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  photoOfCharacter(context),
                  nameOfCharacter(context),
                  detailOfCharacter(context),
                  comicsOfTheCharacter(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  SizedBox photoOfCharacter(BuildContext context) {
    return SizedBox(
      height: context.highValue * 3,
      child: CachedNetworkImage(
        imageUrl: characterModel.photoURL!,
        placeholder: (context, url) => const ImageShimmer(),
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }

  Text nameOfCharacter(BuildContext context) {
    return Text(
      characterModel.name ?? AppConstants.noConnectionText,
      style: context.textTheme.headline5,
    );
  }

  Widget detailOfCharacter(BuildContext context) {
    return Padding(
      padding: context.paddingNormal,
      child: Text(
        characterModel.description!.isNotEmpty
            ? characterModel.description!
            : AppConstants.noDetail,
        style: context.textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
    );
  }

  Widget comicsOfTheCharacter(BuildContext context) {
    return CustomFutureBuilder(
      future: detailViewmodel.fetchComics(characterModel, context),
      onSuccess: (response) {
        dynamic comics = response;
        return comics.isNotEmpty
            ? Column(
                children: [
                  ...comics
                      .map(
                        (e) => Padding(
                          padding: context.paddingNormal,
                          child: Text(
                            '${e?.title} ----- ${e?.onsaleDate.day}.${e?.onsaleDate.month}.${e?.onsaleDate.year}',
                            style: context.textTheme.bodyMedium,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                      .toList(),
                ],
              )
            : const Text(AppConstants.noComics);
      },
    );
  }

  AppBar appBar() {
    return AppBar(
      centerTitle: false,
      title: const Text(AppConstants.appBarTitle),
    );
  }
}
