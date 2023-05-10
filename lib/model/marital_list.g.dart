// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marital_list.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FamilyStatusAdapter extends TypeAdapter<FamilyStatus> {
  @override
  final int typeId = 0;

  @override
  FamilyStatus read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FamilyStatus(
      id: fields[0] as int?,
      value: fields[1] as String?,
      labelType: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, FamilyStatus obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.value)
      ..writeByte(2)
      ..write(obj.labelType);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is FamilyStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
