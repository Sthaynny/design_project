import 'package:design_project/shared/models/contact_model.dart';
import 'package:design_project/shared/services/custom_dio/custom_dio.dart';

class HomeRepository {
  final CustomDio cliente;

  HomeRepository(this.cliente);
  Future<List<ContactModel>> getContacts() async {
    var response = await cliente.get("/photos");
    return (response.data as List).map((i) => ContactModel.fromJson()).toList();
  }
}
