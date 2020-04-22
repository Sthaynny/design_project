import 'package:design_project/screens/home/home_repository.dart';
import 'package:design_project/shared/models/contact_model.dart';
import 'package:rxdart/rxdart.dart';

class HomeBloc {
  final HomeRepository repository;

  HomeBloc(this.repository) {
    contactsOut = _contact.stream;
    _contactsIn = _contact.sink;
  }

  //? Strems

  var _contact = BehaviorSubject<List<ContactModel>>();

  Observable<List<ContactModel>> contactsOut;

  Sink<List<ContactModel>> _contactsIn;

  Future<void> getContacts() async {
    try {
      var response = await repository.getContacts();
      _contactsIn.add(response);
    } catch (e) {
      _contact.addError(e);
    }
  }

  void dispose() {
    _contact.close();
    _contactsIn.close();
  }
}
