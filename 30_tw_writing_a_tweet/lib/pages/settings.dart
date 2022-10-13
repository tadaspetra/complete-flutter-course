import 'dart:io';

import 'package:context/controllers/user_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    LocalUser currentUser = ref.watch(usersProvider);
    nameController.text = currentUser.user.name;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () async {
              XFile? pickedImage = await ImagePicker().pickImage(
                source: ImageSource.gallery,
                requestFullMetadata: false,
              );

              if (pickedImage != null) {
                ref.read(usersProvider.notifier).updateImage(
                      File(pickedImage.path),
                    );
              }
            },
            child: CircleAvatar(
              radius: 100,
              foregroundImage: NetworkImage(currentUser.user.profilePic),
            ),
          ),
          const Center(child: Text("Tap Image to Change")),
          const SizedBox(height: 40),
          TextFormField(
            decoration: const InputDecoration(hintText: "Enter Your Name"),
            controller: nameController,
          ),
          TextButton(
            onPressed: () {
              ref.read(usersProvider.notifier).updateName(nameController.text);
            },
            child: const Text("Update"),
          ),
        ]),
      ),
    );
  }
}
