// To parse this JSON data, do
//
//     final bulkTransfer = bulkTransferFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

BulkTransfer bulkTransferFromJson(String str) =>
    BulkTransfer.fromJson(json.decode(str));

String bulkTransferToJson(BulkTransfer data) => json.encode(data.toJson());

class BulkTransfer {
  String currency;
  List<Transfer> transfers;

  BulkTransfer({
    required this.currency,
    required this.transfers,
  });

  factory BulkTransfer.fromJson(Map<String, dynamic> json) => BulkTransfer(
        currency: json["currency"],
        transfers: List<Transfer>.from(
            json["transfers"].map((x) => Transfer.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "currency": currency,
        "transfers": List<dynamic>.from(transfers.map((x) => x.toJson())),
      };
}

class Transfer {
  String amount;
  String bankCode;
  String bankName;
  String accountNumber;
  String narration;

  Transfer({
    required this.amount,
    required this.bankCode,
    required this.bankName,
    required this.accountNumber,
    required this.narration,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) => Transfer(
        amount: json["amount"],
        bankCode: json["bank_code"],
        bankName: json["bank_name"],
        accountNumber: json["account_number"],
        narration: json["narration"],
      );

  Map<String, dynamic> toJson() => {
        "amount": amount,
        "bank_code": bankCode,
        "bank_name": bankName,
        "account_number": accountNumber,
        "narration": narration,
      };
}
