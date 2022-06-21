import '../../../modules/set_money/model/send_data_model.dart';
import '../../model/response/exception_responde.dart';
import '../../model/response/send_data_model.dart';
import '../../provider/http_client_interface.dart';
import '../send_data_repository_interface.dart';

class DataUserRepository implements IDataUserRepository {
  final IRestClient restClient;

  DataUserRepository(this.restClient);

  @override
  Future<DataModel> sendData(SendDataUser data) async {
    try {
      final response = await restClient.post(
          'https://api.rispar.com.br/acquisition/simulation', data.toJson());
      return DataModel.fromJson(response);
    } on ExceptionResponse catch (e) {
      throw ExceptionResponse(statusCode: e.statusCode, message: e.message);
    }
  }
}
