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
  HomePageChild({Key key}) : super(key: key);

  @override
  _HomePageChildState createState() => _HomePageChildState();
}

class _HomePageChildState extends State<HomePageChild> {
  int _selectedIndex = 0;
  List<Color> iconColor = <Color>[
    Color.fromARGB(255, 47, 220, 150),
    Colors.grey[400],
    Colors.grey[400],
    Colors.grey[400],
  ];
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
  TextEditingController txtController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text('Home', style: TextStyle(color: Colors.black)),
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
                  Icons.home,
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
              // if (state is RequestOtpError) {
              //   Scaffold.of(context).showSnackBar(SnackBar(
              //     content: Text(state.message),
              //     backgroundColor: state.color,
              //   ));
              // }
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
      Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
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
            onSubmitted: _onSubmitted(context,txtController.text),
            controller: txtController,
            textInputAction: TextInputAction.search,
          ),
        ),
      ]),
    ]);
  }

  _onSubmitted(BuildContext context,String searchString){
    txtController.text = '';
  }
}
