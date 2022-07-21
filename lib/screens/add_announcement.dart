import 'package:digitize_app_v1/models/User.dart';
import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/widgets/text_field_input_description.dart';
import 'package:digitize_app_v1/widgets/text_field_input_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/task_provider_header.dart';
import '../providers/user_provider.dart';
import '../resources/firestore_methods.dart';
import '../utils/utils.dart';

class AddAnnouncement extends StatefulWidget {
  const AddAnnouncement({Key? key}) : super(key: key);

  @override
  State<AddAnnouncement> createState() => _AddAnnouncementState();
}

class _AddAnnouncementState extends State<AddAnnouncement> {
  final TextEditingController _taskHeaderController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  bool _isLoading = false;

  void clearAnnouncement() {
    setState(() {
      _taskDescriptionController.text = "";
      _taskHeaderController.text = "";
      Navigator.pop(context);
    });
  }

  void postAnnouncement(
    String uid,
    String email,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadAnnouncement(
        _taskDescriptionController.text,
        _taskHeaderController.text,
        uid,
        email,
      );

      if (res == "success") {
        setState(() {
          _isLoading = false;
        });
        // ignore: use_build_context_synchronously
        showSnackBar("Posted", context);
        clearAnnouncement();
      } else {
        setState(() {
          _isLoading = false;
        });
        // ignore: use_build_context_synchronously
        showSnackBar(res, context);
      }
    } catch (err) {
      showSnackBar(err.toString(), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: mobileBackgroundColor,
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back,
              color: secondaryColor,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: const Text(
            'Announcement',
            style: TextStyle(color: secondaryColor),
          ),
          elevation: 0,
          centerTitle: true,
          actions: [
            ChangeNotifierProvider<TaskProvider>(
              create: (context) => TaskProvider(),
              child: Consumer<TaskProvider>(
                builder: (context, provider, child) {
                  return IconButton(
                    icon: const Icon(
                      Icons.check,
                      color: Colors.blueAccent,
                    ),
                    onPressed: () => provider.notEmpty(_taskHeaderController,
                                _taskDescriptionController) ==
                            true
                        ? postAnnouncement(user.uid, user.email)
                        : showSnackBar("Write Something", context),
                  );
                },
              ),
            ),
          ],
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _isLoading ? const LinearProgressIndicator() : Container(),
              TextFieldInputHeader(
                textEditingController: _taskHeaderController,
                hintText: "Title",
                textInputType: TextInputType.name,
              ),
              TextFieldInputDescription(
                textEditingController: _taskDescriptionController,
                hintText: "Description",
                textInputType: TextInputType.multiline,
              ),
            ],
          ),
        ));
  }
}
