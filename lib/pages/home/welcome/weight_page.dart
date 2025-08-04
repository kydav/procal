import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/pages/home/welcome/welcome_controller.dart';
import 'package:procal/pages/home/welcome/welcome_wrapper.dart';

class WeightPage extends HookConsumerWidget {
  const WeightPage({required this.pageController, super.key});
  final PageController pageController;

  void checkDisabled(
    TextEditingController weightController,
    TextEditingController heightControllerCmOrFt,
    ValueNotifier<bool> isNextDisabled,
  ) {
    if (weightController.value.text.isNotEmpty &&
        heightControllerCmOrFt.value.text.isNotEmpty) {
      isNextDisabled.value = false;
    } else {
      isNextDisabled.value = true;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final welcomeController = ref.read(welcomeControllerProvider.notifier);
    final welcomeState = ref.watch(welcomeControllerProvider);
    final measurementUnit = useState(
      welcomeState.measurementUnit ?? MeasurementUnit.imperial,
    );
    final weightController = useTextEditingController(
      text: welcomeState.currentWeight != null
          ? (measurementUnit.value == MeasurementUnit.imperial
                ? (welcomeState.currentWeight! * 2.20462).toString()
                : welcomeState.currentWeight.toString())
          : null,
    );

    final heightControllerCmOrFt = useTextEditingController();
    final heightControllerInches = useTextEditingController();

    final isNextDisabled = useState(true);

    useEffect(() {
      if (welcomeState.height != null) {
        if (measurementUnit.value == MeasurementUnit.imperial) {
          final feet = (welcomeState.height! / 30.48).toInt();
          final inches = ((welcomeState.height! / 30.48) - feet) * 12;
          heightControllerCmOrFt.text = feet.toString();
          heightControllerInches.text = inches.toStringAsFixed(0);
        } else {
          heightControllerCmOrFt.text = welcomeState.height.toString();
        }
      }
      return null;
    }, []);

    heightControllerCmOrFt.addListener(
      () => checkDisabled(
        weightController,
        heightControllerCmOrFt,
        isNextDisabled,
      ),
    );

    weightController.addListener(
      () => checkDisabled(
        weightController,
        heightControllerCmOrFt,
        isNextDisabled,
      ),
    );

    return WelcomeWrapper(
      pageController: pageController,
      isNextDisabled: isNextDisabled.value,
      onNextPressed: () {
        welcomeController.setMeasurementUnit(measurementUnit.value);
        if (measurementUnit.value == MeasurementUnit.imperial) {
          if (heightControllerInches.text.isNotEmpty) {
            welcomeController
              ..setHeight(
                (double.parse(heightControllerCmOrFt.text) * 30.48 +
                        double.parse(heightControllerInches.text) * 2.54)
                    .toInt(),
              )
              ..setCurrentWeight(
                (double.parse(weightController.text) / 2.20462).toInt(),
              );
          } else {
            welcomeController
              ..setHeight(
                (double.parse(heightControllerCmOrFt.text) * 30.48).toInt(),
              )
              ..setCurrentWeight(int.parse(weightController.text));
          }
        } else {
          welcomeController.setHeight(int.parse(heightControllerCmOrFt.text));
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            Text(WelcomeStrings.aLittleMorePersonal),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(WelcomeStrings.height),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              spacing: 10.0,
              children: [
                Expanded(
                  child: TextField(
                    controller: weightController,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    autofillHints: const [AutofillHints.givenName],
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText:
                          measurementUnit.value == MeasurementUnit.imperial
                          ? WelcomeStrings.lbs
                          : WelcomeStrings.kg,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                DropdownButton<MeasurementUnit>(
                  value: measurementUnit.value,
                  items: const [
                    DropdownMenuItem(
                      value: MeasurementUnit.imperial,
                      child: Text('Imperial'),
                    ),
                    DropdownMenuItem(
                      value: MeasurementUnit.metric,
                      child: Text('Metric'),
                    ),
                  ],
                  onChanged: (value) {
                    if (value != null) {
                      if (measurementUnit.value != value) {
                        if (value == MeasurementUnit.imperial &&
                            heightControllerCmOrFt.text.isNotEmpty) {
                          final current = heightControllerCmOrFt.text.isNotEmpty
                              ? double.parse(heightControllerCmOrFt.text) /
                                    30.48
                              : 0.0;

                          final feet = current.toInt();

                          final inches = ((current - feet) * 12)
                              .toStringAsFixed(0);

                          heightControllerCmOrFt.text = feet.toString();
                          heightControllerInches.text = inches;
                        } else if (value == MeasurementUnit.metric) {
                          final cm = heightControllerCmOrFt.text.isNotEmpty
                              ? ((double.parse(heightControllerInches.text) +
                                            (double.parse(
                                                  heightControllerCmOrFt.text,
                                                ) *
                                                12)) *
                                        2.54)
                                    .toStringAsFixed(0)
                              : '';
                          heightControllerCmOrFt.text = cm;
                          heightControllerInches.clear();
                        }
                      }
                      measurementUnit.value = value;
                      welcomeController.setMeasurementUnit(value);
                    }
                  },
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(WelcomeStrings.height),
              ),
            ),
            Row(
              spacing: 10.0,
              children: [
                Expanded(
                  child: TextField(
                    controller: heightControllerCmOrFt,
                    textInputAction: TextInputAction.next,
                    onEditingComplete: () => FocusScope.of(context).nextFocus(),
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    decoration: InputDecoration(
                      labelText:
                          measurementUnit.value == MeasurementUnit.imperial
                          ? WelcomeStrings.feet
                          : WelcomeStrings.cm,
                      border: const OutlineInputBorder(),
                    ),
                  ),
                ),
                if (measurementUnit.value == MeasurementUnit.imperial) ...[
                  Expanded(
                    child: TextField(
                      controller: heightControllerInches,
                      textInputAction: TextInputAction.next,
                      onEditingComplete: () =>
                          FocusScope.of(context).nextFocus(),
                      // onChanged: (_) => {},
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: InputDecoration(
                        labelText: WelcomeStrings.inches,
                        border: const OutlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
}
