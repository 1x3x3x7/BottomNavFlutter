import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:my_app/model/app_state.dart';
import 'package:my_app/model/image.dart';
import 'package:my_app/redux/action/actions.dart';
import 'package:octo_image/octo_image.dart';

class OverviewScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StoreConnector<AppState, List<ImageEntity>>(
        onInit: (store) => store.dispatch(fetchItemAction()),
        converter: (store) => store.state.images,
        builder: (context, list) {
          return buildBody(context, list);
        });
  }

  Widget buildBody(BuildContext context, List<ImageEntity> list) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Overview",
          ),
        ),
        body: Container(
          color: Colors.white,
          child: list.isEmpty
              ? Center(child: CircularProgressIndicator())
              : Column(children: [
                  AspectRatio(
                    aspectRatio: list.first.width / list.first.height,
                    child: Container(
                      child: OctoImage(
                        image: NetworkImage(list.first.url),
                        placeholderBuilder: OctoPlaceholder.blurHash(
                          'LEHV6nWB2yk8pyo0adR*.7kCMdnj',
                        ),
                        errorBuilder: OctoError.icon(color: Colors.red),
                        fit: BoxFit.cover,
                      ),
                      alignment: Alignment.topCenter,
                    ),
                  ),
                  SizedBox(
                    height: 50,
                  ),
                  TextButton(
                      child: Text("alert"),
                      onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: Text("alert"),
                              content: Text("text"),
                            ),
                          )),
                ]),
        ));
  }
}
