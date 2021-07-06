import 'package:hive/hive.dart';
part 'user_hive_model.g.dart';

@HiveType(typeId: 0)
class UserHive {
  @HiveField(0)
  final String token;
  @HiveField(1)
  final String fullName;
  @HiveField(2)
  final String email;
  @HiveField(3)
  final String type;
  @HiveField(4)
  final String profilePhoto;

  UserHive({
    required this.token,
    required this.fullName,
    required this.email,
    required this.type,
    required this.profilePhoto,
  });
}
