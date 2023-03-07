part of 'splash_screen.dart';

extension SplashExtension on SplashScreen {
  Widget splashBody(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            'Food merchant'.toUpperCase(),
            style: const TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),
        ),
        const Text(
          'Food truck application by merchant',
          style: TextStyle(
            fontSize: 14.0,
            color: Colors.black,
          ),
        )
            .animate(onComplete: (control) {
          controller.onAnimationEnd();
        })
            .fadeIn(duration: 3000.ms, delay: 600.ms)
            .move(
          begin: const Offset(-32, 0),
          curve: Curves.easeOutQuad,
        ),
      ],
    );
  }
}
