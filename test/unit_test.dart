// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:marvel_bloc/view/detail/viewmodel/detail_viewmodel.dart';
// import 'package:marvel_bloc/view/home/model/character_model.dart';
// import 'package:marvel_bloc/view/home/viewmodel/home_viewmodel.dart';
// import 'package:mockito/mockito.dart';

// class MockBuildContext extends Mock implements BuildContext {}

// void main() {
  
//   late MockBuildContext mockContext;
//   late HomeViewmodel homeViewmodel;
//   late DetailViewmodel detailViewmodel;

//   setUp(() {
//     homeViewmodel = HomeViewmodel();
//     detailViewmodel = DetailViewmodel();
//     mockContext = MockBuildContext();
//   });

//   test("Character Fetching Test", () async {
//     await homeViewmodel.fetchNextCharacters(mockContext);

//     expect(homeViewmodel.characters.isNotEmpty, true);
//   });

//   test("Comics Fetching Test", () async {
//     await detailViewmodel.fetchComics(CharacterModel(id: 1011334), mockContext);

//     expect(detailViewmodel.comics.isNotEmpty, true);
//   });

//   tearDown(() {});
// }
