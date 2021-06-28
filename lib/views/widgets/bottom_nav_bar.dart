import 'dart:io';

import 'package:expire_date/bloc/bloc.dart';
import 'package:expire_date/utils/image_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../utils/color_palette.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final unselectedColor = Color(0XFFC0C4C1);
    return SizedBox(
      height: Platform.isAndroid ? 72 : null,
      child: BlocBuilder<BottomNavCubit, int>(
        builder: (context, state) {
          return ClipRRect(
            borderRadius: BorderRadius.vertical(top: Radius.circular(32.0)),
            child: BottomNavigationBar(
              selectedItemColor: ColorPalette.primary,
              unselectedItemColor: unselectedColor,
              currentIndex: state,
              elevation: 8.0,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.white,
              iconSize: 26.0,
              onTap: (index) => BlocProvider.of<BottomNavCubit>(context)
                  .setTabItemIndex(index),
              items: [
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Icon(Icons.home),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  icon: Padding(
                    padding: const EdgeInsets.only(bottom: 4.0),
                    child: Image.asset(
                      ImageUtils.products,
                      height: 26.0,
                      width: 26.0,
                      color:
                          state == 1 ? ColorPalette.primary : unselectedColor,
                    ),
                  ),
                  label: "Products",
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
