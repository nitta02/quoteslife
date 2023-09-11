// To parse this JSON data, do
//
//     final quotesDayApi = quotesDayApiFromJson(jsonString);

import 'dart:convert';

List<QuotesDayApi> quotesDayApiFromJson(String str) => List<QuotesDayApi>.from(json.decode(str).map((x) => QuotesDayApi.fromJson(x)));

String quotesDayApiToJson(List<QuotesDayApi> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class QuotesDayApi {
    String q;
    String a;
    String h;

    QuotesDayApi({
        required this.q,
        required this.a,
        required this.h,
    });

    factory QuotesDayApi.fromJson(Map<String, dynamic> json) => QuotesDayApi(
        q: json["q"],
        a: json["a"],
        h: json["h"],
    );

    Map<String, dynamic> toJson() => {
        "q": q,
        "a": a,
        "h": h,
    };
}
