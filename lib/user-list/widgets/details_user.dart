import 'package:flutter/material.dart';
import 'package:k11/entities/user.dart';

class DetailsUser extends StatefulWidget {
  const DetailsUser({Key? key}) : super(key: key);

  @override
  State<DetailsUser> createState() => _DetailsUserState();
}

class _DetailsUserState extends State<DetailsUser> {
  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final height = media.height;
    final width = media.width;
    var textStyle = const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    final arguments = (ModalRoute.of(this.context)?.settings.arguments ??
        <String, dynamic>{}) as Map;
    final User user = arguments['user'];
    print(user.avatar);
    return Scaffold(
      backgroundColor: const Color(0xff205CC0),
      body: Container(
        padding: EdgeInsets.all(width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: height * 0.3,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  // borderRadius: BorderRadius.circular(100),
                  image: DecorationImage(
                      image: NetworkImage(user.avatar), fit: BoxFit.contain)),
            ),
            SizedBox(height: height * 0.05),
            Row(
              children: [
                Text(
                  'Nombre: ',
                  style: textStyle,
                ),
                Text(
                  user.firstName,
                  style: textStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  'Apellidos: ',
                  style: textStyle,
                ),
                Text(
                  user.lastName,
                  style: textStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
            SizedBox(height: height * 0.02),
            Row(
              children: [
                Text(
                  'Correo: ',
                  style: textStyle,
                ),
                Text(
                  user.email,
                  style: textStyle.copyWith(
                      fontSize: 15, fontWeight: FontWeight.normal),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
