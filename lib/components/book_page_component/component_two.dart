import 'package:cabto_app/components/car_card.dart';
import 'package:cabto_app/components/my_button.dart';
import 'package:cabto_app/models/cab_option.dart';
import 'package:cabto_app/services/cab_option_services.dart';
import 'package:cabto_app/services/utils/cosnt/cosnts.dart';
import 'package:cabto_app/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../services/utils/utils.dart';

class ComponenetTwo extends StatefulWidget {
  const ComponenetTwo({super.key});

  @override
  State<ComponenetTwo> createState() => _ComponenetTwoState();
}

class _ComponenetTwoState extends State<ComponenetTwo> {
  String? _pickupTime;

  void initialseDate() {
    DateFormat timeFormat = DateFormat.Hm();
    DateFormat dateFormat = DateFormat.yMd();
    String formattedTime = timeFormat.format(incrementTime());
    String formattedDate = dateFormat.format(DateTime.now());

    _pickupTime = '$formattedDate $formattedTime AM';
  }

  // Adding 10 minutes to the date just for show fake reality of pickup time
  DateTime incrementTime() {
    return DateTime(DateTime.now().year, DateTime.now().month,
        DateTime.now().day, DateTime.now().hour, DateTime.now().minute + 10);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    initialseDate();
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(2.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text(
              'Top Suggesstion for you',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pickup Date Time',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12),
                ),
                Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 16.0, vertical: 4.0),
                  child: Text(_pickupTime!),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(6)),
                      border: Border.all(color: Colors.grey, width: 1)),
                )
              ],
            )
          ],
        ),
      ),
      Expanded(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<MyProvider>(
          builder: (context, myProvider, child) {
            return FutureBuilder(
                builder:
                    (context, AsyncSnapshot<List<CabOptionModel>> snapshot) {
                  if (!snapshot.hasData) {
                    return Center(child: SpinKitFadingCircle(color: grey,));
                  } else {
                    return ListView.builder(
                      itemBuilder: (context, index) => GestureDetector(
                          onTap: () {
                            // To Select Car
                            myProvider.toogleSelectedCar(index);
                          },
                          child: CarCard(
                            category: snapshot.data![index].taxiCategory.toString(),
                            iamgeUrl: snapshot.data![index].taxiImage.toString(),
                            info: snapshot.data![index].taxiInfo.toString(),
                            price: snapshot.data![index].price.toString(),
                              selected: myProvider.selectedCarIndex == index)),
                      itemCount: snapshot.data!.length,
                    );
                  }
                },
                future: CabOptionService().getCabOptions());
          },
        ),
      )),
      Consumer<MyProvider>(
        builder: (context, myProvider, child) => Row(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0),
              child: InputChip(
                backgroundColor: Colors.white,
                label: Text("Book for myself"),
                selectedColor: grey.withOpacity(0.2),
                selected:
                    myProvider.book_option_selected_chip == 1 ? true : false,
                onPressed: () {
                  myProvider.toogleBookOptionChip(1);
                },
              ),
            ),
            InputChip(
              backgroundColor: Colors.white,
              label: Text("Book for other"),
              selectedColor: Colors.grey.withOpacity(0.2),
              selected:
                  myProvider.book_option_selected_chip == 2 ? true : false,
              onPressed: () {
                myProvider.toogleBookOptionChip(2);
              },
            )
          ],
        ),
      ),
      MyButton(onTap: () {}, title: 'Book', size: MediaQuery.of(context).size)
    ]);
  }
}
