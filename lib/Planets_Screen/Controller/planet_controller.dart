
import 'package:get/get.dart';
import 'package:planets_app/Planets_Screen/Model/planet_model.dart';

class PlanetController extends GetxController
{
  RxList<PlanetModel> list = <PlanetModel>[
    PlanetModel(name: 'Mars',d:'54.6m Km' ,s:'3.7 m/s',dis: '250.19 million km',dis1: '327.48 million km',img: 'assets/images/mars.png',info: 'Mars is the fourth planet from the Sun – a dusty, cold, desert world with a very thin atmosphere. Mars is also a dynamic planet with seasons, polar ice caps, canyons, extinct volcanoes, and evidence that it was even more active in the past.' ),
    PlanetModel(name: 'Neptune',d:'2.7b Km' ,s:'11.5 m/s',dis: '4.4731 billion km',dis1: '4.4526 billion km' ,img: 'assets/images/neptune.png',info: "Neptune is one of two ice giants in the outer solar system (the other is Uranus). Most (80% or more) of the planet's mass is made up of a hot dense fluid of icy materials – water, methane, and ammonia – above a small, rocky core. Of the giant planets, Neptune is the densest." ),
    PlanetModel(name: 'Moon',d:'384.4k Km' ,s:'1.62 m/s',dis: '93 million miles',dis1: '384,400 km' ,img: 'assets/images/moon.png',info: "Earth's Moon is the fifth largest of the 200+ moons orbiting planets in our solar system. Earth's only natural satellite is simply called the Moon because people didn't know other moons existed until Galileo Galilei discovered four moons orbiting Jupiter in 1610."),
    PlanetModel(name: 'Earth',d:'149.6m Km' ,s:'9.7 m/s',dis: '152.07 million km' ,dis1: '24,901 miles ',img: 'assets/images/earth.png',info: "While Earth is only the fifth largest planet in the solar system, it is the only world in our solar system with liquid water on the surface. Just slightly larger than nearby Venus, Earth is the biggest of the four planets closest to the Sun, all of which are made of rock and metal."),
    PlanetModel(name: 'Mercury',d:'57.9m Km' ,s:'3.7 m/s',dis: '46.109 million km',dis1: '194.47 million km',img: 'assets/images/mercury.png',info: "Mercury is the smallest planet in our solar system. It's a little bigger than Earth's Moon. It is the closest planet to the Sun, but it's actually not the hottest. Venus is hotter." ),
    PlanetModel(name: 'Jupiter',d:'778.6m Km' ,s:'27.92 m/s',dis: '741.64 million km',dis1: '815.72 million km',img: 'assets/images/jupiter.png',info: "Jupiter is the fifth planet from our Sun and is, by far, the largest planet in the solar system – more than twice as massive as all the other planets combined. Jupiter's stripes and swirls are actually cold, windy clouds of ammonia and water, floating in an atmosphere of hydrogen and helium." ),
  ].obs;
}