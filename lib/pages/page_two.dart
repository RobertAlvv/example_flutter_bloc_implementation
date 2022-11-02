import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/bloc/printer_bloc.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final printerBloc = context.watch<PrinterBloc>();

    return Scaffold(
      appBar: AppBar(
        actions: [
          // BlocListener(listener: (_, __) {}),
          BlocBuilder<PrinterBloc, PrinterState>(builder: (context, state) {
            return state.connected
                ? const Icon(Icons.print)
                : const Icon(Icons.print_disabled);
          }),
          const Padding(padding: EdgeInsets.only(left: 20))
        ],
      ),
      body: Center(child: Text(printerBloc.state.name)),
    );
  }
}
