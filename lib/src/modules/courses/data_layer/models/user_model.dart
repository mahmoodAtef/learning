import 'package:learning/src/modules/courses/data_layer/models/ongoing_data_model.dart';

import '../../domain_layer/entities/ongoing_data.dart';
import '../../domain_layer/entities/user.dart';

class UserModel extends AppUser
{
  UserModel({  String  ? name , List  <OnGoingData>  ? onGoingData }) : super(name : name, onGoingData: onGoingData);
 factory UserModel.fromJson (Map<String, dynamic>  json )
 {
   List ? maps = json['ongoing']! as List ;
   List <OnGoingData> data = [];
   maps.forEach((element) {
     data.add(OnGoingDataModel.fromJson(element));
   });
   return UserModel (name: json ["name"],
 onGoingData: data  );
 }
}