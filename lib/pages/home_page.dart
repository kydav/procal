import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/services/device_services/local_storage_service.dart';
import 'package:procal/theme.dart';
import 'package:procal/top_level_providers.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  Future<void> _showProteinDialog(
          BuildContext context,
          TextEditingController protein,
          LocalStorageService storageService) async =>
      WidgetsBinding.instance.addPostFrameCallback((_) => showAdaptiveDialog(
          context: context,
          builder: (context) => Dialog(
                insetPadding: const EdgeInsets.only(
                    left: 20, top: 100, right: 20, bottom: 100),
                child: Container(
                  padding: const EdgeInsets.only(
                      left: 30, top: 58, right: 30, bottom: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(Strings.dialogProteinGoal),
                      TextField(
                        textAlign: TextAlign.center,
                        keyboardType: TextInputType.number,
                        controller: protein,
                      ),
                      TextButton(
                        child: Text(Strings.generalSubmit),
                        onPressed: () {
                          storageService.storeValue(
                              SystemStrings.proteinGoal, protein.value.text);
                        },
                      )
                    ],
                  ),
                ),
              )));

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final protein = useState(0);
    final healthService = ref.read(healthServiceProvider);
    final storageService = ref.read(localStorageServiceProvider);
    final proteinConsumed = ref.watch(proteinConsumedProvider);
    final proteinGoal = ref.watch(proteinGoalProvider);
    useEffect(() {
      if (!storageService.checkValueExists(SystemStrings.proteinGoal)) {
        final protein = useTextEditingController();
        _showProteinDialog(context, protein, storageService);
      }

      return null;
    }, []);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Procal'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              width: 100,
              height: 100,
              child: Stack(
                children: [
                  SizedBox(
                    height: 100,
                    width: 100,
                    child: CircularProgressIndicator(
                      value: proteinConsumed! / proteinGoal!,
                      valueColor:
                          const AlwaysStoppedAnimation(ColorPalette.brandTwo),
                      backgroundColor: ColorPalette.brandTwo2,
                      strokeWidth: 10,
                      strokeCap: StrokeCap.round,
                    ),
                  ),
                  Align(
                    child: Text(
                      '$proteinConsumed / $proteinGoal',
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                          fontSize: 18,
                          color: ColorPalette.brandOne,
                          fontWeight: FontWeight.w700),
                    ),
                  )
                ],
              ),
            ),
            TextField(
              onChanged: (value) {
                if (int.tryParse(value) != null) {
                  protein.value = int.parse(value);
                }
              },
            ),
            TextButton(
                onPressed: () {
                  healthService.submitProtein(protein.value);
                },
                child: const Text('Submit')),
          ],
        ),
      ),
    );
  }
}
