import 'package:flutter/material.dart';
import 'package:model_viewer_plus/model_viewer_plus.dart';

class CarDisplay extends StatelessWidget {
  const CarDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return  Transform.scale(
      scale: 1.8,
      child: const SizedBox(
        height: 200,
        child: ModelViewer(
          src: 'assets/cars/car.glb',
          autoPlay: false,
          autoRotate: false,
          cameraControls: false,
          cameraOrbit: "35deg",
          debugLogging: false,
        ),
      ),
    );
  }
}
