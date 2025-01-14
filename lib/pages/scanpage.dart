import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'dart:typed_data';

class Scanpage extends StatefulWidget {
  const Scanpage({super.key});

  @override
  State<Scanpage> createState() => _ScanpageState();
}

class _ScanpageState extends State<Scanpage> {
  late List<CameraDescription> cameras;
  late CameraController cameraController;
  late FaceDetector faceDetector;
  List<Face> detectedFaces = [];

  Future<void> initCamera() async {
    cameras = await availableCameras();
    cameraController = CameraController(
      cameras[0],
      ResolutionPreset.medium,
    );
    await cameraController.initialize();
    setState(() {}); 
  }


Future<void> detectFaces(CameraImage image) async {
  final bytes = Uint8List.fromList(
    image.planes.fold<List<int>>(
      [],
      (buffer, plane) => buffer..addAll(plane.bytes),
    ),
  );

  final metadata = InputImageMetadata(
    size: Size(image.width.toDouble(), image.height.toDouble()),
    rotation: InputImageRotation.rotation0deg,
    format: InputImageFormat.nv21,
    bytesPerRow: image.planes[0].bytesPerRow, 
  );

  final inputImage = InputImage.fromBytes(
    bytes: bytes,
    metadata: metadata,
  );

  final faces = await faceDetector.processImage(inputImage);

  setState(() {
    detectedFaces = faces;
  });
}


  List<Widget> buildFaceBoxes(List<Face> faces) {
    return faces.map((face) {
      return Positioned(
        left: face.boundingBox.left,
        top: face.boundingBox.top,
        width: face.boundingBox.width,
        height: face.boundingBox.height,
        child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.red, width: 2),
          ),
        ),
      );
    }).toList();
  }

  @override
  void initState() {
    super.initState();

    faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableLandmarks: true,
      ),
    );

    initCamera().then((_) {
      if (cameraController.value.isInitialized) {
        cameraController.startImageStream((image) {
          detectFaces(image);
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Face Detection')),
      body: cameraController.value.isInitialized
          ? Stack(
              children: [
                CameraPreview(cameraController),
                ...buildFaceBoxes(detectedFaces),
              ],
            )
          : const Center(child: CircularProgressIndicator()),
    );
  }

  @override
  void dispose() {
    cameraController.dispose();
    faceDetector.close();
    super.dispose();
  }
}
