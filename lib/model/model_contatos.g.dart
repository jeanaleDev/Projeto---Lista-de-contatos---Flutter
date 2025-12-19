// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_contatos.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ModelContatosAdapter extends TypeAdapter<ModelContatos> {
  @override
  final int typeId = 0;

  @override
  ModelContatos read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ModelContatos(
      name: fields[0] as String,
      email: fields[1] as String,
      phone: fields[2] as String,
      photopath: fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ModelContatos obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.name)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.phone)
      ..writeByte(3)
      ..write(obj.photopath);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ModelContatosAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
