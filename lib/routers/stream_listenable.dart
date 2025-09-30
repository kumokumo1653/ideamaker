import 'dart:async';

import 'package:flutter/widgets.dart';

class StreamListenable extends ChangeNotifier {
  StreamListenable(Stream<dynamic> stream) : _stream = stream {
    _subscription = _stream.listen((_) {
      notifyListeners();
    });
  }
  final Stream<dynamic> _stream;
  late final StreamSubscription<dynamic> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }
}
