import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k11/user-list/bloc/user_list_bloc.dart';
import 'package:k11/user-list/widgets/card_user.dart';

class UserListPage extends StatefulWidget {
  UserListPage({Key? key}) : super(key: key);

  @override
  State<UserListPage> createState() => _UserListPageState();
}

class _UserListPageState extends State<UserListPage> {
  late UserListBloc userListBloc;

  @override
  void initState() {
    userListBloc = BlocProvider.of<UserListBloc>(context);
    userListBloc.add(GetUsers());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final height = media.height;
    final width = media.width;
    var textStyle = const TextStyle(
        color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold);
    return Scaffold(
      backgroundColor: const Color(0xff205CC0),
      body: SafeArea(child: BlocBuilder<UserListBloc, UserListState>(
        builder: (context, state) {
          return state.status.isLoading
              ? const Center(child: CircularProgressIndicator())
              : Container(
                  padding: EdgeInsets.all(width * 0.1),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        child: Text(
                          'Lista de Usuarios',
                          style: textStyle.copyWith(fontSize: 30),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: height * 0.4,
                          child: state.users!.isNotEmpty
                              ? ListView.builder(
                                  itemCount: state.users!.length,
                                  itemBuilder: (context, index) {
                                    return CardUser(
                                        user: state.users![index],
                                        textStyle: textStyle);
                                  },
                                )
                              : Text(
                                  'No hay usuarios por el momento',
                                  style: textStyle,
                                ),
                        ),
                      ),
                      SizedBox(height: height * 0.1),
                      GestureDetector(
                        onTap: () => Navigator.of(context).pushNamed('users'),
                        child: Center(
                          child: Container(
                            alignment: Alignment.center,
                            width: width * 0.7,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 10, vertical: 10),
                            decoration: BoxDecoration(
                              color: Colors.white38,
                              borderRadius: BorderRadius.circular(15),
                            ),
                            child: const Text(
                              'Guardar usuarios',
                              style:
                                  TextStyle(fontSize: 28, color: Colors.black),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                );
        },
      )),
    );
  }
}
