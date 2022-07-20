import 'package:digitize_app_v1/models/User.dart';
import 'package:digitize_app_v1/providers/task_provider_header.dart';
import 'package:digitize_app_v1/resources/firestore_methods.dart';
import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/utils/utils.dart';
import 'package:digitize_app_v1/widgets/text_field_input_description.dart';
import 'package:digitize_app_v1/widgets/text_field_input_header.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/user_provider.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({Key? key}) : super(key: key);

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  int? _taskAns;

  final TextEditingController _taskHeaderController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  bool _isLoading = false;

  void clearTask() {
    setState(() {
      _taskAns = null;
      _taskDescriptionController.text = "";
      _taskHeaderController.text = "";
    });
  }

  @override
  void dispose() {
    super.dispose();
    _taskHeaderController.dispose();
    _taskDescriptionController.dispose();
  }

  void postTask(
    String uid,
    String email,
  ) async {
    setState(() {
      _isLoading = true;
    });
    try {
      String res = await FirestoreMethods().uploadTask(
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
        clearTask();
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

  _selectTask(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            title: const Text('Select'),
            children: [
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Task"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    _taskAns = 1;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Meet"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    _taskAns = null;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Event"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    _taskAns = null;
                  });
                },
              ),
              SimpleDialogOption(
                padding: const EdgeInsets.all(20),
                child: const Text("Poll"),
                onPressed: () async {
                  Navigator.of(context).pop();
                  setState(() {
                    _taskAns = null;
                  });
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final User user = Provider.of<UserProvider>(context).getUser;

    return _taskAns == null
        ? Center(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                  IconButton(
                    icon: const Icon(
                      Icons.add,
                      size: 35,
                      color: Color.fromARGB(255, 190, 190, 190),
                    ),
                    onPressed: () => _selectTask(context),
                  ),
                  Container(
                    height: 50,
                    width: double.infinity,
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      // color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Text(
                      "Add Task, Meet, Event, Poll",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                  Flexible(
                    flex: 1,
                    child: Container(),
                  ),
                ],
              ),
            ),
          )
        : Scaffold(
            appBar: AppBar(
              backgroundColor: mobileBackgroundColor,
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: secondaryColor,
                ),
                onPressed: clearTask,
              ),
              title: const Text(
                'Task',
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
                        onPressed: () => provider.notEmpty(
                                    _taskHeaderController,
                                    _taskDescriptionController) ==
                                true
                            ? postTask(user.uid, user.email)
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
                    textInputType: TextInputType.name,
                  ),
                ],
              ),
            ));
  }
}
