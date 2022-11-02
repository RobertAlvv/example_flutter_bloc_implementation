import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/printer_bloc.dart';
import 'package:flutter_bloc_example/pages/page_two.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [BlocProvider(create: (_) => PrinterBloc())],
        child: const MaterialApp(
          title: 'Material App',
          debugShowCheckedModeBanner: false,
          home: MyHome(),
        ));
  }
}

class MyHome extends StatelessWidget {
  const MyHome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final printerBloc = context.watch<PrinterBloc>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: Center(
          child: BlocSelector<PrinterBloc, PrinterState, bool>(
            selector: (state) => state.connected,
            builder: (context, state) {
              return Text(
                '$state',
                style: const TextStyle(fontSize: 40),
              );
            },
          ),
        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => const PageTwo())),
          label: const Text("Page Two"),
        ),
      ),
    );
  }
}
