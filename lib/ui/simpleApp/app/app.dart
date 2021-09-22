import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/Theme/app_colors.dart';
import 'package:the_movie_db/ui/simpleApp/auth/auth_model.dart';
import 'package:the_movie_db/ui/simpleApp/auth/auth_widgets.dart';
import 'package:the_movie_db/ui/simpleApp/filmScreen/film_screen_widget.dart';
import 'package:the_movie_db/ui/simpleApp/mainScreen/main_screen_widget.dart';

class AppStart extends StatelessWidget {
  AppStart();

  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          bottomNavigationBarTheme: BottomNavigationBarThemeData(
            backgroundColor: AppColors.mainDarkBlue,
            selectedItemColor: Colors.white,
            unselectedItemColor: Colors.grey,
          ),
          appBarTheme: const AppBarTheme(color: Color.fromRGBO(0, 0, 0, 1))),
      debugShowCheckedModeBanner: false,
      routes: <String, WidgetBuilder>{
        '/auth': (context) => AuthProvider(model:AuthModel(),child: const AuthWidget()),
        '/main_screen': (context) =>  MainScreenWidget(),
        '/main_screen/film_screen': (context){
          final id = ModalRoute.of(context)?.settings.arguments as int;
          if(id is int){
            return FilmScreen(movieId: id);
          }
          return FilmScreen(movieId: 0);
        },
      },
      initialRoute: '/auth',
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute<void>(builder: (context) {
          return Scaffold(
            body: Center(
              child:
              Text('Вот ты и попал во времена конца всего сущего(ошибка)'),
            ),
          );
        });
      },
    );
  }
}