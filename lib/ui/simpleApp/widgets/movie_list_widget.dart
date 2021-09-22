import 'package:flutter/material.dart';
import 'package:the_movie_db/ui/simpleApp/widgets/imagesClass.dart';

class Movie {
  final imageOfMovie = AppImages.tree_1;
  final int id;
  final String nameOfMovie;
  final String dataOfMovie;
  final String descriptionOfMovie;

  Movie({
    required this.id,
    required this.nameOfMovie,
    required this.dataOfMovie,
    required this.descriptionOfMovie,
  });
}

class MovieList extends StatefulWidget {
  MovieList({Key? key}) : super(key: key);

  @override
  _MovieListState createState() => _MovieListState();
}

class _MovieListState extends State<MovieList> {
  final listOfNames = [
    'Форсаж 9',
    'Космический джем: Новое поколение',
    'Черная вдова',
    'Судная ночь навсегда',
    'Босс-молокосос 2',
    'Лука',
    'Война будущего',
    'Круиз по джунглям',
    'El exorcismo de Carmen Farías',
    'Бесконечность',
  ];

  final _movies = [
    Movie(
      id: 1,
      nameOfMovie: 'Форсаж 9',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie:
          'Времена меняются: Доминик Торетто залегает на дно и живет спокойной жизнью с семьей. Но судьба имеет на него другие планы.',
    ),
    Movie(
      id: 2,
      nameOfMovie: 'Космический джем: Новое поколение',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 3,
      nameOfMovie: 'Черная вдова',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 4,
      nameOfMovie: 'Судная ночь навсегда',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 5,
      nameOfMovie: 'Босс-молокосос 2',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 6,
      nameOfMovie: 'Лука',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 7,
      nameOfMovie: 'Война будущего',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 8,
      nameOfMovie: 'Круиз по джунглям',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 9,
      nameOfMovie: 'El exorcismo de Carmen Farías',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
    Movie(
      id: 10,
      nameOfMovie: 'Бесконечность',
      dataOfMovie: '19 мая 2021',
      descriptionOfMovie: 'Описание произведения',
    ),
  ];

  var _filteredMovies = <Movie>[];

  final _searchController = TextEditingController();

  void _searchMovies() {
    final query = _searchController.text;
    if (query.isNotEmpty) {
      _filteredMovies = _movies.where((Movie movie) {
        return movie.nameOfMovie.toLowerCase().contains(query.toLowerCase());
      }).toList();
    } else {
      _filteredMovies = _movies;
    }
    setState(() {});
  }

  void _onMovieTap(int index) {
    final id = _movies[index].id;
    Navigator.of(context).pushNamed(
      '/main_screen/film_screen',
      arguments: id,
    );
  }

  @override
  void initState() {
    super.initState();
    _filteredMovies = _movies;
    _searchController.addListener(_searchMovies);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView.builder(
            padding: EdgeInsets.only(top: 70),
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemCount: _filteredMovies.length,
            itemExtent: 163,
            itemBuilder: (BuildContext context, int index) {
              final movie = _filteredMovies[index];
              return Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 10,
                ),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.black.withOpacity(0.2),
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 2),
                          ),
                        ],
                      ),
                      clipBehavior: Clip.hardEdge,
                      child: Row(
                        children: [
                          Container(
                            width: 94,
                            child: Image(
                              image: AssetImage(AppImages.tree_1),
                            ),
                          ),
                          Expanded(
                            child: Container(
                              margin: EdgeInsets.all(14.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    movie.nameOfMovie,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black,
                                      fontSize: 16.0,
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    movie.dataOfMovie,
                                    maxLines: 1,
                                    style: TextStyle(
                                      color: Color.fromRGBO(153, 153, 153, 1),
                                      fontSize: 14.4,
                                    ),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 15),
                                  Text(
                                    movie.descriptionOfMovie,
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.4,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Material(
                      color: Colors.transparent,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () => _onMovieTap(index),
                        splashColor: Colors.blue.withOpacity(0.2),
                        highlightColor: Colors.blue.withOpacity(0.2),
                      ),
                    ),
                  ],
                ),
              );
            }),
        Padding(
          padding: const EdgeInsets.only(
            top: 5,
            right: 15,
            left: 15,
            bottom: 10,
          ),
          child: TextField(
            controller: _searchController,
            decoration: InputDecoration(
              labelText: 'Поиск',
              filled: true,
              fillColor: Colors.white.withAlpha(235),
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ],
    );
  }
}
