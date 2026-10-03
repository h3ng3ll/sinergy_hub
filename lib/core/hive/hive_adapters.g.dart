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

class ChatConfigAdapter extends TypeAdapter<ChatConfig> {
  @override
  final typeId = 3;

  @override
  ChatConfig read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatConfig(
      archived: fields[0] == null ? [] : (fields[0] as List).cast<String>(),
      favorite: fields[1] == null ? [] : (fields[1] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatConfig obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.archived)
      ..writeByte(1)
      ..write(obj.favorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatConfigAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ParticipantInfoAdapter extends TypeAdapter<ParticipantInfo> {
  @override
  final typeId = 4;

  @override
  ParticipantInfo read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ParticipantInfo(
      id: fields[0] == null ? '' : fields[0] as String,
      name: fields[1] == null ? '' : fields[1] as String,
      avatarUrl: fields[2] as String?,
      specialization: fields[3] == null ? '' : fields[3] as String,
    );
  }

  @override
  void write(BinaryWriter writer, ParticipantInfo obj) {
    writer
      ..writeByte(4)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.avatarUrl)
      ..writeByte(3)
      ..write(obj.specialization);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ParticipantInfoAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChatAdapter extends TypeAdapter<Chat> {
  @override
  final typeId = 5;

  @override
  Chat read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Chat(
      chatId: fields[0] == null ? '' : fields[0] as String,
      lastMessage: fields[1] == null ? '' : fields[1] as String,
      lastMessageSent: fields[2] as DateTime,
      lastMessageSentBy: fields[3] == null ? '' : fields[3] as String,
      config: fields[4] as ChatConfig,
      typingUsers: fields[5] == null ? [] : (fields[5] as List).cast<String>(),
      participantInfo: fields[6] == null
          ? {}
          : (fields[6] as Map).cast<String, ParticipantInfo>(),
      blocked: fields[7] == null ? {} : (fields[7] as Map).cast<String, bool>(),
      participants: (fields[8] as List).cast<String>(),
      createdAt: fields[9] as DateTime,
      icon: fields[10] == null ? '' : fields[10] as String,
      searchKeywords: fields[11] == null
          ? []
          : (fields[11] as List).cast<String>(),
    );
  }

  @override
  void write(BinaryWriter writer, Chat obj) {
    writer
      ..writeByte(12)
      ..writeByte(0)
      ..write(obj.chatId)
      ..writeByte(1)
      ..write(obj.lastMessage)
      ..writeByte(2)
      ..write(obj.lastMessageSent)
      ..writeByte(3)
      ..write(obj.lastMessageSentBy)
      ..writeByte(4)
      ..write(obj.config)
      ..writeByte(5)
      ..write(obj.typingUsers)
      ..writeByte(6)
      ..write(obj.participantInfo)
      ..writeByte(7)
      ..write(obj.blocked)
      ..writeByte(8)
      ..write(obj.participants)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.icon)
      ..writeByte(11)
      ..write(obj.searchKeywords);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class ChatsCacheAdapter extends TypeAdapter<ChatsCache> {
  @override
  final typeId = 6;

  @override
  ChatsCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ChatsCache(
      chats: fields[0] == null ? [] : (fields[0] as List).cast<Chat>(),
    );
  }

  @override
  void write(BinaryWriter writer, ChatsCache obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.chats);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChatsCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
