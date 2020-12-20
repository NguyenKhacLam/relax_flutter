import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:provider/provider.dart';
import 'package:relax/src/bloc/categories_bloc.dart';
import 'package:relax/src/models/category.dart';
import 'package:relax/src/widget/category_block.dart';

class StaggerList extends StatefulWidget {
  @override
  _StaggerListState createState() => _StaggerListState();
}

class _StaggerListState extends State<StaggerList> {
  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    var bloc = Provider.of<CategoryBloc>(context);
    bloc.getCategoryData();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CategoryBloc>(
      builder: (context, bloc, child) => StreamBuilder(
          stream: bloc.categoryStream,
          builder: (context, snapshot){
            switch(snapshot.connectionState){
              case ConnectionState.active:
                return StaggeredGridView.countBuilder(
                  crossAxisCount: 4,
                  itemCount: snapshot.data.length,
                  itemBuilder: (BuildContext context, int index) => CategoryBlock(category: snapshot.data[index],),
                  staggeredTileBuilder: (int index) => new StaggeredTile.count(2, index.isEven ? 2.5: 1.5),
                  mainAxisSpacing: 10.0,
                  crossAxisSpacing: 10.0,
                );
                break;
              case ConnectionState.waiting:
                return CircularProgressIndicator();
                break;
              default:
                return Text('Empty');
            }
          }
      )
    );
  }
}

