import 'dart:async';

class ViewModel<INTENT, STATE> {

  final _intentLiveData = StreamController<INTENT>.broadcast();

  final _stateLiveData = StreamController<STATE>.broadcast();

  void intents(Function(INTENT) listener) {
    _intentLiveData.stream.listen(listener);
  }

  void doIntent(INTENT intent) {
    _intentLiveData.add(intent);
  }

  void subscribe(Function(STATE) listener) {
    _stateLiveData.stream.listen(listener);
  }

  void publish(STATE state) {
    _stateLiveData.add(state);
  }
}
