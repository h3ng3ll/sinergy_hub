import 'package:flutter/material.dart';

/// A generic, highly customizable popup menu widget.
///
/// This widget wraps Flutter's [PopupMenuButton] and provides extensive
/// customization options for appearance, behavior, and content.
///
/// Type parameter [T] represents the type of values the popup menu operates on.
///
/// Example usage:
/// ```dart
/// CustomPopupMenu<String>(
///   items: ['Edit', 'Delete', 'Share'],
///   itemBuilder: (context, item) => PopupMenuItem(
///     value: item,
///     child: Text(item),
///   ),
///   onSelected: (value) => print('Selected: $value'),
/// )
/// ```
class CustomPopupMenu<T> extends StatelessWidget {
  /// List of items to display in the popup menu
  final List<T> items;

  /// Builder function to create [PopupMenuEntry] for each item
  final PopupMenuEntry<T> Function(BuildContext context, T item) itemBuilder;

  /// Callback when an item is selected
  final void Function(T value)? onSelected;

  /// Callback when the popup menu is canceled
  final VoidCallback? onCanceled;

  /// The value of the currently selected item
  final T? initialValue;

  /// Custom child widget to trigger the popup menu
  /// If null, uses [icon] or default icon
  final Widget? child;

  /// Icon to display as trigger button
  /// Only used if [child] is null
  final Widget? icon;

  /// Tooltip text for the trigger button
  final String? tooltip;

  /// Padding around the trigger button
  final EdgeInsetsGeometry padding;

  /// Splash radius for the trigger button
  final double? splashRadius;

  /// Icon size for the default icon
  final double? iconSize;

  /// Icon color
  final Color? iconColor;

  /// Background color of the popup menu
  final Color? color;

  /// Shadow color of the popup menu
  final Color? shadowColor;

  /// Surface tint color of the popup menu
  final Color? surfaceTintColor;

  /// Elevation of the popup menu
  final double? elevation;

  /// Shape of the popup menu
  final ShapeBorder? shape;

  /// Offset for positioning the popup menu
  final Offset offset;

  /// Whether the popup menu is enabled
  final bool enabled;

  /// Constraints for the popup menu size
  final BoxConstraints? constraints;

  /// Position of the popup menu relative to the button
  final PopupMenuPosition position;

  /// Clip behavior for the popup menu
  final Clip clipBehavior;

  /// Whether to use the root navigator
  final bool useRootNavigator;

  /// Animation style for the popup menu
  final AnimationStyle? popUpAnimationStyle;

  /// Route settings for the popup menu
  final RouteSettings? routeSettings;

  /// Enable feedback (haptic/sound) on interaction
  final bool? enableFeedback;

  /// Padding inside the popup menu
  final EdgeInsetsGeometry? menuPadding;

  /// Builder for custom positioned popup menu
  final Widget Function(BuildContext, Animation<double>, Widget)? builder;

  /// Icon theme data for the popup menu items
  final IconThemeData? iconThemeData;

  /// Text style for the popup menu items
  final TextStyle? textStyle;

