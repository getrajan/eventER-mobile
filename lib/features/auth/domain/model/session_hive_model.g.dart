// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'session_hive_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SessionHiveAdapter extends TypeAdapter<SessionHive> {
  @override
  final int typeId = 1;

  @override
  SessionHive read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SessionHive(
      userId: fields[0] as String,
      token: fields[1] as String,
      verificationStatus: fields[3] as String,
      expiry: fields[2] as int,
    );
  }

  @override
  void write(BinaryWriter writer, SessionHive obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.token)
      ..writeByte(2)
      ..write(obj.expiry)
      ..writeByte(3)
      ..write(obj.verificationStatus);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SessionHiveAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
