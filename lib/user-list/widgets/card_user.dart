import 'package:flutter/material.dart';
import 'package:k11/entities/user.dart';

class CardUser extends StatelessWidget {
  const CardUser({
    Key? key,
    required this.user,
    required this.textStyle,
  }) : super(key: key);

  final User user;
  final TextStyle textStyle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () =>
          Navigator.of(context).pushNamed('details', arguments: {"user": user}),
      child: Card(
        color: Colors.white24,
        shape: ContinuousRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 0,
        child: ListTile(
          leading: CircleAvatar(
              radius: 20,
              child: Image.network(
                user.avatar,
              )),
          title: Text(
            '${user.firstName} ${user.lastName}',
            style: textStyle,
          ),
          subtitle: Text(
            user.email,
            style:
                textStyle.copyWith(fontSize: 15, fontWeight: FontWeight.normal),
          ),
        ),
      ),
    );
  }
}