  const CustomPopupMenu({
    super.key,
    required this.items,
    required this.itemBuilder,
    this.onSelected,
    this.onCanceled,
    this.initialValue,
    this.child,
    this.icon,
    this.tooltip,
    this.padding = const EdgeInsets.all(8.0),
    this.splashRadius,
    this.iconSize,
    this.iconColor,
    this.color,
    this.shadowColor,
    this.surfaceTintColor,
    this.elevation,
    this.shape,
    this.offset = Offset.zero,
    this.enabled = true,
    this.constraints,
    this.position = PopupMenuPosition.over,
    this.clipBehavior = Clip.none,
    this.useRootNavigator = false,
    this.popUpAnimationStyle,
    this.routeSettings,
    this.enableFeedback,
    this.menuPadding,
    this.builder,
    this.iconThemeData,
    this.textStyle,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<T>(
      itemBuilder: (context) =>
          items.map((item) => itemBuilder(context, item)).toList(),
      onSelected: onSelected,
      onCanceled: onCanceled,
      initialValue: initialValue,
      icon: icon,
      tooltip: tooltip,
      padding: padding,
      splashRadius: splashRadius,
      iconSize: iconSize,
      iconColor: iconColor,
      color: color,
      shadowColor: shadowColor,
      surfaceTintColor: surfaceTintColor,
      elevation: elevation,
      shape: shape,
      offset: offset,
      enabled: enabled,
      constraints: constraints,
      position: position,
      clipBehavior: clipBehavior,
      useRootNavigator: useRootNavigator,
      popUpAnimationStyle: popUpAnimationStyle,
      routeSettings: routeSettings,
      enableFeedback: enableFeedback,
      menuPadding: menuPadding,
      child: child,
    );
  }
}

/// A builder widget for creating custom popup menu items with consistent styling.
///
/// This widget helps maintain consistent styling across popup menu items
/// and supports various customization options.
class CustomPopupMenuItem<T> extends PopupMenuItem<T> {
  /// Creates a custom popup menu item with consistent styling.
  CustomPopupMenuItem({
    super.key,
    super.value,
    super.onTap,
    super.enabled = true,
    super.height,
    super.padding,
    super.textStyle,
    super.labelTextStyle,
    super.mouseCursor,
    Widget? leading,
    required Widget itemChild,
    Widget? trailing,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 4.0,
    ),
  }) : super(
         child: Padding(
           padding: contentPadding,
           child: Row(
             mainAxisSize: MainAxisSize.min,
             children: [
               if (leading != null) ...[
                 leading,
                 const SizedBox(width: 12.0),
               ],
               Expanded(child: itemChild),
               if (trailing != null) ...[
                 const SizedBox(width: 12.0),
                 trailing,
               ],
             ],
           ),
         ),
       );

  /// Creates a popup menu item with an icon and text.
  factory CustomPopupMenuItem.withIcon({
    Key? key,
    T? value,
    VoidCallback? onTap,
    bool enabled = true,
    double height = kMinInteractiveDimension,
    EdgeInsets? padding,
    TextStyle? textStyle,
    WidgetStateProperty<TextStyle?>? labelTextStyle,
    MouseCursor? mouseCursor,
    required IconData icon,
    required String text,
    Color? iconColor,
    double iconSize = 20.0,
    Widget? trailing,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 4.0,
    ),
  }) {
    return CustomPopupMenuItem<T>(
      key: key,
      value: value,
      onTap: onTap,
      enabled: enabled,
      height: height,
      padding: padding,
      textStyle: textStyle,
      labelTextStyle: labelTextStyle,
      mouseCursor: mouseCursor,
      contentPadding: contentPadding,
      trailing: trailing,
      leading: Icon(
        icon,
        color: iconColor,
        size: iconSize,
      ),
      itemChild: Text(text),
    );
  }

  /// Creates a destructive popup menu item (typically for delete actions).
  factory CustomPopupMenuItem.destructive({
    Key? key,
    T? value,
    VoidCallback? onTap,
    bool enabled = true,
    double height = kMinInteractiveDimension,
    EdgeInsets? padding,
    MouseCursor? mouseCursor,
    required IconData icon,
    required String text,
    double iconSize = 20.0,
    Widget? trailing,
    EdgeInsetsGeometry contentPadding = const EdgeInsets.symmetric(
      horizontal: 4.0,
    ),
  }) {
    return CustomPopupMenuItem<T>(
      key: key,
      value: value,
      onTap: onTap,
      enabled: enabled,
      height: height,
      padding: padding,
      textStyle: const TextStyle(color: Colors.red),
      mouseCursor: mouseCursor,
      contentPadding: contentPadding,
      trailing: trailing,
      leading: Icon(
        icon,
        color: Colors.red,
        size: iconSize,
      ),
      itemChild: Text(
        text,
        style: const TextStyle(color: Colors.red),
      ),
    );
  }
}

/// A divider for use in popup menus.
class CustomPopupMenuDivider<T> extends PopupMenuDivider {
  const CustomPopupMenuDivider({
    super.key,
    super.height,
  });
}

/// A header item for popup menus.
///
/// This is a non-selectable item that can be used as a section header.
class CustomPopupMenuHeader extends PopupMenuItem<Never> {
  CustomPopupMenuHeader({
    super.key,
    required String title,
    TextStyle? textStyle,
    EdgeInsets? padding,
  }) : super(
         enabled: false,
         padding:
             padding ??
             const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
         child: Text(
           title,
           style:
               textStyle ??
               const TextStyle(
                 fontWeight: FontWeight.bold,
                 fontSize: 12.0,
                 color: Colors.grey,
               ),
         ),
       );
}
