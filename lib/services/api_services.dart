import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://webtoon-crawler.nomadcoders.workers.dev";
  final String today = "today";

  void getTodaysToons()async {
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    //
    // http.get(url)
    //
    // get : Future<Response> 는 미래에 무언가 일어나고, 그 응답정보는 Response일 것이다.. 하는거임
    // 프로그램이 위 명령을 처리할 때, url응답은 서버 상황에따라서 응답 시간이 달라짐.
    // 그래서 프로그램이 기다려줘야 함.
    // 그래서 응답을 받고 넘어가도록 명령을 입력할거임.(awake)
    //
    // await http.get(url)
    //
    // await는 응답 반환 받을 때 까지 기다려줌
    // 이런걸 Async(비동기) programming이라함.
    // 이 await는 async 함수 안에서만 쓸 수 있음. 그래서 함수명()async가 붙음
    // 일반적으로 get과 같이 타입이 Future인 타입에서 사용함. (미래에 일이 일어남)
    //
    // final response = await http.get(url)
    //
    // 응답 받은걸 써먹고싶어서 새로 변수 선언.

    if (response.statusCode == 200) {
      //상태 코드가 200이면 성공!
      print(response.body);
      return;
    } else {
      throw Error();
    }
  }
}
