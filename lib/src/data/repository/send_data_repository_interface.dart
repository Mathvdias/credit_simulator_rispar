import '../../modules/set_money/model/send_data_model.dart';
import '../model/response/send_data_model.dart';

abstract class IDataUserRepository {
  Future<DataModel> sendData(SendDataUser data);
}
