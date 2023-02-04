import 'package:flutter/material.dart';
import 'package:vistamovil/screens/componentes/login.dart';
import 'ContentBoarding.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {  
  final PageController _controller = PageController(initialPage: 0);
  int currentePage = 0;
  List<Map<String, String>> listBoarding = [
    {
      "tittle": "TIENDA",
      "text": "¡TIENDA DE MASCOTAS!",
      "image": "assets/images/B5.png"
    },
    {
      "tittle": "VETERINARIA",
      "text": "SERVICIO VETERINARIO",
      "image": "assets/images/B4.png"
    },
    {
      "tittle": "HOSPITALIDAD",
      "text": "HOSPITALIDAD DE MASCOTAS",
      "image": "assets/images/B3.png"
    },
    {
      "tittle": "ADOPCION",
      "text": "Servicios de Adopcion",
      "image": "assets/images/B2.png"
    },
    {
      "tittle": "ESPARCIMIENTO",
      "text": "Servicio de espacimiento",
      "image": "assets/images/B1.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(children: [
          Expanded(
            flex: 1,
            child: PageView.builder(
              controller: _controller,
              onPageChanged: (value) {
                setState(() {
                  currentePage = value;
                });
              },
              itemBuilder: (context, index) => ContentBoarding(
                tittle: listBoarding[index]["tittle"],
                text: listBoarding[index]["text"],
                image: listBoarding[index]["image"],
              ),
              itemCount: listBoarding.length,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 60.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(
                    listBoarding.length,
                    (index) => pages(index: index, currentePage:currentePage),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(199, 255, 255, 255),
                            minimumSize: const Size.fromHeight(50),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            side: BorderSide(color: Colors.green, width: 3)
                          ),
                          child: Text(
                            "Siguiente",
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 25,
                            ),
                          ),
                          onPressed: () {
                            setState(() {
                              if (currentePage == listBoarding.length - 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (_) => Login(),)
                                );
                              }
                              currentePage = currentePage + 1;
                              _controller.nextPage(
                                duration: (Duration(milliseconds: 500)),
                                curve: Curves.easeIn);
                            });
                          },
                      )
                    ),
                  ],
                  )
              ],
           //   new RaisedButton (),
            ),
          ),
        ]),
      ),
    );
  }
}

AnimatedContainer pages({required int index, required int currentePage }) {
  return AnimatedContainer(
    margin: EdgeInsets.only(right: 5),
    decoration: currentePage == index? BoxDecoration(color: Colors.amber):BoxDecoration(color: Colors.grey),
      width: currentePage == index? 40: 20, 
      height: 10,
       duration: kThemeAnimationDuration);
}
