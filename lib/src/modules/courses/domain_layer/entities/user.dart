import 'package:equatable/equatable.dart';
import 'package:learning/src/modules/courses/domain_layer/entities/ongoing_data.dart';

class AppUser extends Equatable {
  List<OnGoingData>? onGoingData;
  final String? name;

  AppUser({this.onGoingData, this.name}); // String uid;

  @override
  List<Object?> get props => [onGoingData, name];
}
