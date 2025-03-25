import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:my_first_app/app/app.bottomsheets.dart';
import 'package:my_first_app/app/app.dialogs.dart';
import 'package:my_first_app/app/app.locator.dart';
import 'package:my_first_app/ui/common/app_strings.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class HomeViewModel extends BaseViewModel {
  final _dialogService = locator<DialogService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _scrollController = ScrollController();

  String get counterLabel => 'Counter is: $_counter';

  int _counter = 0;
  bool _isShowButtonGroup = true;

  HomeViewModel() {
    _scrollController.addListener(_hideOnScroll);
  }

  void _hideOnScroll() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isShowButtonGroup) {
        _isShowButtonGroup = false;
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isShowButtonGroup) {
        _isShowButtonGroup = true;
      }
    }
  }

  void incrementCounter() {
    _counter++;
    rebuildUi();
  }

  void showDialog() {
    _dialogService.showCustomDialog(
      variant: DialogType.infoAlert,
      title: 'Stacked Rocks!',
      description: 'Give stacked $_counter stars on Github',
    );
  }

  void showBottomSheet() {
    _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.notice,
      title: ksHomeBottomSheetTitle,
      description: ksHomeBottomSheetDescription,
    );
  }
}
