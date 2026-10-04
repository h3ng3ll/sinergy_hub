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

class SkillAdapter extends TypeAdapter<Skill> {
  @override
  final typeId = 7;

  @override
  Skill read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Skill(name: fields[0] as String);
  }

  @override
  void write(BinaryWriter writer, Skill obj) {
    writer
      ..writeByte(1)
      ..writeByte(0)
      ..write(obj.name);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SkillAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LikedYouQuotaAdapter extends TypeAdapter<LikedYouQuota> {
  @override
  final typeId = 8;

  @override
  LikedYouQuota read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedYouQuota(
      period: fields[0] == null
          ? ELikedYouQuotaPeriod.weekly
          : fields[0] as ELikedYouQuotaPeriod,
      limit: fields[1] == null ? 0 : (fields[1] as num).toInt(),
      used: fields[2] == null ? 0 : (fields[2] as num).toInt(),
      remaining: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      resetsAt: fields[4] as DateTime?,
      isUnlimited: fields[5] == null ? false : fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, LikedYouQuota obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.period)
      ..writeByte(1)
      ..write(obj.limit)
      ..writeByte(2)
      ..write(obj.used)
      ..writeByte(3)
      ..write(obj.remaining)
      ..writeByte(4)
      ..write(obj.resetsAt)
      ..writeByte(5)
      ..write(obj.isUnlimited);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedYouQuotaAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LikedYouItemAdapter extends TypeAdapter<LikedYouItem> {
  @override
  final typeId = 9;

  @override
  LikedYouItem read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedYouItem(
      likeId: fields[0] as String,
      likedAt: fields[1] as DateTime,
      isLocked: fields[2] as bool,
      imageState: fields[3] == null
          ? EImageState.none
          : fields[3] as EImageState,
      imageUrl: fields[4] as String?,
      uid: fields[5] as String?,
      firstName: fields[6] as String?,
      age: (fields[7] as num?)?.toInt(),
      specialization: fields[8] as ESpecialization?,
      experience: fields[9] as EExperience?,
      skills: fields[10] == null ? [] : (fields[10] as List).cast<Skill>(),
      city: fields[11] as String?,
      country: fields[12] as String?,
      distanceKm: (fields[13] as num?)?.toDouble(),
    );
  }

  @override
  void write(BinaryWriter writer, LikedYouItem obj) {
    writer
      ..writeByte(14)
      ..writeByte(0)
      ..write(obj.likeId)
      ..writeByte(1)
      ..write(obj.likedAt)
      ..writeByte(2)
      ..write(obj.isLocked)
      ..writeByte(3)
      ..write(obj.imageState)
      ..writeByte(4)
      ..write(obj.imageUrl)
      ..writeByte(5)
      ..write(obj.uid)
      ..writeByte(6)
      ..write(obj.firstName)
      ..writeByte(7)
      ..write(obj.age)
      ..writeByte(8)
      ..write(obj.specialization)
      ..writeByte(9)
      ..write(obj.experience)
      ..writeByte(10)
      ..write(obj.skills)
      ..writeByte(11)
      ..write(obj.city)
      ..writeByte(12)
      ..write(obj.country)
      ..writeByte(13)
      ..write(obj.distanceKm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedYouItemAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class LikedYouCacheAdapter extends TypeAdapter<LikedYouCache> {
  @override
  final typeId = 10;

  @override
  LikedYouCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return LikedYouCache(
      items: fields[0] == null ? [] : (fields[0] as List).cast<LikedYouItem>(),
      nextCursor: fields[1] as String?,
      hasMore: fields[2] == null ? true : fields[2] as bool,
      totalCount: fields[3] == null ? 0 : (fields[3] as num).toInt(),
      quota: fields[4] as LikedYouQuota?,
    );
  }

  @override
  void write(BinaryWriter writer, LikedYouCache obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.nextCursor)
      ..writeByte(2)
      ..write(obj.hasMore)
      ..writeByte(3)
      ..write(obj.totalCount)
      ..writeByte(4)
      ..write(obj.quota);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is LikedYouCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserLocationAdapter extends TypeAdapter<UserLocation> {
  @override
  final typeId = 11;

  @override
  UserLocation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserLocation(
      country: fields[0] as String?,
      city: fields[1] as String?,
      countryCode: fields[2] as String?,
      countryKey: fields[3] as String?,
      cityKey: fields[4] as String?,
      hasCoordinates: fields[5] == null ? false : fields[5] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, UserLocation obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.country)
      ..writeByte(1)
      ..write(obj.city)
      ..writeByte(2)
      ..write(obj.countryCode)
      ..writeByte(3)
      ..write(obj.countryKey)
      ..writeByte(4)
      ..write(obj.cityKey)
      ..writeByte(5)
      ..write(obj.hasCoordinates);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserLocationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserProfilerAdapter extends TypeAdapter<UserProfiler> {
  @override
  final typeId = 12;

  @override
  UserProfiler read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserProfiler(
      specialization: fields[0] as ESpecialization,
      role: fields[1] as ERole,
      experience: fields[2] as EExperience,
      searchingSpecializations: (fields[3] as List).cast<ESpecialization>(),
      skills: fields[4] == null ? [] : (fields[4] as List).cast<Skill>(),
    );
  }

  @override
  void write(BinaryWriter writer, UserProfiler obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.specialization)
      ..writeByte(1)
      ..write(obj.role)
      ..writeByte(2)
      ..write(obj.experience)
      ..writeByte(3)
      ..write(obj.searchingSpecializations)
      ..writeByte(4)
      ..write(obj.skills);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserProfilerAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class UserDataAdapter extends TypeAdapter<UserData> {
  @override
  final typeId = 13;

  @override
  UserData read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserData(
      uid: fields[0] as String,
      avatarUrl: fields[1] as String?,
      avatarPath: fields[2] as String?,
      firstName: fields[3] as String?,
      lastName: fields[4] as String?,
      age: (fields[5] as num?)?.toInt(),
      aboutMe: fields[6] as String?,
      profiler: fields[7] as UserProfiler,
      location: fields[8] as UserLocation?,
      createdAt: fields[9] as DateTime,
      isOnline: fields[10] == null ? false : fields[10] as bool,
      isDeleted: fields[11] == null ? false : fields[11] as bool,
      lastSeen: fields[12] as DateTime,
    );
  }

  @override
  void write(BinaryWriter writer, UserData obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.uid)
      ..writeByte(1)
      ..write(obj.avatarUrl)
      ..writeByte(2)
      ..write(obj.avatarPath)
      ..writeByte(3)
      ..write(obj.firstName)
      ..writeByte(4)
      ..write(obj.lastName)
      ..writeByte(5)
      ..write(obj.age)
      ..writeByte(6)
      ..write(obj.aboutMe)
      ..writeByte(7)
      ..write(obj.profiler)
      ..writeByte(8)
      ..write(obj.location)
      ..writeByte(9)
      ..write(obj.createdAt)
      ..writeByte(10)
      ..write(obj.isOnline)
      ..writeByte(11)
      ..write(obj.isDeleted)
      ..writeByte(12)
      ..write(obj.lastSeen);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserDataAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class DiscoveryDeckCacheAdapter extends TypeAdapter<DiscoveryDeckCache> {
  @override
  final typeId = 14;

  @override
  DiscoveryDeckCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DiscoveryDeckCache(
      items: fields[0] == null ? [] : (fields[0] as List).cast<UserData>(),
      hasMore: fields[1] == null ? true : fields[1] as bool,
      lastDocumentId: fields[2] as String?,
      cursor: fields[3] as String?,
      distancesKm: fields[4] == null
          ? {}
          : (fields[4] as Map).cast<String, double>(),
    );
  }

  @override
  void write(BinaryWriter writer, DiscoveryDeckCache obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.items)
      ..writeByte(1)
      ..write(obj.hasMore)
      ..writeByte(2)
      ..write(obj.lastDocumentId)
      ..writeByte(3)
      ..write(obj.cursor)
      ..writeByte(4)
      ..write(obj.distancesKm);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DiscoveryDeckCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

class BackgroundPaletteCacheAdapter
    extends TypeAdapter<BackgroundPaletteCache> {
  @override
  final typeId = 15;

  @override
  BackgroundPaletteCache read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BackgroundPaletteCache(
      primary: (fields[0] as num?)?.toInt(),
      secondary: (fields[1] as num?)?.toInt(),
    );
  }

  @override
  void write(BinaryWriter writer, BackgroundPaletteCache obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.primary)
      ..writeByte(1)
      ..write(obj.secondary);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BackgroundPaletteCacheAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
