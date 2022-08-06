import 'package:digitize_app_v1/models/User.dart';
import 'package:digitize_app_v1/providers/task_provider_header.dart';
import 'package:digitize_app_v1/resources/firestore_methods.dart';
import 'package:digitize_app_v1/screens/add_announcement.dart';
import 'package:digitize_app_v1/utils/colors.dart';
import 'package:digitize_app_v1/utils/utils.dart';
import 'package:digitize_app_v1/widgets/text_field_input_description.dart';
import 'package:digitize_app_v1/widgets/text_field_input_header.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../providers/user_provider.dart';

class AddTask extends StatefulWidget {
  const AddTask({Key? key}) : super(key: key);

  @override
  State<AddTask> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTask> {
  int? daysLeft = 0;
  late DateTime date;
  DateTime _dateTime = DateTime.now();
  final TextEditingController _taskHeaderController = TextEditingController();
  final TextEditingController _taskDescriptionController =
      TextEditingController();

  bool _isLoading = false;

  void clearTask() {
    setState(() {
      _taskDescriptionController.text = "";
      _taskHeaderController.text = "";
      _dateTime = DateTime.now();
      Navigator.pop(context);
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
        daysLeft!,
        date,
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
                    onPressed: () => provider.notEmpty(_taskHeaderController,
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
                textInputType: TextInputType.multiline,
              ),
              InkWell(
                onTap: () async {
                  DateTime? newDate = await showDatePicker(
                    context: context,
                    initialDate: _dateTime,
                    firstDate: DateTime(2022),
                    lastDate: DateTime(2025),
                  );
                  if (newDate == null) return;

                  setState(() {
                    _dateTime = newDate;
                    final diff = newDate.difference(DateTime.now()).inDays;
                    daysLeft = diff;
                    date = _dateTime;
                  });
                },
                child: Container(
                    padding: const EdgeInsets.only(left: 20),
                    alignment: Alignment.centerLeft,
                    width: double.infinity,
                    height: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Row(
                      children: [
                        const Text(
                          "DeadLine : ",
                          style: TextStyle(
                              fontFamily: 'Opensans',
                              fontSize: 18,
                              color: Colors.grey,
                              fontWeight: FontWeight.normal),
                        ),
                        Text(
                          DateFormat('MMM ').format(_dateTime),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black87,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          DateFormat('d').format(_dateTime),
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          ", in $daysLeft Days",
                          style: const TextStyle(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    )),
              ),
            ],
          ),
        ));
  }
}
