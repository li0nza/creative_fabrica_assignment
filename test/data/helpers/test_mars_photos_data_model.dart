import 'package:creative_fabrica_assignment/domain/entities/mars_photos.dart';

abstract class TestMarsPhotosModel {
  static MarsPhotos tMarsPhotos = MarsPhotos(photos: [
    Photo(
      id: 102693,
      sol: 1000,
      camera: const Camera(id: 20, name: "FHAZ", roverId: 5, fullName: "Front Hazard Avoidance Camera"),
      imgSrc:
          "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG",
      earthDate: DateTime.parse("2015-05-30"),
      rover: Rover(
          id: 5,
          name: "Curiosity",
          landingDate: DateTime.parse("2012-08-06"),
          launchDate: DateTime.parse("2011-11-26"),
          status: "active"),
    )
  ]);
}
