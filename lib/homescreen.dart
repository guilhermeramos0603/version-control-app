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
  @override
  void initState() {
    _checkVersion();
    super.initState();
  }

  void _checkVersion() async {}

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
              showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return const UpdateDialogWidget(
                        description:
                            "Ops, parece que você não está na ultima versão do App. Clique abaixo para atualizar.",
                        appLink:
                            "https://play.google.com/store/apps/details?id=com.ulist&hl=pt_BR&gl=US&pli=1",
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
