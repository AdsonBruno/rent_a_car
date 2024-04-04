import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:rental_of_vehicle/views/on_boarding/content_model.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  final PageController _controller = PageController(initialPage: 0);
  final unboardingContent = ContentModel.contents;
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF04662b),
      body: PageView.builder(
        controller: _controller,
        itemCount: unboardingContent.length,
        onPageChanged: (int index) {
          setState(() {
            currentIndex = index;
          });
        },
        itemBuilder: (_, i) {
          return Padding(
            padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
            child: Column(
              children: [
                SizedBox(
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    child: Image.asset(
                      unboardingContent[i].image,
                      height: MediaQuery.of(context).size.height * 0.72,
                      width: 400,
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.014),
                  child: Text(
                    unboardingContent[i].title,
                    style: GoogleFonts.inter(
                        fontSize: 20,
                        fontWeight: FontWeight.w800,
                        color: const Color(0xFFCCCCCC)),
                  ),
                ),
                Center(
                  child: Text(
                    unboardingContent[i].description,
                    style: GoogleFonts.inter(
                      color: const Color(0xFFFFFFFF),
                      fontSize: 15,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    color: const Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.circular(25),
                  ),
                  height: MediaQuery.of(context).size.height * 0.090,
                  margin: const EdgeInsets.only(top: 21),
                  width: MediaQuery.of(context).size.width * 0.6,
                  child: TextButton(
                    onPressed: () {
                      if (currentIndex == unboardingContent.length - 1) {
                      } else {
                        _controller.nextPage(
                            duration: const Duration(milliseconds: 200),
                            curve: Curves.ease);
                      }
                    },
                    child: Text(
                      currentIndex == unboardingContent.length - 1
                          ? 'Continuar'
                          : 'Próximo',
                      style: const TextStyle(
                        color: Color(0xFF004B34),
                        fontSize: 20,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

// import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:rental_of_vehicle/views/on_boarding/content_model.dart';

// class OnBoarding extends StatefulWidget {
//   const OnBoarding({Key? key}) : super(key: key);

//   @override
//   State<OnBoarding> createState() => _OnBoardingState();
// }

// class _OnBoardingState extends State<OnBoarding> {
//   final PageController _controller = PageController(initialPage: 0);

//   @override
//   void initState() {
//     super.initState();
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: const Color(0xFF04662b),
//       body: PageView.builder(
//         controller: _controller,
//         itemCount: contents.length,
//         itemBuilder: (_, i) {
//           return Padding(
//             padding: const EdgeInsets.only(top: 20, right: 10, left: 10),
//             child: Column(
//               children: [
//                 SizedBox(
//                   child: ClipRRect(
//                     borderRadius: const BorderRadius.all(Radius.circular(20)),
//                     child: Image.asset(
//                       contents[i].image,
//                       height: MediaQuery.of(context).size.height * 0.72,
//                       width: 400,
//                       fit: BoxFit.fill,
//                     ),
//                   ),
//                 ),
//                 Padding(
//                   padding: EdgeInsets.only(
//                       bottom: MediaQuery.of(context).size.height * 0.014),
//                   child: Text(
//                     contents[i].title,
//                     style: GoogleFonts.inter(
//                       fontSize: 20,
//                       fontWeight: FontWeight.w800,
//                       color: const Color(0xFFCCCCCC),
//                     ),
//                   ),
//                 ),
//                 Center(
//                   child: Text(
//                     contents[i].description,
//                     style: GoogleFonts.inter(
//                       color: const Color(0xFFFFFFFF),
//                       fontSize: 15,
//                     ),
//                     textAlign: TextAlign.center,
//                   ),
//                 ),
//                 Container(
//                   decoration: BoxDecoration(
//                     color: const Color(0xFFFFFFFF),
//                     borderRadius: BorderRadius.circular(25),
//                   ),
//                   height: MediaQuery.of(context).size.height * 0.090,
//                   margin: const EdgeInsets.only(top: 21),
//                   width: MediaQuery.of(context).size.width * 0.6,
//                   child: TextButton(
//                     onPressed: () {
//                       if (i == contents.length - 1) {
//                         // Última página, faça algo, como navegar para outra tela
//                         // Navigator.push(context, MaterialPageRoute(builder: (context) => OutraTela()));
//                       } else {
//                         // Próxima página
//                         _controller.nextPage(
//                           duration: Duration(milliseconds: 300),
//                           curve: Curves.ease,
//                         );
//                       }
//                     },
//                     child: Text(
//                       i == contents.length - 1 ? 'Continuar' : 'Próximo',
//                       style: const TextStyle(
//                         color: Color(0xFF004B34),
//                         fontSize: 20,
//                       ),
//                     ),
//                   ),
//                 )
//               ],
//             ),
//           );
//         },
//       ),
//     );
//   }
// }
