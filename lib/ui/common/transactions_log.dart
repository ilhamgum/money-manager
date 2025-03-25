import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionsLog extends StatelessWidget {
  final ScrollController? controller;
  final dynamic data;

  const TransactionsLog({super.key, this.controller, required this.data});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        controller: controller,
        itemCount: data.length,
        itemBuilder: (context, index) {
          final Map currentData = data[index];
          final String formattedDate = DateFormat('dd MMMM yyyy').format(DateTime.parse(currentData['date']));
          final List transactions = currentData['transactions'];

          return Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // DATE
                Expanded(
                  flex: 3,
                  child: Text(
                    formattedDate,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),

                // TRANSACTIONS
                Expanded(
                  flex: 7,
                  child: ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: transactions.length,
                    itemBuilder: (context, index) {
                      final Map transaction = transactions[index];
                      final String remark = transaction['remark'];
                      final String transcationType = transaction['type'];
                      final Color expenseStyle = transcationType == "expense" ? Colors.redAccent : Colors.lightGreen;

                      return Container(
                        margin: const EdgeInsets.only(bottom: 10),
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                          leading: CircleAvatar(
                            backgroundColor: expenseStyle,
                            foregroundColor: Colors.white,
                            child: const Icon(Icons.wallet_outlined),
                          ),
                          leadingAndTrailingTextStyle: const TextStyle(
                            backgroundColor: Colors.white,
                            color: Colors.white,
                          ),
                          title: Text(remark),
                          textColor: Colors.black,
                          shape: RoundedRectangleBorder(
                              side: BorderSide(
                                color: expenseStyle,
                              ),
                              borderRadius: const BorderRadius.all(
                                Radius.circular(10),
                              )),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
