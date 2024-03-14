import 'package:anjumali/Controller/chatScreenController%20.dart';
import 'package:anjumali/constanst.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final ApiController controller = Get.put(ApiController());
  bool isloading = true;
  @override
  Widget build(BuildContext context) {
    //sendData= controller.textEditingController.text;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: 'Evidence Based Medicine'.text.white.make(),
        centerTitle: true,
        backgroundColor: Colors.grey.shade400,
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: controller.responseList.length,
                      itemBuilder: (context, index) {
                        return Card(
                          margin: EdgeInsets.all(10),
                          child: ListTile(
                              title: Text("${controller.senddata[index]}"),
                              subtitle: Text(
                                "${controller.responseList[index]}",
                              )),
                        );
                      },
                    );
                  })),
              Align(
                alignment: Alignment.bottomCenter,
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                    controller: controller.textEditingController,
                    decoration: InputDecoration(
                        hintText: "Enter Clinical Question...",
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black)),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: Colors.black)),
                        suffixIcon: IconButton(
                          onPressed: () {
                            //controller.textEditingController.clear();
                            controller.sendRequest(
                                controller.textEditingController.text);
                          },
                          icon: Icon(
                            Icons.send,
                            color: Colors.grey.shade500,
                          ),
                        )),
                  ).box.color(Colors.grey.shade100).rounded.make(),
                ),
              )
            ],
          ),
          Obx(() => Visibility(
              visible: controller.isloading.value,
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    "Generating".text.make(),
                    10.heightBox,
                    Container(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
                    .box
                    .white
                    .outerShadow
                    .padding(EdgeInsets.all(16))
                    .roundedSM
                    .make(),
              )))
        ],
      ),
    );
  }
}

//
