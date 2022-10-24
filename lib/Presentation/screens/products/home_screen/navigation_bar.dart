import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_bloc.dart';
import 'package:maged_soft_test/Presentation/controller/product_controller/product_state.dart';
import 'package:maged_soft_test/Presentation/styles/assets.dart';
import 'package:maged_soft_test/Presentation/styles/colors.dart';

class NavigationBarScreen extends StatelessWidget {
  const NavigationBarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProductsBloc, GetProductsState>(
      listener: (context, state) {},
      builder: (ctx, state) {
        final blocState = ProductsBloc.get(ctx);
        return Scaffold(
          /// when th current index is not equal to i at MapEntry
          /// the screen will appear while the other screen will be limited
          /// without lose their navigation information
          /// so when we come back it will rebuild with the same info i leave at it
          body: Stack(
            children: blocState.screens

                /// convert the list to map
                .asMap()
                .map(
                  /// then take every element at the map and
                  /// apply the MapEntry on it
                  /// screen refere to every screen at the list
                  (i, screen) => MapEntry(
                    i,

                    /// Offstage is a widget used to off all the screen that
                    /// the consition is not applyed for it
                    Offstage(
                      offstage: blocState.currentIndex != i,
                      child: screen,
                    ),
                  ),
                )
                .values
                .toList(),
          ),
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: blocState.currentIndex!,
            onTap: (value) {
              blocState.changeIndex(value);
            },
            type: BottomNavigationBarType.fixed,
            items: const [
              BottomNavigationBarItem(
                  icon: Image(
                    image: Svg(AppAssets.nextScreenSvg),
                    width: 20,
                    height: 20,
                  ),
                  label: 'Home'),
              BottomNavigationBarItem(
                  icon: Image(
                    image: Svg(AppAssets.favourite),
                    width: 20,
                    height: 20,
                  ),
                  label: 'Favourite'),
              BottomNavigationBarItem(
                  icon: Image(
                    image: Svg(AppAssets.notification),
                    width: 20,
                    height: 20,
                  ),
                  label: 'Notification'),
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.settings,
                    color: AppColor.iconColor,
                  ),
                  label: 'Settings'),
            ],
          ),
        );
      },
    );
  }
}
