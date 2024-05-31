import 'package:dio/dio.dart';

class SymptomsResponse {
  List<String> symptoms;

  SymptomsResponse({required this.symptoms});

  factory SymptomsResponse.fromJson(Map<String, dynamic> json) {
    return SymptomsResponse(
      symptoms: List<String>.from(json['Symptoms']),
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['Symptoms'] = this.symptoms;
    return data;
  }
}

class ResponsePredictionModel {
  final String disease;
  final String description;
  final List<String> precautions;

  ResponsePredictionModel({
    required this.disease,
    required this.description,
    required this.precautions,
  });

  factory ResponsePredictionModel.fromJson(Map<String, dynamic> json) {
    return ResponsePredictionModel(
      disease: json['Disease'],
      description: json['Description'],
      precautions: List<String>.from(json['Precautions']),
    );
  }
}

class RequestPredictionModel {
  final Map<String, int> symptoms;

  RequestPredictionModel({required this.symptoms});

  Map<String, dynamic> toJson() {
    return symptoms;
  }
}

class ApiCaller {
  Dio dio = Dio();
  static const baseUrl = 'http://10.0.2.2:8000';

  Future<SymptomsResponse> fetchSymptoms() async {
    try {
      final url = '$baseUrl/symptoms';
      final response = await dio.get(url);
      print("Response: $response");
      if (response.statusCode == 200) {
        return SymptomsResponse.fromJson(response.data);
      } else {
        throw Exception('Failed to load symptoms');
      }
    } catch (e) {
      throw Exception('Failed to load symptoms: $e');
    }
  }

  Future<ResponsePredictionModel> fetchPredictionResult(
      RequestPredictionModel request) async {
    try {
      print("${request.toJson()}");
      final url = '$baseUrl/predict';
      final response = await dio.post(url, data: request.toJson());
      print("Response: $response");
      if (response.statusCode == 200) {
        return ResponsePredictionModel.fromJson(response.data);
      } else {
        throw Exception('Failed to fetch prediction result');
      }
    } catch (e) {
      throw Exception('Failed to fetch prediction result: $e');
    }
  }
}
