import 'package:hive/hive.dart';

part 'session_hive_model.g.dart';

@HiveType(typeId: 1)
class SessionHive {
  @HiveField(0)
  final String userId;
  @HiveField(1)
  final String token;
  @HiveField(2)
  final int expiry;
  @HiveField(3)
  final String verificationStatus;

  SessionHive({
    required this.userId,
    required this.token,
    required this.verificationStatus,
    required this.expiry,
  });
}
