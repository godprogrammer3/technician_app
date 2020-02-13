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
  void _onItemTapped(int index) {
    setState(() {
      for (int i = 0; i < 4; i++) {
        if (i == index) {
          iconColor[i] = Color.fromARGB(255, 47, 220, 150);
        } else {
          iconColor[i] = Colors.grey[400];
        }
      }
    });
  }

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
                onPressed: () {
                  _onItemTapped(0);
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.view_list,
                  size: 30,
                  color: iconColor[1],
                ),
                onPressed: () {
                  _onItemTapped(1);
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.add(ChangeToYourTaskViewEvent());

                },
              ),
              IconButton(
                icon: Icon(
                  Icons.event_note,
                  size: 30,
                  color: iconColor[2],
                ),
                onPressed: () {
                  _onItemTapped(2);
                  final homeBloc = BlocProvider.of<HomeBloc>(context);
                  homeBloc.add(ChangeToWaitTaskViewEvent());
                },
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_active,
                  size: 30,
                  color: iconColor[3],
                ),
                onPressed: () {
                  _onItemTapped(3);
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
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: SearchResultPage(
                        tokenCredential: tokenCredential,
                        searchString: state.searchString,
                        jobs: state.jobs,
                      )),
                ));
              }else if(state is ChangeToYourTaskView) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: YourTaskPage(
                         tokenCredential: tokenCredential,
                      )),
                ));
              }else if(state is ChangeToWaitTaskView) {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (_) => BlocProvider.value(
                      value: BlocProvider.of<HomeBloc>(context),
                      child: WaitTaskPage(
                        tokenCredential: tokenCredential,
                        // searchString: state.searchString,
                        // jobs: state.jobs,
                      )),
                ));
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
        child: TextField(
          decoration: InputDecoration(
            hintText: 'ค้นหางานใหม่รอดำเนินการ',
            prefixIcon: Icon(Icons.search),
            border: InputBorder.none,
          ),
          onSubmitted: _onSubmitted(context, txtController.text),
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
