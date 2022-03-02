import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/bread_crumb_provider.dart';
import 'ui/add_new_bread_crumb.dart';
import 'ui/bread_crumb_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => BreadCrumbProvider(),
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
        routes: {
          '/new': (context) => const NewBreadCrumbWidget(),
        },
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // const SizedBox(height: 6,),
          Consumer<BreadCrumbProvider>(
            builder: (context, value, child) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: BreadCrumbWidget(breadCrumbs: value.items, onBreadCrumbTapped: (value) {

                }),
              );
            },
          ),
          Center(
            child: TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/new');
              },
              child: const Text("Add new bread crumb"),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                context.read<BreadCrumbProvider>().reset();
              },
              child: const Text("Reset"),
            ),
          ),
        ],
      ),
    );
  }
}








