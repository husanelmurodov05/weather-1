import 'package:flutter/material.dart';
import 'package:weatherapp/model/weathwe_model.dart';
import 'package:weatherapp/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late WeatherModel weatherModel;

  bool isLoading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    Api.getMethod().then((value) {
      setState(() {
        weatherModel = value;
        isLoading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: isLoading
            ? Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 50, horizontal: 30),
                decoration: const BoxDecoration(
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                      Color(0xFF08244F),
                      Color(0xFF134CB5),
                      Color(0xFF0B42AB)
                    ])),
                child: Column(children: [
                  Row(
                    children: [
                      Row(
                        children:  [
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            weatherModel.name!,
                            style: TextStyle(fontSize: 18, color: Colors.white),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 280,
                    height: 207,
                    child: Center(
                      child: Image(image: AssetImage("assets/images/rain.png")),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                   Text(
                    "${weatherModel.temp}ºC",
                    style: TextStyle(
                        fontSize: 64,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: double.infinity,
                    height: 47,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xFF001026).withOpacity(0.4),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Row(
                          children:  [
                            Image(
                                width: 30,
                                height: 30,
                                image: AssetImage("assets/images/slow.png")),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "0%",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children:  [
                            Image(
                                width: 30,
                                height: 30,
                                image: AssetImage("assets/images/hum2.png")),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${weatherModel.hum}%",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                        Row(
                          children:  [
                            Image(
                                width: 30,
                                height: 30,
                                image: AssetImage("assets/images/wind.png")),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              "${weatherModel.speed} km/h",
                              style: TextStyle(color: Colors.white),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ]),
              )
            : Center(child: CircularProgressIndicator()));
  }
}
