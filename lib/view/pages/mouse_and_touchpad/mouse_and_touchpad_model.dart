import 'package:flutter/foundation.dart';
import 'package:settings/schemas/schemas.dart';
import 'package:settings/services/settings_service.dart';

class MouseAndTouchpadModel extends ChangeNotifier {
  static const _leftHanded = 'left-handed';
  static const _mouseSpeedKey = 'speed';
  static const _mouseNaturalScrollKey = 'natural-scroll';
  static const _touchpadSpeedKey = 'speed';
  static const _touchpadNaturalScrollKey = 'natural-scroll';
  static const _touchpadTapToClickKey = 'tap-to-click';
  static const _touchpadDisableWhileTyping = 'disable-while-typing';
  static const _touchpadTwoFingerScrolling = 'two-finger-scrolling-enabled';
  static const _touchpadEdgeScrolling = 'edge-scrolling-enabled';

  MouseAndTouchpadModel(SettingsService service)
      : _peripheralsMouseSettings = service.lookup(schemaPeripheralsMouse),
        _peripheralsTouchpadSettings =
            service.lookup(schemaPeripheralTouchpad) {
    _peripheralsMouseSettings?.addListener(notifyListeners);
    _peripheralsTouchpadSettings?.addListener(notifyListeners);
  }

  @override
  void dispose() {
    _peripheralsMouseSettings?.removeListener(notifyListeners);
    _peripheralsTouchpadSettings?.removeListener(notifyListeners);
    super.dispose();
  }

  final Settings? _peripheralsMouseSettings;
  final Settings? _peripheralsTouchpadSettings;

  // Global section

  bool get leftHanded =>
      _peripheralsMouseSettings?.boolValue(_leftHanded) ?? false;

  void setLeftHanded(bool value) {
    _peripheralsMouseSettings?.setValue(_leftHanded, value);
    notifyListeners();
  }

  // Mouse section

  double get mouseSpeed =>
      _peripheralsMouseSettings?.doubleValue(_mouseSpeedKey) ?? 0.0;

  void setMouseSpeed(double value) {
    _peripheralsMouseSettings?.setValue(_mouseSpeedKey, value);
    notifyListeners();
  }

  bool get mouseNaturalScroll =>
      _peripheralsMouseSettings?.boolValue(_mouseNaturalScrollKey) ?? false;

  void setMouseNaturalScroll(bool value) {
    _peripheralsMouseSettings?.setValue(_mouseNaturalScrollKey, value);
    notifyListeners();
  }

  // Touchpad section

  double get touchpadSpeed =>
      _peripheralsTouchpadSettings?.doubleValue(_touchpadSpeedKey) ?? 0.0;

  void setTouchpadSpeed(double value) {
    _peripheralsTouchpadSettings?.setValue(_touchpadSpeedKey, value);
    notifyListeners();
  }

  bool get touchpadNaturalScroll =>
      _peripheralsTouchpadSettings?.boolValue(_touchpadNaturalScrollKey) ??
      true;

  void setTouchpadNaturalScroll(bool value) {
    _peripheralsTouchpadSettings?.setValue(_touchpadNaturalScrollKey, value);
    notifyListeners();
  }

  bool get touchpadTapToClick =>
      _peripheralsTouchpadSettings?.boolValue(_touchpadTapToClickKey) ?? true;

  void setTouchpadTapToClick(bool value) {
    _peripheralsTouchpadSettings?.setValue(_touchpadTapToClickKey, value);
    notifyListeners();
  }

  bool get touchpadDisableWhileTyping =>
      _peripheralsTouchpadSettings?.boolValue(_touchpadDisableWhileTyping) ??
      false;

  void setTouchpadDisableWhileTyping(bool value) {
    _peripheralsTouchpadSettings?.setValue(_touchpadDisableWhileTyping, value);
    notifyListeners();
  }

  bool get twoFingerScrolling =>
      _peripheralsTouchpadSettings?.boolValue(_touchpadTwoFingerScrolling) ??
      true;

  void setTwoFingerScrolling(bool value) {
    _peripheralsTouchpadSettings?.setValue(_touchpadTwoFingerScrolling, value);
    notifyListeners();
  }

  bool get edgeScrolling =>
      _peripheralsTouchpadSettings?.boolValue(_touchpadEdgeScrolling) ?? false;

  void setEdgeScrolling(bool value) {
    _peripheralsTouchpadSettings?.setValue(_touchpadEdgeScrolling, value);
    notifyListeners();
  }
}
