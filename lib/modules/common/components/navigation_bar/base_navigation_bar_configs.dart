// ignore_for_file: public_member_api_docs, sort_constructors_first

part of './base_navigation_bar.dart';

class VDNavigationBarConfigs {
  final Widget avtLeading;
  final double leadingWidth = 64;
  final Color backgroundColor = Colors.transparent;
  final Widget title = Assets.mocks.images.logo.image(
    width: 72,
    height: 21,
  );

  VDNavigationBarConfigs.avtAndLogo({
    String? avatarUrl,
    List<Color>? avatarBackgroundGradientColors,
  }) : avtLeading = Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Container(
              height: 32,
              width: 32,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                  colors: avatarBackgroundGradientColors ??
                      [
                        const Color(0XFFEDFC74),
                        const Color(0XFFF5FFA8),
                      ],
                ),
              ),
              child: avatarUrl != null
                  ? Image.network(avatarUrl)
                  : Assets.mocks.images.avatar.image(
                      height: 32,
                      width: 32,
                      fit: BoxFit.contain,
                    )),
        );
}
