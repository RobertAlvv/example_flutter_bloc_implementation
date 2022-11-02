part of 'printer_bloc.dart';

class PrinterState extends Equatable {
  const PrinterState({
    this.connected = false,
    this.name = "Jorge",
  });

  final bool connected;
  final String name;

  PrinterState copyWith({
    bool? connected,
    String? name,
  }) =>
      PrinterState(
        connected: connected ?? this.connected,
        name: name ?? this.name,
      );

  @override
  List<Object> get props => [connected, name];
}
