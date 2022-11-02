part of 'printer_bloc.dart';

abstract class PrinterEvent extends Equatable {
  const PrinterEvent();

  @override
  List<Object> get props => [];
}

class OnPrinterChangeStatus extends PrinterEvent {
  final bool status;
  const OnPrinterChangeStatus(this.status);
}

class OnCallApi extends PrinterEvent {
  const OnCallApi();
}
