// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../user_list.dart';

class UserListAdapter extends TypeAdapter<USerlist> {
  @override
  final int typeId = 1;

  @override
  USerlist read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return USerlist(
      users: fields[0] != null ? fields[0] as List<User> : [],
    );
  }

  @override
  void write(BinaryWriter writer, USerlist obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.users);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserListAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
