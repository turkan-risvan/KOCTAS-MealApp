// import 'package:flutter/material.dart';
// import 'package:url_launcher/url_launcher.dart';

// class VideoPlayerPage extends StatelessWidget {
//   final String videoUrl;

//   const VideoPlayerPage({Key? key, required this.videoUrl}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Video Player'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             _launchVideo(videoUrl);
//           },
//           child: Text('Play Video'),
//         ),
//       ),
//     );
//   }

//   void _launchVideo(String url) async {
//     if (await canLaunch(url)) {
//       await launch(url);
//     } else {
//       throw 'Could not launch $url';
//     }
//   }
// }
