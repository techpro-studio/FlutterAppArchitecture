import 'package:flutter/material.dart';

class NoRippleFactory extends InteractiveInkFeatureFactory {
  const NoRippleFactory();

  @override
  InteractiveInkFeature create(
      {MaterialInkController controller,
      RenderBox referenceBox,
      Offset position,
      Color color,
      TextDirection textDirection,
      bool containedInkWell = false,
      rectCallback,
      BorderRadius borderRadius,
      ShapeBorder customBorder,
      double radius,
      onRemoved}) {
    // TODO: implement create
    return NoRipple(
      controller: controller,
      referenceBox: referenceBox,
    );
  }
}

class NoRipple extends InteractiveInkFeature {
  NoRipple({
    @required MaterialInkController controller,
    @required RenderBox referenceBox,
  })  : assert(controller != null),
        assert(referenceBox != null),
        super(
          controller: controller,
          referenceBox: referenceBox,
        );

  @override
  void paintFeature(Canvas canvas, Matrix4 transform) {}
}
