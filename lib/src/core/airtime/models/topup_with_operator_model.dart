import 'dart:convert';

class TopUpWithOperatorModel {
  int amount;
  String recipientPhoneNumber;
  String reciepientCountryCode;
  String customerIdentifier;
  String? senderPhoneNumber;
  String? senderCountryCode;
  String operatorID;
  TopUpWithOperatorModel({
    required this.amount,
    required this.recipientPhoneNumber,
    required this.reciepientCountryCode,
    this.customerIdentifier = "Default customer identifier",
    this.senderPhoneNumber,
    this.senderCountryCode,
    required this.operatorID,
  });

  TopUpWithOperatorModel copyWith({
    int? amount,
    String? recipientPhoneNumber,
    String? reciepientCountryCode,
    String? customerIdentifier,
    String? senderPhoneNumber,
    String? senderCountryCode,
    String? operatorID,
  }) {
    return TopUpWithOperatorModel(
      amount: amount ?? this.amount,
      recipientPhoneNumber: recipientPhoneNumber ?? this.recipientPhoneNumber,
      reciepientCountryCode:
          reciepientCountryCode ?? this.reciepientCountryCode,
      customerIdentifier: customerIdentifier ?? this.customerIdentifier,
      senderPhoneNumber: senderPhoneNumber ?? this.senderPhoneNumber,
      senderCountryCode: senderCountryCode ?? this.senderCountryCode,
      operatorID: operatorID ?? this.operatorID,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'amount': amount,
      'recipientPhoneNumber': recipientPhoneNumber,
      'reciepientCountryCode': reciepientCountryCode,
      'customerIdentifier': customerIdentifier,
      'senderPhoneNumber': senderPhoneNumber,
      'senderCountryCode': senderCountryCode,
      'operatorID': operatorID,
    };
  }

  factory TopUpWithOperatorModel.fromMap(Map<String, dynamic> map) {
    return TopUpWithOperatorModel(
      amount: map['amount']?.toInt() ?? 0,
      recipientPhoneNumber: map['recipientPhoneNumber'] ?? '',
      reciepientCountryCode: map['reciepientCountryCode'] ?? '',
      customerIdentifier: map['customerIdentifier'] ?? '',
      senderPhoneNumber: map['senderPhoneNumber'] ?? '',
      senderCountryCode: map['senderCountryCode'] ?? '',
      operatorID: map['operatorID'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory TopUpWithOperatorModel.fromJson(String source) =>
      TopUpWithOperatorModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'TopUpWithOperatorModel(amount: $amount, recipientPhoneNumber: $recipientPhoneNumber, reciepientCountryCode: $reciepientCountryCode, customerIdentifier: $customerIdentifier, senderPhoneNumber: $senderPhoneNumber, senderCountryCode: $senderCountryCode, operatorID: $operatorID)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is TopUpWithOperatorModel &&
        other.amount == amount &&
        other.recipientPhoneNumber == recipientPhoneNumber &&
        other.reciepientCountryCode == reciepientCountryCode &&
        other.customerIdentifier == customerIdentifier &&
        other.senderPhoneNumber == senderPhoneNumber &&
        other.senderCountryCode == senderCountryCode &&
        other.operatorID == operatorID;
  }

  @override
  int get hashCode {
    return amount.hashCode ^
        recipientPhoneNumber.hashCode ^
        reciepientCountryCode.hashCode ^
        customerIdentifier.hashCode ^
        senderPhoneNumber.hashCode ^
        senderCountryCode.hashCode ^
        operatorID.hashCode;
  }
}
