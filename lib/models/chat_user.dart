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
  late bool isOnline;
  late String image;
  late String pushToken;
  late String lastActive;
  late String name;
  late String id;
  late String email;
  late String status;

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