import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutterversioncontrol/widgets/update_dialog_widget.dart';
import 'package:new_version_plus/new_version_plus.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String storeAppVersion = "";
  String storeLink = "";
  @override
  void initState() {
    _checkVersion();
    super.initState();
  }

  Future<bool> _checkVersion() async {
    final newVersion = NewVersionPlus(
      androidId: "com.snapchat.android",
    );

    final status = await newVersion.getVersionStatus();

    if (status != null) {
      storeLink = status.appStoreLink;
      storeAppVersion = status.storeVersion;
      return false;
    }
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Checar Versão do App"),
      ),
      body: Center(
        child: GestureDetector(
          child: ElevatedButton(
            onPressed: () {
              _checkVersion();
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return UpdateDialogWidget(
                        version: storeAppVersion,
                        description:
                            "Ops, parece que você não está na ultima versão do App. Clique abaixo para atualizar.",
                        appLink: storeLink,
                        allowDismissal: false);
                  });
            },
            child: const Text("Checar Versão"),
          ),
        ),
      ),
    );
  }
}
