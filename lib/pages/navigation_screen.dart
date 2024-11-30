import 'package:e_commerce/bloc/fav_cubit/fav_cubit.dart';
import 'package:e_commerce/pages/chat_screen.dart';
import 'package:e_commerce/pages/fav_screen.dart';
import 'package:e_commerce/pages/home_screen.dart';
import 'package:e_commerce/pages/my_account_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int currentIndex = 0;

@override
  void initState() {
    // TODO: implement initState
    super.initState();

    // BlocProvider.of<FavCubit>(context).getFavCubit();
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FavCubit, FavState>(
      builder: (context, state) {
        return Scaffold(
            body: IndexedStack(
                index: currentIndex,
                children: const [HomeScreen(), FavScreen(),ChatScreen(), MyAccountScreen()
                
                
                ]),
            bottomNavigationBar: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    offset: Offset(0, -1),
                    blurRadius: 10,
                  ),
                ],
              ),
              child: BottomNavigationBar(
                selectedLabelStyle: GoogleFonts.cabin(fontSize: 18),
                unselectedLabelStyle: GoogleFonts.cabin(fontSize: 17),
                fixedColor: Colors.blue,
                unselectedFontSize: 16,
                selectedFontSize: 18,
                currentIndex: currentIndex,
                type:BottomNavigationBarType.fixed ,
                onTap: (value) {
                  currentIndex = value;
                  setState(() {});
                },
                backgroundColor: Colors.white,
                items: const [
                  BottomNavigationBarItem(
                    icon: Icon(Icons.home),
                    label: 'الرئيسية',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.favorite),
                    label: 'المفضلة',
                  ),
                    BottomNavigationBarItem(
                    icon: Icon(Icons.chat),
                    label: 'الدردشة',
                  ),
                  BottomNavigationBarItem(
                    icon: Icon(Icons.person),
                    label: 'حسابي',
                  ),
                ],
              ),
            ));
      },
    );
  }
}
