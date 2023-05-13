import 'dart:async';

class WikiDeBouncer {
  Timer? _timer;

  void call(int milliseconds, void Function() callback) {
    dispose();
    _timer = Timer(Duration(milliseconds: milliseconds), callback);
  }

  void dispose() {
    _timer?.cancel();
    _timer = null;
  }
}
