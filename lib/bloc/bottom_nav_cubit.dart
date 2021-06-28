import 'package:bloc/bloc.dart';

class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0);

  void setTabItemIndex(int tabIndex) {
    emit(tabIndex);
  }

  void setDefaultTabIndex() {
    emit(0);
  }
}
