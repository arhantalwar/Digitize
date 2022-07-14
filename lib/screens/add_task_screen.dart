import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/widgets/text_field_input_description.dart';
import 'package:digitize_app_v1/widgets/text_field_input_header.dart';
import 'package:flutter/material.dart';

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

  @override
  void dispose() {
    super.dispose();
    _taskHeaderController.dispose();
    _taskDescriptionController.dispose();
  }

  void postTask() {}

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
                child: const Text("Event"),
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
    return _taskAns == null
        ? Center(
            child: IconButton(
              icon: const Icon(Icons.upload),
              onPressed: () => _selectTask(context),
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
                onPressed: () {
                  setState(() {
                    _taskAns = null;
                  });
                },
              ),
              title: const Text(
                'Task',
                style: TextStyle(color: secondaryColor),
              ),
              elevation: 0,
              centerTitle: true,
              actions: [
                IconButton(
                  icon: const Icon(
                    Icons.check,
                    color: Colors.blueAccent,
                  ),
                  onPressed: postTask,
                ),
              ],
            ),
            body: Container(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
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
