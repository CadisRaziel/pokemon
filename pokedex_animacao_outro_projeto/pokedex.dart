import 'package:flutter/material.dart';

class Pokedex extends StatefulWidget {
  final Widget child;
  const Pokedex({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 1.7,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                //*BorderRadius.only -> coloca borda apenas nas laterais de cima !!
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
              image: DecorationImage(
                  image: AssetImage(
                    'assets/pokedex_cima.png',
                  ),
                  fit: BoxFit.cover),
            ),
          ),
        ),

        AnimatedContainer(
          height: isExpanded
              ? MediaQuery.of(context).size.height -
                  (2 * MediaQuery.of(context).size.width / 1.7)
              : 0,
          // height: isExpanded ? MediaQuery.of(context).size.width / 1.01 : 0,

          duration: const Duration(seconds: 1),
          child: widget.child,
        ),

        //*RotatedBox -> Gira a imagem !!!
        RotatedBox(
          quarterTurns: 2,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isExpanded = !isExpanded;
              });
            },
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width / 1.7,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  //*BorderRadius.only -> coloca borda apenas nas laterais de cima !!
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                image: DecorationImage(
                    image: AssetImage(
                      'assets/pokedex_cima.png',
                    ),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        )
      ],
    );
  }
}
