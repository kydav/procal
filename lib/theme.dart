import 'package:flutter/material.dart';

class ColorPalette {
  static const headerLight = Color(0xfff5fcf3);
  static const headerDark = Color(0xffb6cbb1);

  static const secondaryLight = Color(0xff6b9064);
  static const secondaryDark = Color(0xff446c35);

  static const brandOne = Color(0xff213A57);
  static const brandOne1 = Color.fromARGB(120, 33, 58, 87);

  static const brandTwo = Color(0xff0B6477);
  static const brandTwo1 = Color.fromARGB(120, 11, 99, 119);
  static const brandTwo2 = Color.fromARGB(80, 11, 99, 119);

  static const brandThree = Color(0xff14919B);
  static const brandThree1 = Color.fromARGB(120, 20, 146, 155);

  static const brandFour = Color(0xff0AD1C8);
  static const brandFour1 = Color.fromARGB(120, 10, 209, 199);

  static const brandFive = Color(0xff45DFB1);
  static const brandFive1 = Color.fromARGB(120, 69, 223, 177);

  static const brandSix = Color(0xff80ED99);
  static const brandSix1 = Color.fromARGB(120, 128, 237, 153);
}

class MaterialTheme {
  const MaterialTheme(this.textTheme);
  final TextTheme textTheme;

