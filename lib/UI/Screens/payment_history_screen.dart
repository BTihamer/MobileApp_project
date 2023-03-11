import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaymentHistory extends StatefulWidget {
  const PaymentHistory({Key? key}) : super(key: key);

  @override
  State<PaymentHistory> createState() => _PaymentHistoryState();
}
class _PaymentHistoryState extends State<PaymentHistory>{
  final ScrollController _horizontal = ScrollController(),
      _vertical = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text("Payment History"),
    centerTitle: true,
    backgroundColor: Colors.deepPurple,
    leading: const BackButton(
    color: Colors.white,
    ),
    ),
        body: ListView(children: <Widget>[
          SizedBox(

            width: double.infinity,
      child: Scrollbar(
        controller: _vertical,
        thumbVisibility: true,
        trackVisibility: true,
        child: Scrollbar(
          controller: _horizontal,
          thumbVisibility: true,
          trackVisibility: true,
          notificationPredicate: (notif) => notif.depth == 1,
          child: ScrollConfiguration(
            behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
            child: SingleChildScrollView(
              controller: _vertical,
              child: ScrollConfiguration(
                behavior: ScrollConfiguration.of(context).copyWith(scrollbars: false),
                child: SingleChildScrollView(
                  controller: _horizontal,
                  scrollDirection: Axis.horizontal,

                  child: DataTable(
                  columns: const [
                  DataColumn(label: Text(
                  'ID',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )),
                  DataColumn(label: Text(
                  'Date',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )),
                  DataColumn(label: Text(
                  'Type',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                  )),
                    DataColumn(label: Text(
                        'Amount',
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)
                    )),
                  ],
                  rows: [
                    for(int i=0;i<5;++i) addRow()
                  ]),
                ),
              ),
            ),
          ),
        ),
      ),
    )
    ])
    );
  }
  DataRow addRow(){
    return  DataRow(cells: [
      DataCell(Text('15321313')),
      DataCell(Text('2023/03/11')),
      DataCell(Text('30day')),
      DataCell(Text('30')),
    ]);
  }
}