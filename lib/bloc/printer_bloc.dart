import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:blue_thermal_printer/blue_thermal_printer.dart';
import 'package:equatable/equatable.dart';

part 'printer_event.dart';
part 'printer_state.dart';

class PrinterBloc extends Bloc<PrinterEvent, PrinterState> {
  late StreamSubscription<int?> bluetoothSubscription;
  BlueThermalPrinter bluetooth = BlueThermalPrinter.instance;

  PrinterBloc() : super(const PrinterState()) {
    on<OnPrinterChangeStatus>(_changeStatus);
    on<OnCallApi>(_callApi);

    Timer.periodic(const Duration(seconds: 1), (_) {
      add(OnPrinterChangeStatus(!state.connected));
    });
  }

  _changeStatus(
    OnPrinterChangeStatus event,
    Emitter<PrinterState> emit,
  ) {
    emit(state.copyWith(connected: event.status));
  }

  _callApi(
    OnCallApi event,
    Emitter<PrinterState> emit,
  ) async {
    // final resp = await Service.getClient();
    // emit(state.copyWith(name: resp.name));
  }
}
