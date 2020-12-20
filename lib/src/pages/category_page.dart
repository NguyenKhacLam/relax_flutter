import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:provider/provider.dart';
import 'package:relax/src/bloc/song_bloc.dart';
import 'package:relax/src/models/category.dart';
import 'package:relax/src/widget/song_block.dart';

class CategoryPage extends StatefulWidget {
  final Category category;

  CategoryPage({this.category});

  @override
  _CategoryPageState createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  var bloc = SongBloc();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bloc.getSongData(widget.category.name);
  }

  @override
  Widget build(BuildContext context) {
    Widget buildGridView(data){
      return Expanded(
        child: GridView.builder(
          itemCount: data.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10
          ),
          itemBuilder: (BuildContext context, int index){
            return Container(
              height: 30,
              child: SongBlock(song: data[index],),
            );
          },
        ),
      );
    }

    return Scaffold(
      backgroundColor: HexColor(widget.category.color),
      body: StreamBuilder(
            stream: bloc.songsStream,
            builder: (context, snapshot) {
              switch (snapshot.connectionState){
                case ConnectionState.active:
                  return NestedScrollView(
                    headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled){
                      return <Widget>[
                        SliverAppBar(
                          backgroundColor: HexColor(widget.category.color),
                          expandedHeight: 250,
                          floating: true,
                          flexibleSpace: FlexibleSpaceBar(
                            background: Image.network(widget.category.imageUrl, fit: BoxFit.cover,),
                          ),
                          leading: IconButton(
                              icon: Icon(Icons.arrow_back_ios),
                              onPressed: () => Navigator.pop(context)
                          ),
                          actions: [
                            IconButton(icon: Icon(Icons.share), onPressed: () => print('Share'))
                          ],
                        ),
                      ];
                    },
                    body: Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(widget.category.name, style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold
                          ),),
                          SizedBox(height: 16,),
                          Text(widget.category.description, style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w300
                          ),),
                          SizedBox(height: 32,),
                          Text('LIST MUSIC', style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                          buildGridView(snapshot.data),
                        ],
                      ),
                    ),
                  );
                  break;
                case ConnectionState.waiting:
                  return Center(child: CircularProgressIndicator());
                  break;
                  default:
                    return Text('Empty');
              }
            }
        ),
    );
  }
}