  static ColorScheme lightScheme() => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff416835),
        surfaceTint: Color(0xff416835),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xffc1efae),
        onPrimaryContainer: Color(0xff022100),
        secondary: Color(0xff54634d),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xffd7e8cc),
        onSecondaryContainer: Color(0xff121f0e),
        tertiary: Color(0xff386668),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xffbcebee),
        onTertiaryContainer: Color(0xff002021),
        error: Color(0xffba1a1a),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffffdad6),
        onErrorContainer: Color(0xff410002),
        surface: Color(0xfff8faf0),
        onSurface: Color(0xff191d17),
        onSurfaceVariant: Color(0xff43483f),
        outline: Color(0xff73796e),
        outlineVariant: Color(0xffc3c8bc),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2e322b),
        inversePrimary: Color(0xffa6d394),
        primaryFixed: Color(0xffc1efae),
        onPrimaryFixed: Color(0xff022100),
        primaryFixedDim: Color(0xffa6d394),
        onPrimaryFixedVariant: Color(0xff2a4f1f),
        secondaryFixed: Color(0xffd7e8cc),
        onSecondaryFixed: Color(0xff121f0e),
        secondaryFixedDim: Color(0xffbbcbb1),
        onSecondaryFixedVariant: Color(0xff3d4b37),
        tertiaryFixed: Color(0xffbcebee),
        onTertiaryFixed: Color(0xff002021),
        tertiaryFixedDim: Color(0xffa0cfd1),
        onTertiaryFixedVariant: Color(0xff1e4e50),
        surfaceDim: Color(0xffd8dbd1),
        surfaceBright: Color(0xfff8faf0),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff2f5eb),
        surfaceContainer: Color(0xffecefe5),
        surfaceContainerHigh: Color(0xffe6e9df),
        surfaceContainerHighest: Color(0xffe1e4da),
      );

  ThemeData light() => theme(lightScheme());

  static ColorScheme lightMediumContrastScheme() => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff264b1c),
        surfaceTint: Color(0xff416835),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff567f49),
        onPrimaryContainer: Color(0xffffffff),
        secondary: Color(0xff394733),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xff6a7962),
        onSecondaryContainer: Color(0xffffffff),
        tertiary: Color(0xff194a4c),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xff4f7c7e),
        onTertiaryContainer: Color(0xffffffff),
        error: Color(0xff8c0009),
        onError: Color(0xffffffff),
        errorContainer: Color(0xffda342e),
        onErrorContainer: Color(0xffffffff),
        surface: Color(0xfff8faf0),
        onSurface: Color(0xff191d17),
        onSurfaceVariant: Color(0xff3f453b),
        outline: Color(0xff5b6156),
        outlineVariant: Color(0xff777d71),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2e322b),
        inversePrimary: Color(0xffa6d394),
        primaryFixed: Color(0xff567f49),
        onPrimaryFixed: Color(0xffffffff),
        primaryFixedDim: Color(0xff3e6533),
        onPrimaryFixedVariant: Color(0xffffffff),
        secondaryFixed: Color(0xff6a7962),
        onSecondaryFixed: Color(0xffffffff),
        secondaryFixedDim: Color(0xff52604b),
        onSecondaryFixedVariant: Color(0xffffffff),
        tertiaryFixed: Color(0xff4f7c7e),
        onTertiaryFixed: Color(0xffffffff),
        tertiaryFixedDim: Color(0xff366365),
        onTertiaryFixedVariant: Color(0xffffffff),
        surfaceDim: Color(0xffd8dbd1),
        surfaceBright: Color(0xfff8faf0),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff2f5eb),
        surfaceContainer: Color(0xffecefe5),
        surfaceContainerHigh: Color(0xffe6e9df),
        surfaceContainerHighest: Color(0xffe1e4da),
      );

  ThemeData lightMediumContrast() => theme(lightMediumContrastScheme());

  static ColorScheme lightHighContrastScheme() => const ColorScheme(
        brightness: Brightness.light,
        primary: Color(0xff032900),
        surfaceTint: Color(0xff416835),
        onPrimary: Color(0xffffffff),
        primaryContainer: Color(0xff264b1c),
        onPrimaryContainer: Color(0xffffffff),
        secondary: Color(0xff192514),
        onSecondary: Color(0xffffffff),
        secondaryContainer: Color(0xff394733),
        onSecondaryContainer: Color(0xffffffff),
        tertiary: Color(0xff002729),
        onTertiary: Color(0xffffffff),
        tertiaryContainer: Color(0xff194a4c),
        onTertiaryContainer: Color(0xffffffff),
        error: Color(0xff4e0002),
        onError: Color(0xffffffff),
        errorContainer: Color(0xff8c0009),
        onErrorContainer: Color(0xffffffff),
        surface: Color(0xfff8faf0),
        onSurface: Color(0xff000000),
        onSurfaceVariant: Color(0xff20251d),
        outline: Color(0xff3f453b),
        outlineVariant: Color(0xff3f453b),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xff2e322b),
        inversePrimary: Color(0xffcbf9b7),
        primaryFixed: Color(0xff264b1c),
        onPrimaryFixed: Color(0xffffffff),
        primaryFixedDim: Color(0xff0f3407),
        onPrimaryFixedVariant: Color(0xffffffff),
        secondaryFixed: Color(0xff394733),
        onSecondaryFixed: Color(0xffffffff),
        secondaryFixedDim: Color(0xff23301e),
        onSecondaryFixedVariant: Color(0xffffffff),
        tertiaryFixed: Color(0xff194a4c),
        onTertiaryFixed: Color(0xffffffff),
        tertiaryFixedDim: Color(0xff003335),
        onTertiaryFixedVariant: Color(0xffffffff),
        surfaceDim: Color(0xffd8dbd1),
        surfaceBright: Color(0xfff8faf0),
        surfaceContainerLowest: Color(0xffffffff),
        surfaceContainerLow: Color(0xfff2f5eb),
        surfaceContainer: Color(0xffecefe5),
        surfaceContainerHigh: Color(0xffe6e9df),
        surfaceContainerHighest: Color(0xffe1e4da),
      );

  ThemeData lightHighContrast() => theme(lightHighContrastScheme());

  static ColorScheme darkScheme() => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffa6d394),
        surfaceTint: Color(0xffa6d394),
        onPrimary: Color(0xff13380a),
        primaryContainer: Color(0xff2a4f1f),
        onPrimaryContainer: Color(0xffc1efae),
        secondary: Color(0xffbbcbb1),
        onSecondary: Color(0xff273421),
        secondaryContainer: Color(0xff3d4b37),
        onSecondaryContainer: Color(0xffd7e8cc),
        tertiary: Color(0xffa0cfd1),
        onTertiary: Color(0xff003739),
        tertiaryContainer: Color(0xff1e4e50),
        onTertiaryContainer: Color(0xffbcebee),
        error: Color(0xffffb4ab),
        onError: Color(0xff690005),
        errorContainer: Color(0xff93000a),
        onErrorContainer: Color(0xffffdad6),
        surface: Color(0xff11140f),
        onSurface: Color(0xffe1e4da),
        onSurfaceVariant: Color(0xffc3c8bc),
        outline: Color(0xff8d9387),
        outlineVariant: Color(0xff43483f),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe1e4da),
        inversePrimary: Color(0xff416835),
        primaryFixed: Color(0xffc1efae),
        onPrimaryFixed: Color(0xff022100),
        primaryFixedDim: Color(0xffa6d394),
        onPrimaryFixedVariant: Color(0xff2a4f1f),
        secondaryFixed: Color(0xffd7e8cc),
        onSecondaryFixed: Color(0xff121f0e),
        secondaryFixedDim: Color(0xffbbcbb1),
        onSecondaryFixedVariant: Color(0xff3d4b37),
        tertiaryFixed: Color(0xffbcebee),
        onTertiaryFixed: Color(0xff002021),
        tertiaryFixedDim: Color(0xffa0cfd1),
        onTertiaryFixedVariant: Color(0xff1e4e50),
        surfaceDim: Color(0xff11140f),
        surfaceBright: Color(0xff373a34),
        surfaceContainerLowest: Color(0xff0c0f0a),
        surfaceContainerLow: Color(0xff191d17),
        surfaceContainer: Color(0xff1d211b),
        surfaceContainerHigh: Color(0xff272b25),
        surfaceContainerHighest: Color(0xff32362f),
      );

  ThemeData dark() => theme(darkScheme());

  static ColorScheme darkMediumContrastScheme() => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xffaad798),
        surfaceTint: Color(0xffa6d394),
        onPrimary: Color(0xff011b00),
        primaryContainer: Color(0xff729c63),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xffc0d0b5),
        onSecondary: Color(0xff0d1909),
        secondaryContainer: Color(0xff86957d),
        onSecondaryContainer: Color(0xff000000),
        tertiary: Color(0xffa4d3d6),
        onTertiary: Color(0xff001a1b),
        tertiaryContainer: Color(0xff6b999b),
        onTertiaryContainer: Color(0xff000000),
        error: Color(0xffffbab1),
        onError: Color(0xff370001),
        errorContainer: Color(0xffff5449),
        onErrorContainer: Color(0xff000000),
        surface: Color(0xff11140f),
        onSurface: Color(0xfff9fcf2),
        onSurfaceVariant: Color(0xffc7cdc0),
        outline: Color(0xff9fa599),
        outlineVariant: Color(0xff7f857a),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe1e4da),
        inversePrimary: Color(0xff2b5120),
        primaryFixed: Color(0xffc1efae),
        onPrimaryFixed: Color(0xff011600),
        primaryFixedDim: Color(0xffa6d394),
        onPrimaryFixedVariant: Color(0xff193e10),
        secondaryFixed: Color(0xffd7e8cc),
        onSecondaryFixed: Color(0xff081405),
        secondaryFixedDim: Color(0xffbbcbb1),
        onSecondaryFixedVariant: Color(0xff2c3a27),
        tertiaryFixed: Color(0xffbcebee),
        onTertiaryFixed: Color(0xff001415),
        tertiaryFixedDim: Color(0xffa0cfd1),
        onTertiaryFixedVariant: Color(0xff073d3f),
        surfaceDim: Color(0xff11140f),
        surfaceBright: Color(0xff373a34),
        surfaceContainerLowest: Color(0xff0c0f0a),
        surfaceContainerLow: Color(0xff191d17),
        surfaceContainer: Color(0xff1d211b),
        surfaceContainerHigh: Color(0xff272b25),
        surfaceContainerHighest: Color(0xff32362f),
      );

  ThemeData darkMediumContrast() => theme(darkMediumContrastScheme());

  static ColorScheme darkHighContrastScheme() => const ColorScheme(
        brightness: Brightness.dark,
        primary: Color(0xfff2ffe7),
        surfaceTint: Color(0xffa6d394),
        onPrimary: Color(0xff000000),
        primaryContainer: Color(0xffaad798),
        onPrimaryContainer: Color(0xff000000),
        secondary: Color(0xfff2ffe7),
        onSecondary: Color(0xff000000),
        secondaryContainer: Color(0xffc0d0b5),
        onSecondaryContainer: Color(0xff000000),
        tertiary: Color(0xffebfeff),
        onTertiary: Color(0xff000000),
        tertiaryContainer: Color(0xffa4d3d6),
        onTertiaryContainer: Color(0xff000000),
        error: Color(0xfffff9f9),
        onError: Color(0xff000000),
        errorContainer: Color(0xffffbab1),
        onErrorContainer: Color(0xff000000),
        surface: Color(0xff11140f),
        onSurface: Color(0xffffffff),
        onSurfaceVariant: Color(0xfff7fdef),
        outline: Color(0xffc7cdc0),
        outlineVariant: Color(0xffc7cdc0),
        shadow: Color(0xff000000),
        scrim: Color(0xff000000),
        inverseSurface: Color(0xffe1e4da),
        inversePrimary: Color(0xff0c3105),
        primaryFixed: Color(0xffc6f4b2),
        onPrimaryFixed: Color(0xff000000),
        primaryFixedDim: Color(0xffaad798),
        onPrimaryFixedVariant: Color(0xff011b00),
        secondaryFixed: Color(0xffdcecd0),
        onSecondaryFixed: Color(0xff000000),
        secondaryFixedDim: Color(0xffc0d0b5),
        onSecondaryFixedVariant: Color(0xff0d1909),
        tertiaryFixed: Color(0xffc0f0f2),
        onTertiaryFixed: Color(0xff000000),
        tertiaryFixedDim: Color(0xffa4d3d6),
        onTertiaryFixedVariant: Color(0xff001a1b),
        surfaceDim: Color(0xff11140f),
        surfaceBright: Color(0xff373a34),
        surfaceContainerLowest: Color(0xff0c0f0a),
        surfaceContainerLow: Color(0xff191d17),
        surfaceContainer: Color(0xff1d211b),
        surfaceContainerHigh: Color(0xff272b25),
        surfaceContainerHighest: Color(0xff32362f),
      );

  ThemeData darkHighContrast() => theme(darkHighContrastScheme());

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
  final Color seed;
  final Color value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;
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
