import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lap_app/bloc/bloc.dart';
import 'package:lap_app/data/entities/entities.dart';
import 'package:lap_app/ui/pages/pages.dart';
import 'package:lap_app/ui/widget/widgets.dart';
import 'package:rounded_floating_app_bar/rounded_floating_app_bar.dart';
import 'package:meta/meta.dart';

class SearchResultPage extends StatelessWidget {
  final TokenCredential tokenCredential;
  final String searchString;
  final List<dynamic> jobs;
  SearchResultPage(
      {Key key,
      @required this.tokenCredential,
      @required this.searchString,
      @required this.jobs})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SearchResultBloc(),
      child: SearchResultPageChild(
        jobs: jobs,
        searchString: searchString,
      ),
    );
  }
}

class SearchResultPageChild extends StatefulWidget {
  final TokenCredential tokenCredential;
  final String searchString;
  final List<dynamic> jobs;

  const SearchResultPageChild(
      {Key key, this.tokenCredential, this.searchString, this.jobs})
      : super(key: key);
  @override
  State<StatefulWidget> createState() {
    return _SearchResultPageChildState(
        tokenCredential: tokenCredential,
        searchString: searchString,
        jobs: jobs);
  }
}

class _SearchResultPageChildState extends State<SearchResultPageChild> {
  final TokenCredential tokenCredential;
  final String searchString;
  final List<dynamic> jobs;
  _SearchResultPageChildState(
      {Key key, this.tokenCredential, this.searchString, this.jobs});
  final txtController = TextEditingController();

  @override
  void initState() {
    super.initState();
    txtController.text = this.searchString;
  }

  @override
  void dispose() {
    if (txtController != null) {
      txtController.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: BlocListener<SearchResultBloc, SearchResultState>(
              listener: (BuildContext context, state) {
                if (state is SearchResultErrorState) {
                  Scaffold.of(context).showSnackBar(SnackBar(
                    content: Text(state.message),
                    backgroundColor: state.color,
                  ));
                } else if (state is SearchResultBackPageState) {
                  Navigator.pop(context);
                } else if (state is GotoDetailJobState) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return TaskDetailPage(
                      tokenCredential: tokenCredential,
                    );
                  }));
                  //  Navigator.of(context)
                  //     .push(MaterialPageRoute(builder: (BuildContext context) {
                  //   return ConsolePage(
                  //   );
                  // }));
                }
              },
              child: buildBody(context),
            )),
      ),
    );
  }

  Widget buildBody(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, isInnerBoxScroll) {
        return [
          RoundedFloatingAppBar(
            actions: <Widget>[
              IconButton(
                icon: Icon(
                  Icons.clear,
                  size: 30,
                ),
                onPressed: () {
                  txtController.text = '';
                },
              ),
            ],
            floating: true,
            snap: true,
            title: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                IconButton(
                    icon: Icon(
                      Icons.keyboard_backspace,
                      size: 30,
                    ),
                    onPressed: () {
                      final searchResultBloc =
                          BlocProvider.of<SearchResultBloc>(context);
                      searchResultBloc.add(SearchResultBackPageEvent());
                    }),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: 'ค้นหางานใหม่รอดำเนินการ',
                      border: InputBorder.none,
                    ),
                    onFieldSubmitted: (_) =>
                        _onSubmitted(context, txtController.text),
                    controller: txtController,
                    textInputAction: TextInputAction.search,
                  ),
                ),
              ],
            ),
            backgroundColor: Colors.white,
          ),
        ];
      },
      body: BlocBuilder(
        bloc: BlocProvider.of<SearchResultBloc>(context),
        builder: (BuildContext context, state) {
          if (state is SearchResultInitial) {
            return ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildItem(context, jobs[index]);
                });
          } else if (state is SearchResultRebuildState) {
            return ListView.builder(
                itemCount: state.jobs.length,
                itemBuilder: (BuildContext context, int index) {
                  return buildItem(context, state.jobs[index]);
                });
          } else {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    LoadingWidget(
                      width: MediaQuery.of(context).size.width * 0.2,
                      height: MediaQuery.of(context).size.width * 0.2,
                    ),
                  ],
                )
              ],
            );
          }
        },
      ),
    );
  }

  _onSubmitted(BuildContext context, String searchString) {
    if (searchString.length != 0) {
      final searchResultBloc = BlocProvider.of<SearchResultBloc>(context);
      if (searchString.length > 3) {
        searchResultBloc
            .add(SearchResultSearchEvent(searchString: searchString));
      } else {
        searchResultBloc.add(SearchResultErrorEvent(
          message: 'String search length must longer than 3!',
          color: Colors.red,
        ));
      }
    }
  }

  Widget buildItem(BuildContext context, Map<String, dynamic> jobs) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 15, 20, 0),
      margin: EdgeInsets.all(7),
      decoration: BoxDecoration(
        color: new Color.fromARGB(255, 240, 240, 240),
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Expanded(
                  child: Container(
                child: Text('โครงการ : ' + jobs['customerName'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'sans',
                        fontSize: 21,
                        color: Colors.black87)),
              )),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Project : ' + jobs['projectNameEn'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'sans',
                        fontSize: 20,
                        color: Colors.black87)),
              ),
            ],
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Text('Site Code : ' + jobs['siteCode'],
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        fontFamily: 'sans',
                        fontSize: 20,
                        color: Colors.black87)),
              ),
            ],
          ),
          Divider(
            color: Colors.grey,
            //height:double.maxFinite
          ),
          ButtonTheme(
              minWidth: 365.0,
              height: 46.0,
              child: FlatButton(
                  materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  onPressed: () {
                    final searchResultBloc =
                        BlocProvider.of<SearchResultBloc>(context);
                    searchResultBloc.add(GotoDetailJobEvent());
                  },
                  child: Text(
                    'รายละเอียดงาน',
                    style: TextStyle(
                        fontFamily: 'supermarket',
                        fontSize: 18,
                        color: Colors.green),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: const BorderRadius.only(
                          bottomLeft: (const Radius.circular(8)),
                          bottomRight: (const Radius.circular(8))),
                      side: BorderSide(color: Colors.transparent))))
        ],
      ),
    );
  }
}
