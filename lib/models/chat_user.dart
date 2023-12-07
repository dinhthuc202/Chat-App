class ChatUser {
  ChatUser({
    required this.isOnline,
    required this.image,
    required this.pushToken,
    required this.lastActive,
    required this.name,
    required this.id,
    required this.email,
    required this.status,
  });
  late final bool isOnline;
  late final String image;
  late final String pushToken;
  late final String lastActive;
  late final String name;
  late final String id;
  late final String email;
  late final String status;

  ChatUser.fromJson(Map<String, dynamic> json){
    isOnline = json['is_Online'] ?? false;
    image = json['image'] ?? '';
    pushToken = json['push_Token'] ?? '';
    lastActive = json['last_Active'] ?? '';
    name = json['name'] ?? '';
    id = json['id'] ?? '';
    email = json['email'] ?? '';
    status = json['status'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['is_Online'] = isOnline;
    data['image'] = image;
    data['push_Token'] = pushToken;
    data['last_Active'] = lastActive;
    data['name'] = name;
    data['id'] = id;
    data['email'] = email;
    data['status'] = status;
    return data;
  }
}