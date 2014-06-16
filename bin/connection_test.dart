library connection_test;

import 'dart:async';
import 'package:google_cloud_datastore/datastore.dart';


part 'entity.dart';


void main() {
  DatastoreConnection.open('451906218297', 'crucial-matter-487')
      .then((DatastoreConnection connection) {
        var datastore = new Datastore(connection);
        return Pricing.lookupById(datastore, 4575785142714368);
      })
      .then((entity) {
        print('Key: ${entity.key.id}');
      });
}
