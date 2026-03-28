import 'dart:math' show min;

/// Responsive breakpoint names matching the app's ResponsiveBreakpoints configuration
abstract class BreakpointNames {
  static const String mobile = 'MOBILE';
  static const String tablet = 'TABLET';
  static const String desktop = 'DESKTOP';
  static const String fourK = '4K';
}

/// Helper class for responsive design calculations
///
/// Provides methods to calculate adaptive values based on screen width,
/// ensuring consistent UI scaling across mobile, tablet, and desktop platforms.
class ResponsiveHelper {
  /// Returns the current breakpoint name based on screen width
  static String getBreakpoint(double screenWidth) {
    if (screenWidth <= 450) {
      return BreakpointNames.mobile;
    } else if (screenWidth <= 900) {
      return BreakpointNames.tablet;
    } else if (screenWidth <= 1920) {
      return BreakpointNames.desktop;
    } else {
      return BreakpointNames.fourK;
    }
  }

  /// Returns true if the current screen is considered desktop or larger
  static bool isDesktop(double screenWidth) {
    return screenWidth > 900;
  }

  /// Returns true if the current screen is considered tablet or larger
  static bool isTablet(double screenWidth) {
    return screenWidth > 450;
  }

  /// Calculates responsive padding based on screen width
  ///
  /// [basePadding] is the padding value used for mobile screens.
  /// The padding scales up for larger screens with a maximum cap.
  static double responsivePadding(
    double screenWidth,
    double basePadding, {
    double? maxPadding,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = basePadding;
      case BreakpointNames.tablet:
        scaled = basePadding * 1.3;
      case BreakpointNames.desktop:
        scaled = basePadding * 1.6;
      case BreakpointNames.fourK:
        scaled = basePadding * 1.8;
      default:
        scaled = basePadding;
    }
    return maxPadding != null ? min(scaled, maxPadding) : scaled;
  }

  /// Calculates responsive font size based on screen width
  ///
  /// [baseFontSize] is the font size used for mobile screens.
  /// The font size scales up for larger screens with a maximum cap.
  static double responsiveFontSize(
    double screenWidth,
    double baseFontSize, {
    double? maxFontSize,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = baseFontSize;
      case BreakpointNames.tablet:
        scaled = baseFontSize * 1.2;
      case BreakpointNames.desktop:
        scaled = baseFontSize * 1.4;
      case BreakpointNames.fourK:
        scaled = baseFontSize * 1.5;
      default:
        scaled = baseFontSize;
    }
    return maxFontSize != null ? min(scaled, maxFontSize) : scaled;
  }

  /// Calculates responsive spacing (gaps) based on screen width
  ///
  /// [baseSpacing] is the spacing value used for mobile screens.
  /// The spacing scales up for larger screens with a maximum cap.
  static double responsiveSpacing(
    double screenWidth,
    double baseSpacing, {
    double? maxSpacing,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = baseSpacing;
      case BreakpointNames.tablet:
        scaled = baseSpacing * 1.3;
      case BreakpointNames.desktop:
        scaled = baseSpacing * 1.5;
      case BreakpointNames.fourK:
        scaled = baseSpacing * 1.6;
      default:
        scaled = baseSpacing;
    }
    return maxSpacing != null ? min(scaled, maxSpacing) : scaled;
  }

  /// Calculates responsive avatar size based on screen width
  ///
  /// [baseSize] is the avatar size used for mobile screens.
  /// The avatar size scales up for larger screens with a maximum cap.
  static double responsiveAvatarSize(
    double screenWidth,
    double baseSize, {
    double? maxSize,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = baseSize;
      case BreakpointNames.tablet:
        scaled = baseSize * 1.2;
      case BreakpointNames.desktop:
        scaled = baseSize * 1.4;
      case BreakpointNames.fourK:
        scaled = baseSize * 1.5;
      default:
        scaled = baseSize;
    }
    return maxSize != null ? min(scaled, maxSize) : scaled;
  }

  /// Calculates responsive border radius based on screen width
  ///
  /// [baseRadius] is the radius value used for mobile screens.
  /// The radius scales up for larger screens.
  static double responsiveBorderRadius(
    double screenWidth,
    double baseRadius, {
    double? maxRadius,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = baseRadius;
      case BreakpointNames.tablet:
        scaled = baseRadius * 1.2;
      case BreakpointNames.desktop:
        scaled = baseRadius * 1.4;
      case BreakpointNames.fourK:
        scaled = baseRadius * 1.5;
      default:
        scaled = baseRadius;
    }
    return maxRadius != null ? min(scaled, maxRadius) : scaled;
  }

  /// Returns the maximum content width for optimal readability
  ///
  /// On desktop and larger screens, content is constrained to prevent
  /// lines from becoming too long to read comfortably.
  static double maxContentWidth(double screenWidth) {
    final breakpoint = getBreakpoint(screenWidth);
    switch (breakpoint) {
      case BreakpointNames.mobile:
        return screenWidth;
      case BreakpointNames.tablet:
        return screenWidth * 0.9;
      case BreakpointNames.desktop:
      case BreakpointNames.fourK:
        return 600; // Max width for readability
      default:
        return screenWidth;
    }
  }

  /// Calculates responsive icon size based on screen width
  ///
  /// [baseSize] is the icon size used for mobile screens.
  static double responsiveIconSize(
    double screenWidth,
    double baseSize, {
    double? maxSize,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = baseSize;
      case BreakpointNames.tablet:
        scaled = baseSize * 1.15;
      case BreakpointNames.desktop:
        scaled = baseSize * 1.3;
      case BreakpointNames.fourK:
        scaled = baseSize * 1.4;
      default:
        scaled = baseSize;
    }
    return maxSize != null ? min(scaled, maxSize) : scaled;
  }

  /// Calculates responsive button height based on screen width
  ///
  /// [baseHeight] is the button height used for mobile screens.
  static double responsiveButtonHeight(
    double screenWidth,
    double baseHeight, {
    double? maxHeight,
  }) {
    final breakpoint = getBreakpoint(screenWidth);
    double scaled;
    switch (breakpoint) {
      case BreakpointNames.mobile:
        scaled = baseHeight;
      case BreakpointNames.tablet:
        scaled = baseHeight * 1.1;
      case BreakpointNames.desktop:
        scaled = baseHeight * 1.2;
      case BreakpointNames.fourK:
        scaled = baseHeight * 1.3;
      default:
        scaled = baseHeight;
    }
    return maxHeight != null ? min(scaled, maxHeight) : scaled;
  }
}
