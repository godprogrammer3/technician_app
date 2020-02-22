import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';

class HomePage extends StatelessWidget {
  final TokenCredential tokenCredential;
  const HomePage({Key key, this.tokenCredential}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: BlocProvider(
        create: (context) => HomeBloc(),
        child: HomePageChild(),
      ),
    );
  }
}

class HomePageChild extends StatefulWidget {
  final TokenCredential tokenCredential;
  HomePageChild({Key key, this.tokenCredential}) : super(key: key);

  @override
  _HomePageChildState createState() =>
      _HomePageChildState(tokenCredential: tokenCredential);
}

class _HomePageChildState extends State<HomePageChild> {
  final TokenCredential tokenCredential;
  int _selectedIndex = 0;
  List<Color> iconColor = <Color>[
    Color.fromARGB(255, 47, 220, 150),
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
  ];

  _HomePageChildState({this.tokenCredential});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Search', style: TextStyle(color: Colors.black)),
          centerTitle: true,
          backgroundColor: Colors.white,
        ),
        bottomNavigationBar: BottomAppBar(
          child: Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.search,
                  size: 30,
                  color: iconColor[0],
                ),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(
                  Icons.view_list,
                  size: 30,
                  color: iconColor[1],
                ),
                onPressed: () {
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.add(HomeChangePageEvent(pageIndex: 1));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.event_note,
                  size: 30,
                  color: iconColor[2],
                ),
                onPressed: () {
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.add(HomeChangePageEvent(pageIndex: 2));
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  size: 30,
                  color: iconColor[3],
                ),
                onPressed: () {
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.add(HomeChangePageEvent(pageIndex: 3));
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: BlocListener<HomeBloc, HomeState>(
            listener: (context, state) {
              if (state is HomeErrorState) {
                Scaffold.of(context).showSnackBar(SnackBar(
                  content: Text(state.message),
                  backgroundColor: state.color,
                ));
              } else if (state is HomeGotoSearchPage) {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return SearchResultPage(
                    tokenCredential: tokenCredential,
                    searchString: state.searchString,
                    jobs: state.jobs,
                  );
                }));
              } else if (state is HomeChangePageState) {
                switch (state.pageIndex) {
                  case 1:
                    {
                      Navigator.of(context)
                          .pushReplacement(_createRoute(YourTaskPage(
                        tokenCredential: tokenCredential,
                      )));
                      break;
                    }
                  case 2:
                    {
                      Navigator.of(context)
                          .pushReplacement(_createRoute(WaitTaskPage(
                        tokenCredential: tokenCredential,
                      )));
                      break;
                    }
                  case 3:
                    {
                      Navigator.of(context)
                          .pushReplacement(_createRoute(NotificationPage(
                        tokenCredential: tokenCredential,
                      )));
                      break;
                    }
                }
              }
            },
            child: buildBody(context),
          ),
        ),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return Column(children: <Widget>[
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
        ImageDisplay(
          imageName: 'aislogo.png',
          width: MediaQuery.of(context).size.width * 0.5,
          height: MediaQuery.of(context).size.height * 0.2,
        ),
      ]),
      BlocBuilder(
        bloc: BlocProvider.of<HomeBloc>(context),
        builder: (BuildContext context, state) {
          if (state is HomeInitial) {
            return searchInput(context);
          } else {
            return LoadingWidget(width: 100, height: 100);
          }
        },
      ),
    ]);
  }

  TextEditingController txtController = new TextEditingController();
  Widget searchInput(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
      Container(
        padding: EdgeInsets.fromLTRB(0, 0, 16, 0),
        decoration: new BoxDecoration(
            color: Color.fromARGB(255, 240, 240, 240),
            border: new Border.all(width: 0.05, color: Colors.grey),
            borderRadius: const BorderRadius.all(const Radius.circular(34))),
        width: MediaQuery.of(context).size.width * 0.74,
        child: TextFormField(
          decoration: InputDecoration(
              hintText: 'ค้นหางานใหม่รอดำเนินการ',
              border: InputBorder.none,
              prefixIcon: Icon(Icons.search)),
          onFieldSubmitted: (_) => _onSubmitted(context, txtController.text),
          controller: txtController,
          textInputAction: TextInputAction.search,
        ),
      ),
    ]);
  }

  _onSubmitted(BuildContext context, String searchString) {
    if (searchString.length != 0) {
      txtController.text = '';
      final homeBloc = BlocProvider.of<HomeBloc>(context);
      if (searchString.length > 3) {
        homeBloc.add(HomeSearchEvent(searchString: searchString));
      } else {
        homeBloc.add(HomeErrorEvent(
          message: 'String search length must longer than 3!',
          color: Colors.red,
        ));
      }
    }
  }
}

Route _createRoute(StatelessWidget page) {
  return PageRouteBuilder(
    pageBuilder: (context, animation, secondaryAnimation) => page,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      var begin = Offset.zero;
      var end = Offset.zero;
      var curve = Curves.ease;

      var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}
