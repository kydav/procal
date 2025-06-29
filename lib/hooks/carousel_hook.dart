import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

CarouselSliderController useCarouselSliderController() =>
    use(const _CarouselSliderControllerHook());

class _CarouselSliderControllerHook extends Hook<CarouselSliderController> {
  const _CarouselSliderControllerHook();

  @override
  HookState<CarouselSliderController, Hook<CarouselSliderController>>
  createState() => _CarouselSliderControllerState();
}

class _CarouselSliderControllerState
    extends HookState<CarouselSliderController, _CarouselSliderControllerHook> {
  late final controller = CarouselSliderController();

  @override
  CarouselSliderController build(context) => controller;

  @override
  void dispose() => super.dispose();
}
