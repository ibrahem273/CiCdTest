part of 'app_theme.dart';

const _lightColorScheme = ColorScheme.light(
  primary: Color.fromRGBO(192, 24, 104, 1),
  onPrimary: Color(0xffffffff),
  // onPrimary : Color(0xffF5F5F5),

  primaryContainer: Color.fromRGBO(239, 239, 239, 1),
  onPrimaryContainer: Color.fromRGBO(193, 193, 193, 1),
  tertiary: Color(0xFFF4F4F4),
  outline: Color(0xffEDEDED),

  secondary: Color(0xFF0196FD),
  onSecondary: Color(0xFF59D4FE),

  // surface : Color(0x99000000),

  onTertiary: Color(0xFFFFFFFF),

  error: Colors.red,
  errorContainer: Color(0xFFF9DEDC),

  onError: Color(0xFFFFFFFF),
  onErrorContainer: Color(0xFF410E0B),

  surface: Color(0xFFFFFFFF),

  onSurface: Color(0xFF191C1D),

  surfaceContainerHighest: Color(0xffF4F4F4),
  onSurfaceVariant: Color(0xFF49454F),

  onInverseSurface: Color(0xFFEFF1F1),
  inverseSurface: Color(0xFF2D3132),

  shadow: Colors.grey,
);

ColorScheme get lightColorScheme => _lightColorScheme;
