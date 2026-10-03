// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hive_adapters.dart';

// **************************************************************************
// AdaptersGenerator
// **************************************************************************

class AuthTempCredentialsAdapter extends TypeAdapter<AuthTempCredentials> {
  @override
  final typeId = 0;

  @override
  AuthTempCredentials read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AuthTempCredentials(
      firstName: fields[0] as String?,
      lastName: fields[1] as String?,
      email: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, AuthTempCredentials obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.firstName)
      ..writeByte(1)
      ..write(obj.lastName)
      ..writeByte(2)
      ..write(obj.email);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AuthTempCredentialsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChatMessageAdapter extends TypeAdapter<ChatMessage> {
  @override
  final typeId = 1;

  @override
  ChatMessage read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessage(
      id: fields[0] == null ? '' : fields[0] as String,
      message: fields[1] == null ? '' : fields[1] as String,
      sentUid: fields[2] == null ? '' : fields[2] as String,
      hasRead: fields[3] == null ? false : fields[3] as bool,
      createdAt: fields[4] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, ChatMessage obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.sentUid)
      ..writeByte(3)
      ..write(obj.hasRead)
      ..writeByte(4)
      ..write(obj.createdAt);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessageAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChatMessagesCacheAdapter extends TypeAdapter<ChatMessagesCache> {
  @override
  final typeId = 2;

  @override
  ChatMessagesCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatMessagesCache(
      chatId: fields[0] as String,
      messages: fields[1] == null
          ? []
          : (fields[1] as List).cast<ChatMessage>(),
      reachedStart: fields[2] == null ? false : fields[2] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, ChatMessagesCache obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.chatId)
      ..writeByte(1)
      ..write(obj.messages)
      ..writeByte(2)
      ..write(obj.reachedStart);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatMessagesCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
