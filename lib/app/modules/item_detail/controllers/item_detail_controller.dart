import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:inventaris_app/app/modules/add_items/controllers/add_items_controller.dart';
import 'package:inventaris_app/app/modules/auth/controllers/auth_controller.dart';

class ItemDetailController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  FirebaseAuth auth = FirebaseAuth.instance;

  final st = Get.find<AddItemsController>();

  //TODO: Implement ItemDetailController

  final count = 0.obs;
  var stok = 0;
  double saldo = 0.0;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}
  void increment() => count.value++;

  void tampilStok() async {
    var collection = FirebaseFirestore.instance.collection('inven');
    //userUid is the current auth user
    var docSnapshot =
        await collection.doc(FirebaseAuth.instance.currentUser!.email).get();

    var data = docSnapshot.data()!;
    // point += data['poin_belanja'];

    int stokk = (data['stok']).toInt();
    var a = [];
    var b = [];

    data != null ? stokk : a;
    data != null ? stokk : b;
    int saldoo = (data['saldo']).toInt();
    // point += pointt;
    // int a = pointt += poinPlus;
    stok += stokk;
    saldo += saldoo;

    update();
    print('stok database is ${stokk}');
    print('saldo di database is ${saldo}');
    // return p;
  }

  void clsC() {
    stok = 0;
    print("stok: $stok");
    saldo = 0.0;
    print("stok: $saldo");
    update();
  }

  void deleteItem(a, b, h, s) async {
    CollectionReference itemColl = firestore.collection('item');
    CollectionReference usersColl = firestore.collection('users');
    FirebaseFirestore.instance
        .collection('item')
        .doc(a)
        .delete()
        .whenComplete(()
            // await itemColl.doc(a).delete().whenComplete(()
            // async
            {
      // await usersColl.doc(auth.currentUser!.email).set({
      // 'itemId': FieldValue.arrayRemove([a])
      //   }, SetOptions(merge: true));
      //   Get.back();
      //   Get.snackbar('Item', 'Succesfully deleted');
      // });
      // var hh = int
      var ss = stok - int.parse(s);
      var b = saldo - h;
      FirebaseFirestore.instance
          .collection('inven')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .set({
        'saldo': b.toDouble(),
        'stok': ss.toInt(),
        'pemilik': FirebaseAuth.instance.currentUser!.email
      }).whenComplete(()
              // await itemColl.doc(a).delete().whenComplete(()
              // async
              {
        st.tampilStok();
        Get.back();
        Get.snackbar('Item', 'Succesfully deleted');
        print("selesai Stok refresh");
        print("selesai Stok refresh");
        print("selesai refresh RxInt menjadi $saldo saldo");
        print("selesai refresh RxInt menjadi $stok stok");

        // clsC();
      });
    });
  }

  void updateStokSaldo() {}

  String gm = '';

  void gambar(value) {
    gm = value;
    print(gm);
    update();
  }

  void pickUpImage() async {
    final image = await ImagePicker().pickImage(
        source: ImageSource.gallery,
        maxHeight: 512,
        maxWidth: 512,
        imageQuality: 75);

    Reference ref = FirebaseStorage.instance
        .ref()
        .child('FotoBarang/${gm.toString()}_${DateTime.now()}.jpg');
    await ref.putFile(File(image!.path));
    ref.getDownloadURL().then((value) {
      // print(value);
      // gambar(value);
      gm = value;
      update();

      // setState(() {
      // im = value;
      // controller.gambar(value)
      // });
    });
  }
}
