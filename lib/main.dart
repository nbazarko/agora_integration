import 'package:agora_uikit/agora_uikit.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  AgoraClient client = AgoraClient(agoraConnectionData: 
    AgoraConnectionData(
      appId:'cfa03c516b39404b98385605334f5b60', 
      channelName: 'tester', 
      tempToken: '006cfa03c516b39404b98385605334f5b60IABW6Err/q1Fcy774GRy2vxNRHUX64/duCOmb3Lwm5ggAgx+f9i379yDEABqu54FbOu2ZAEAAQD8p7Vk', 
      uid: 3
    ), 
    enabledPermission: [Permission.camera, Permission.microphone,]
  );

@override 
void initState() { 
  super.initState(); 
  initAgora(); 
} 

void initAgora() async { 
  await client.initialize(); 
} 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Stack(
        children: [
          AgoraVideoViewer(client: client,),
          AgoraVideoButtons(client: client,),
        ],
      ),
    );
  }
}
