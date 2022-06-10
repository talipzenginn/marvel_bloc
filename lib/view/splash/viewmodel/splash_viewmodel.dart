import '../../../core/init/navigation/router.gr.dart';
import '../../../main.dart';

class SplashViewmodel {
  void navigateToHomeScreen() {
    Future.delayed(
      const Duration(seconds: 1),
    ).then(
      (value) => router.replace(
        const HomeRoute(),
      ),
    );
  }
}
