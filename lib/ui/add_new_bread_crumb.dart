import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/bread_crumb.dart';
import '../services/bread_crumb_provider.dart';

class NewBreadCrumbWidget extends StatefulWidget {
  const NewBreadCrumbWidget({Key? key}) : super(key: key);

  @override
  State<NewBreadCrumbWidget> createState() => _NewBreadCrumbWidgetState();
}

class _NewBreadCrumbWidgetState extends State<NewBreadCrumbWidget> {
  late final TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add new bread crumb"),
      ),
      body: Column(
        children: [
          TextFormField(
            controller: _controller,
            decoration: const InputDecoration(
                hintText: "Enter a new bread crumb name"
            ),
          ),
          TextButton(
              onPressed: () {
                final text = _controller.text;
                if (text.isNotEmpty) {
                  final breadCrumb = BreadCrumb(isActive: false, name: text);
                  context.read<BreadCrumbProvider>().add(breadCrumb);
                  Navigator.of(context).pop();
                }
              },
              child: const Text("Add")),
        ],
      ),
    );
  }
}