abstract class ScanState{}
class InitialScanState extends ScanState{}
class LoadingScanState extends ScanState{}
class SuccessScanState extends ScanState{}
class ErrorScanState extends ScanState{
  final String error;
  ErrorScanState(this.error);
}