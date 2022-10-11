import 'package:context/controllers/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    nameController.text = (ref.read(usersProvider).user.name == "No Name")
        ? ""
        : ref.read(usersProvider).user.name;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Your Name"),
            controller: nameController,
          ),
          TextButton(
              onPressed: () {
                ref
                    .read(usersProvider.notifier)
                    .updateName(nameController.text);
              },
              child: const Text("Update")),
        ]),
      ),
    );
  }
}
