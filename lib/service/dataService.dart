import "package:fitness_app/db/repository.dart";
import "package:fitness_app/model/list.dart";

class DataService
{
  late Repository _repository;
  DataService(){
    _repository = Repository();
  }
  //Save User
  SaveData(ModelList data) async{
    return await _repository.insertData('fitnessData', data.listMap());
  }
  //Read All Users
  readAllData() async{
    return await _repository.readData('fitnessData');
  }

  deleteData(dataId) async {
    return await _repository.deleteDataById('fitnessData', dataId);
  }

}