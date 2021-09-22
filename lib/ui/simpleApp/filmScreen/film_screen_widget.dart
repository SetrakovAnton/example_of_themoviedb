import 'package:the_movie_db/ui/Theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/simpleApp/widgets/customPaint.dart';
import 'package:the_movie_db/ui/simpleApp/widgets/imagesClass.dart';

class FilmScreen extends StatefulWidget {
  final int movieId;

  FilmScreen({
    Key? key,
    required this.movieId,
  }) : super(key: key);

  @override
  _FilmScreenState createState() => _FilmScreenState();
}

class _FilmScreenState extends State<FilmScreen> {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Форсаж 9'),
        centerTitle: true,
        backgroundColor: AppColors.mainDarkBlue,
      ),
      body: ColoredBox(
        color: Color.fromRGBO(24, 23, 27, 1),
        child: ListView(
          children: [
            Column(
              children: [
                Stack(
                  children: [
                    _Header(),
                    Padding(
                      padding: const EdgeInsets.only(top: 162),
                      child: Container(
                        color: Color.fromRGBO(24, 23, 27, 1),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 20),
                              child: _MovieName(),
                            ),
                            _Buttons(),
                            _Summery(),
                            _Description(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SerialCast(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  _Header({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 300,
          child: FittedBox(
            fit: BoxFit.fill,
            child: Image(
              image: AssetImage(AppImages.tree_1),
              height: 161,
            ),
          ),
        ),
        Positioned(
          top: 20,
          left: 20,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
            ),
            width: 81,
            height: 122,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Image(
                image: AssetImage(AppImages.tree_1),
                height: 161,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _MovieName extends StatelessWidget {
  _MovieName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      maxLines: 3,
      text: const TextSpan(
        children: [
          TextSpan(
            text: 'Форсаж 9',
            style: TextStyle(
              color: AppColors.textwhite,
              fontSize: 22,
              fontWeight: FontWeight.w600,
            ),
          ),
          TextSpan(
            text: ' (2021)',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}

class _Summery extends StatelessWidget {
  _Summery({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      color: Color.fromRGBO(23, 22, 21, 1),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5),
              Text(
                '|12+| 19/05/2021(RU)',
                style: TextStyle(
                  color: AppColors.textwhite,
                  fontSize: 16,
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.circle,
                color: AppColors.textwhite,
                size: 5,
              ),
              SizedBox(width: 5),
              Text(
                '2h 25m',
                style: TextStyle(
                  color: AppColors.textwhite,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {},
                child: Text(
                  'боевик',
                  style: TextStyle(
                    color: AppColors.textwhite,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'криминал',
                  style: TextStyle(
                    color: AppColors.textwhite,
                    fontSize: 16,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: const Text(
                  'триллер',
                  style: TextStyle(
                    color: AppColors.textwhite,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _Buttons extends StatelessWidget {
  _Buttons({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              SizedBox(
                width: 40,
                height: 40,
                child: RadialPercentWidget(
                  child: Text('72'),
                  percent: 0.72,
                  fillColor: Color.fromARGB(255, 10, 23, 25),
                  lineColor: Color.fromARGB(255, 37, 203, 103),
                  freeColor: Color.fromARGB(255, 25, 54, 31),
                  lineWidth: 3,
                ),
              ),
              SizedBox(width: 5),
              Text('Пользовательский счет',
                  style: TextStyle(
                    color: AppColors.textwhite,
                    fontSize: 16,
                  )),
            ],
          ),
        ),
        Container(
          color: Colors.grey,
          width: 1,
          height: 16,
        ),
        TextButton(
          onPressed: () {},
          child: Row(
            children: [
              Icon(
                Icons.play_arrow,
                color: AppColors.textwhite,
              ),
              Text('Воспроизвести',
                  style: TextStyle(
                    color: AppColors.textwhite,
                    fontSize: 16,
                  )),
            ],
          ),
        ),
      ],
    );
  }
}

class _Description extends StatelessWidget {
  _Description({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    const nameStyle = TextStyle(
      color: AppColors.textwhite,
      fontSize: 16,
      fontWeight: FontWeight.bold,
    );
    const jobStyle = TextStyle(
      color: AppColors.textwhite,
      fontSize: 16,
    );
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Быстрая семья навсегда',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 20,
              )),
          SizedBox(height: 10),
          Text('Обзор',
              style: TextStyle(
                color: AppColors.textwhite,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              )),
          SizedBox(height: 10),
          Text(
            'Времена меняются: Доминик Торетто залегает на дно и живет спокойной жизнью с семьей. Но судьба имеет на него другие планы.',
            style: TextStyle(
              color: AppColors.textwhite,
              fontSize: 16,
            ),
          ),
          SizedBox(height: 40),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Justin Lin',
                    style: nameStyle,
                  ),
                  const Text(
                    'Director,ScreenPlay,Story',
                    style: jobStyle,
                  ),
                ],
              ),
              //SizedBox(width:60),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Daniel Casey',
                    style: nameStyle,
                  ),
                  const Text(
                    'ScreenPlay,Story',
                    style: jobStyle,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Gary Scott Thompson',
                    style: nameStyle,
                  ),
                  const Text(
                    'Characters',
                    style: jobStyle,
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Alfredo Botello',
                    style: nameStyle,
                  ),
                  const Text(
                    'Story',
                    style: jobStyle,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SerialCast extends StatelessWidget {
  SerialCast({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    final characterName = [
      'Dominic Toretto',
      'Letty Ortiz',
      'Roman Pearce',
      'Tej Parker',
      'Jakob Toretto',
      'Ramsey',
      'Mia Toretto',
      'Han Lue',
      'Buddy',
    ];

    final realName = [
      'Vin Diesel',
      'Michelle Rodriguez',
      'Tyrese Gibson',
      'Ludacris',
      'John Cena',
      'Nathalie Emmanuel',
      'Jordana Brewster',
      'Sung Kang',
      'Michael Rooker',
    ];

    return ColoredBox(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              'В главных ролях',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          SizedBox(
            height: 250,
            child: Scrollbar(
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemExtent: 120,
                itemCount: realName.length,
                itemBuilder: (BuildContext context, int index) {
                  return Person(
                    characterName: characterName[index],
                    realName: realName[index],
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(3.0),
            child: TextButton(
                onPressed: () {},
                child: Text(
                  'Полный актерский и сьемочный состав',
                  style: TextStyle(color: Colors.black),
                )),
          ),
        ],
      ),
    );
  }
}

class Person extends StatelessWidget {
  final String characterName;
  final String realName;

  Person({Key? key, required this.characterName, required this.realName})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(
            color: Colors.black.withOpacity(0.2),
          ),
          borderRadius: BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1),
              blurRadius: 8,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
          clipBehavior: Clip.hardEdge,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              Image(
                image: AssetImage('images/Disel.png'),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      realName,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      characterName,
                      maxLines: 2,
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
