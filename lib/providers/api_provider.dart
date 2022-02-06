import 'package:dio/dio.dart';

enum Status {
  Success,
  Loading,
  NetworkError,
  Error,
}

//  var token =
//       'eyJhbGciOiJIUzI1NiJ9.IjYxYjVmZTllMDY2ZjNhOWJmYjc0ODFiMiI.1BrDUIYNTertbV74L05Zc-6UC6p0WqLkIXBA1Outxac';
class ApiProvider {
  // for all get request
  static Future get(String url, var token,
      {required Map<String, dynamic> queryParam}) async {
    var dio = Dio();
    var _response;

    // if (!await Connection.isConnected()) {
    //   return {'status': 'No Connection', 'body': 'No Internet Connection'};
    // }

    if (queryParam == null) {
      try {
        _response = await dio.get(
          url,
          options: Options(headers: {'Authorization': "Bearer " + token}),
        );
      } on DioError catch (e) {
        return {'status': e.response!.statusCode, 'body': e.response!.data};
      }
    } else {
      queryParam != null;
      try {
        _response =
            await dio.get(url, queryParameters: queryParam);
      } on DioError catch (e) {
        return {'status': e.response!.statusCode, 'body': e.response!.data};
      }
    }

    // print('api: ${constant.api}');
    return {'status': _response.statusCode, 'body': _response.data};
  }

  // for all post request
  static Future post(
      {required String url,
      required var token,
      Map<String, dynamic> body = const {}}) async {
    var dio = Dio();
    print(body);
    print(body.runtimeType);
    FormData formData = FormData.fromMap(body);

    // if (!await Connection.isConnected()) {
    //   return {'status': 'No Connection', 'body': 'No Internet Connection'};
    // }
//  FormData body = new FormData.fromMap({
//     "images[]": await MultipartFile.fromFile(
//       carryData.path,
//       filename: carryData.path.split("/").last,
//     ),
//   });

    var _response = await dio.post(
      url,
      // 'https://sheltered-earth-76230.herokuapp.com/user/add/details',
      data: formData,
      options: Options(
        followRedirects: false,
        validateStatus: (status) {
          return status! < 500;
        },
        headers: {'Authorization': "Bearer " + token},
      ),
    );
//  response = await dio.post(baseUrl + 'v2/add-portfolio',
//         data: body,
//         options: Options(
//             followRedirects: false,
//             validateStatus: (status) {
//               return status! < 500;
//             },
//             headers: {'Authorization': "Bearer " + token}));
//   } catch (err) {
//     print("betee");
//     print(err);
//   }
    return {'status': _response.statusCode, 'body': _response.data};

    // if (_response.statusCode == 200) {
    //   print('api_provider successfull');
    //   return {'status': '${_response.statusCode}', 'body': _response.data};
    // } else {
    //   print('api_provider error ${_response.statusCode} : ${_response.data}');
    //   return {'status': '${_response.statusCode}', 'body': _response.data};
    // }
  }
}
