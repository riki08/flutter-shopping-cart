import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:k11/home/bloc/home_bloc.dart';
import 'package:k11/home/widgets/item_product.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeBloc homeBloc;

  @override
  void initState() {
    homeBloc = BlocProvider.of<HomeBloc>(context);
    // homeBloc.add(GetData());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    final height = media.height;
    final width = media.width;
    return Scaffold(
      backgroundColor: const Color(0xff205CC0),
      body: SafeArea(
        child: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.status.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            return SizedBox(
              height: Size.infinite.height,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned(
                    top: 10,
                    left: 6,
                    child: GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: const Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.11,
                    child: Transform.rotate(
                      angle: 90.0,
                      child: Container(
                        width: width * 0.45,
                        height: height * 0.28,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(20),
                            color: Colors.white.withOpacity(0.1),
                            backgroundBlendMode: BlendMode.colorDodge,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white,
                                Colors.white.withOpacity(0.5),
                                Colors.white.withOpacity(0.2),
                                Colors.white.withOpacity(0.1),
                                Colors.white.withOpacity(0.05),
                              ],
                              radius: 0.8,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.white.withOpacity(0.1),
                                offset: const Offset(1, 1),
                                blurRadius: 10,
                              ),
                            ]),
                      ),
                    ),
                  ),
                  Positioned(
                    top: height * 0.13,
                    child: Container(
                      alignment: Alignment.center,
                      child: Image.asset(
                        'assets/home.png',
                        height: height * 0.25,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    child: Container(
                      width: width,
                      height: height * 0.52,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 8),
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.8),
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(50))),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 8),
                                decoration: BoxDecoration(
                                    color: const Color(0xff205CC0),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Row(
                                  children: const [
                                    Icon(
                                      Icons.star,
                                      color: Color(0xffC9A905),
                                    ),
                                    Text(
                                      '4.8',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                              const Text(
                                '\$ 20',
                                style: TextStyle(
                                    color: Color(0xffC9A905),
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Text(
                                'Beef Burger',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Icon(
                                    Icons.add_circle_outline_rounded,
                                    color: Color(0xff205CC0),
                                  ),
                                  SizedBox(width: 5),
                                  Text(
                                    '02',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 15,
                                        fontWeight: FontWeight.normal),
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.remove_circle_outline_outlined,
                                    color: Color(0xff205CC0),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          const Text(
                            'Big juicy burger with cheese lettuce \ntomato onions and special sauce',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 15,
                              color: Color(0xff727272),
                            ),
                          ),
                          SizedBox(
                            height: height * 0.03,
                          ),
                          const Text(
                            'Add ons',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: height * 0.01,
                          ),
                          SizedBox(
                            height: height * 0.1,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemCount: 4,
                              itemBuilder: (context, index) {
                                return const ItemProduct();
                              },
                            ),
                          ),
                          SizedBox(
                            height: height * 0.05,
                          ),
                          GestureDetector(
                            onTap: () =>
                                Navigator.of(context).pushNamed('users'),
                            child: Center(
                              child: Container(
                                alignment: Alignment.center,
                                width: width * 0.7,
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10, vertical: 10),
                                decoration: BoxDecoration(
                                  color: const Color(0xff205CC0),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: const Text(
                                  'Add to cart',
                                  style: TextStyle(
                                      fontSize: 28, color: Colors.white),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
