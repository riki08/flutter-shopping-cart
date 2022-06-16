import 'package:k11/entities/user.dart';

import 'package:hive/hive.dart';

part 'hive/user_list.g.dart';

class USerlist {
  @HiveField(0)
  List<User> users;

  USerlist({
    required this.users,
  });

  factory USerlist.fromJson(Map<String, dynamic> json) => USerlist(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}
