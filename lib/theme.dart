import "package:flutter/material.dart";

class MyTheme {
  // デフォルトのテキストテーマを利用
  final TextTheme textTheme = ThemeData.light(useMaterial3: true).textTheme;

  MyTheme();

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff745b0c),
      surfaceTint: Color(0xff745b0c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffffdf91),
      onPrimaryContainer: Color(0xff594400),
      secondary: Color(0xff6a5d3f),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xfff2e1bb),
      onSecondaryContainer: Color(0xff51462a),
      tertiary: Color(0xff00687a),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffadecff),
      onTertiaryContainer: Color(0xff004e5c),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff1f1b13),
      onSurfaceVariant: Color(0xff4a4739),
      outline: Color(0xff7b7768),
      outlineVariant: Color(0xffccc6b5),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe4c36c),
      primaryFixed: Color(0xffffdf91),
      onPrimaryFixed: Color(0xff241a00),
      primaryFixedDim: Color(0xffe4c36c),
      onPrimaryFixedVariant: Color(0xff594400),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff231b04),
      secondaryFixedDim: Color(0xffd6c5a0),
      onSecondaryFixedVariant: Color(0xff51462a),
      tertiaryFixed: Color(0xffadecff),
      onTertiaryFixed: Color(0xff001f26),
      tertiaryFixedDim: Color(0xff85d2e7),
      onTertiaryFixedVariant: Color(0xff004e5c),
      surfaceDim: Color(0xffe1d9cc),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff6eddf),
      surfaceContainerHigh: Color(0xfff0e7d9),
      surfaceContainerHighest: Color(0xffeae1d4),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff443400),
      surfaceTint: Color(0xff745b0c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff846a1c),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff3f351b),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff796c4d),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff003c48),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1e778a),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff740006),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffcf2c27),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff141109),
      onSurfaceVariant: Color(0xff393629),
      outline: Color(0xff565244),
      outlineVariant: Color(0xff716d5e),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe4c36c),
      primaryFixed: Color(0xff846a1c),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff6a5200),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff796c4d),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff5f5437),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff1e778a),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff005d6e),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffcec5b8),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfffcf2e5),
      surfaceContainer: Color(0xfff0e7d9),
      surfaceContainerHigh: Color(0xffe4dcce),
      surfaceContainerHighest: Color(0xffd9d1c3),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff382a00),
      surfaceTint: Color(0xff745b0c),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5b4600),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff352b12),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff53482c),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff00313b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff005160),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff600004),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff98000a),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffff8f1),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff000000),
      outline: Color(0xff2f2c20),
      outlineVariant: Color(0xff4d493c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff343027),
      inversePrimary: Color(0xffe4c36c),
      primaryFixed: Color(0xff5b4600),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff403100),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff53482c),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3c3217),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff005160),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff003843),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffc0b8ab),
      surfaceBright: Color(0xfffff8f1),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff9f0e2),
      surfaceContainer: Color(0xffeae1d4),
      surfaceContainerHigh: Color(0xffdcd3c6),
      surfaceContainerHighest: Color(0xffcec5b8),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffe4c36c),
      surfaceTint: Color(0xffe4c36c),
      onPrimary: Color(0xff3d2e00),
      primaryContainer: Color(0xff594400),
      onPrimaryContainer: Color(0xffffdf91),
      secondary: Color(0xffd6c5a0),
      onSecondary: Color(0xff392f15),
      secondaryContainer: Color(0xff51462a),
      onSecondaryContainer: Color(0xfff2e1bb),
      tertiary: Color(0xff85d2e7),
      onTertiary: Color(0xff003640),
      tertiaryContainer: Color(0xff004e5c),
      onTertiaryContainer: Color(0xffadecff),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff16130b),
      onSurface: Color(0xffeae1d4),
      onSurfaceVariant: Color(0xffccc6b5),
      outline: Color(0xff969180),
      outlineVariant: Color(0xff4a4739),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff745b0c),
      primaryFixed: Color(0xffffdf91),
      onPrimaryFixed: Color(0xff241a00),
      primaryFixedDim: Color(0xffe4c36c),
      onPrimaryFixedVariant: Color(0xff594400),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff231b04),
      secondaryFixedDim: Color(0xffd6c5a0),
      onSecondaryFixedVariant: Color(0xff51462a),
      tertiaryFixed: Color(0xffadecff),
      onTertiaryFixed: Color(0xff001f26),
      tertiaryFixedDim: Color(0xff85d2e7),
      onTertiaryFixedVariant: Color(0xff004e5c),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff3d392f),
      surfaceContainerLowest: Color(0xff110e07),
      surfaceContainerLow: Color(0xff1f1b13),
      surfaceContainer: Color(0xff231f17),
      surfaceContainerHigh: Color(0xff2e2a21),
      surfaceContainerHighest: Color(0xff39342b),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffcd980),
      surfaceTint: Color(0xffe4c36c),
      onPrimary: Color(0xff302400),
      primaryContainer: Color(0xffab8d3d),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffecdbb5),
      onSecondary: Color(0xff2e250c),
      secondaryContainer: Color(0xff9e8f6e),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xff9be8fe),
      onTertiary: Color(0xff002a33),
      tertiaryContainer: Color(0xff4c9baf),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xffffd2cc),
      onError: Color(0xff540003),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffe3dcca),
      outline: Color(0xffb7b2a1),
      outlineVariant: Color(0xff959080),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff5a4500),
      primaryFixed: Color(0xffffdf91),
      onPrimaryFixed: Color(0xff181000),
      primaryFixedDim: Color(0xffe4c36c),
      onPrimaryFixedVariant: Color(0xff443400),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff181000),
      secondaryFixedDim: Color(0xffd6c5a0),
      onSecondaryFixedVariant: Color(0xff3f351b),
      tertiaryFixed: Color(0xffadecff),
      onTertiaryFixed: Color(0xff001419),
      tertiaryFixedDim: Color(0xff85d2e7),
      onTertiaryFixedVariant: Color(0xff003c48),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff49443a),
      surfaceContainerLowest: Color(0xff0a0703),
      surfaceContainerLow: Color(0xff211d15),
      surfaceContainer: Color(0xff2b271f),
      surfaceContainerHigh: Color(0xff363229),
      surfaceContainerHighest: Color(0xff423d34),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffeecc),
      surfaceTint: Color(0xffe4c36c),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffe0bf69),
      onPrimaryContainer: Color(0xff100a00),
      secondary: Color(0xffffeecc),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffd2c19d),
      onSecondaryContainer: Color(0xff100a00),
      tertiary: Color(0xffd6f5ff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xff81cee3),
      onTertiaryContainer: Color(0xff000d12),
      error: Color(0xffffece9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffaea4),
      onErrorContainer: Color(0xff220001),
      surface: Color(0xff16130b),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xffffffff),
      outline: Color(0xfff7f0dd),
      outlineVariant: Color(0xffc8c2b1),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffeae1d4),
      inversePrimary: Color(0xff5a4500),
      primaryFixed: Color(0xffffdf91),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffe4c36c),
      onPrimaryFixedVariant: Color(0xff181000),
      secondaryFixed: Color(0xfff2e1bb),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffd6c5a0),
      onSecondaryFixedVariant: Color(0xff181000),
      tertiaryFixed: Color(0xffadecff),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xff85d2e7),
      onTertiaryFixedVariant: Color(0xff001419),
      surfaceDim: Color(0xff16130b),
      surfaceBright: Color(0xff554f45),
      surfaceContainerLowest: Color(0xff000000),
      surfaceContainerLow: Color(0xff231f17),
      surfaceContainer: Color(0xff343027),
      surfaceContainerHigh: Color(0xff403b31),
      surfaceContainerHighest: Color(0xff4b463c),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(
      bodyColor: colorScheme.onSurface,
      displayColor: colorScheme.onSurface,
    ),
    scaffoldBackgroundColor: colorScheme.surface,
    canvasColor: colorScheme.surface,
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
