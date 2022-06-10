part of 'home_cubit.dart';

@immutable
abstract class HomeState {
  const HomeState();
}

class HomeInitial extends HomeState {
  const HomeInitial();
}

class HomeCompleted extends HomeState {
  const HomeCompleted(this.characters);

  final List<CharacterModel> characters;
    @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HomeCompleted && listEquals(other.characters, characters);
  }

  @override
  int get hashCode => characters.hashCode;
}

class HomeError extends HomeState {
  const HomeError(this.message);
  final String message;
}
