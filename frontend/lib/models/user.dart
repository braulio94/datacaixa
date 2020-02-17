import 'package:datacaixa/common/contants.dart' as c;

class User {
  int identifier;
  int hotelId;
  int userId;
  String username;
  String name;
  String password;
  String email;

  User();

  User.add({this.identifier, this.hotelId, this.userId, this.username,
      this.name, this.password, this.email});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      c.hotelId: hotelId,
      c.userId: userId,
      c.username: username,
      c.name: name,
      c.password: password,
      c.email: email,
    };
    if(identifier != null){
      map[c.identifier] = identifier;
    }
    return map;
  }

  User.fromMap(Map<String, dynamic> map){
    identifier = map[c.identifier];
    hotelId = map[c.hotelId];
    userId = map[c.userId];
    username = map[c.username];
    name = map[c.name];
    password = map[c.password];
    email = map[c.email];
  }

  factory User.fromJson(Map<String, dynamic> json) => User.add(
    hotelId: json["id_hotel"],
    userId: json["id_usuario"],
    username: json["usuario"],
    name: json["nome"],
    password: json["senha"],
    email: json["email"],
  );

  Map<String, dynamic> toJson() => {
    "id_hotel": hotelId,
    "id_usuario": userId,
    "usuario": username,
    "nome": name,
    "senha": password,
    "email": email,
  };

  @override
  String toString() {
    return 'User{identifier: $identifier, hotelId: $hotelId, userId: $userId, username: $username, name: $name, password: $password, email: $email}';
  }
}