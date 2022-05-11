import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getstorage/view/homepage/after_home.dart';
import 'package:getstorage/widgets/my_messanger.dart';

class HomePage extends StatelessWidget {
  HomePage({ Key? key }) : super(key: key);
  int count = 0;
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextFormField(
          controller: controller,
        ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () async{ 
            if(GetStorage().read('ping') == null){
              await GetStorage().write('ping', controller.text);
              Navigator.push(context, MaterialPageRoute(builder: ((context) => AfterHomePage())));
            }else if(GetStorage().read('ping') == controller.text){
              if (count <= 1) {
                Navigator.push(context, MaterialPageRoute(builder: ((context) => AfterHomePage())));
              }
            }else {
              if(count  == 2) {
                MyMessenger.messenger(context, "Siz uch marta codni hato kiritdiz", Colors.red);
                await Future.delayed(const Duration(seconds: 10)).then((value) => (){count = 0;});
              }else{
                count +=1;
                print(count);
                print("xato");
              }
            }
        }),
    );
  }
}