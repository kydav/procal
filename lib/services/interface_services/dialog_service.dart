import 'package:flutter/material.dart';
import 'package:procal/constants/strings.dart';
import 'package:procal/constants/system_strings.dart';
import 'package:procal/services/device_services/local_storage_service.dart';

class DialogService {
  DialogService({required this.storageService});

  final LocalStorageService storageService;

  Future<void> proteinCollectionDialog(
          BuildContext context, TextEditingController protein) async =>
      showAdaptiveDialog(
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
              ));
}
