import 'package:rxdart/rxdart.dart';

class DataManager {
  // Объявляем BehaviorSubject'ы
  final BehaviorSubject<int> counterSubject = BehaviorSubject<int>.seeded(0);
  void dispose() {
    counterSubject.close();
  }
}
