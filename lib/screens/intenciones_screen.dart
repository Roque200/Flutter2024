import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class  IntencionesSreen extends StatelessWidget {
  const IntencionesSreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intenciones :'),),
      body: GridView(
        padding: const EdgeInsets.all(8),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8
          ),
        children: [
            intentCar(icon: Icons.web_stories, title: 'https://celaya.tecnm.mx',sizeLetter: 20, actionFunction: openWeb),
            intentCar(title: 'tel:4131155811' , icon: Icons.phone_android_rounded,sizeLetter: 20,actionFunction: callPhone),
            intentCar( title: 'SMS:413115581',icon: Icons.sms , sizeLetter: 20,actionFunction: sendSMS),
            intentCar(title: 'Email:21031190@itcelaya.edu.mx', icon: Icons.email,sizeLetter: 15,actionFunction: sendEmail)
        ],
      ),
    );
  }
  openWeb() async {
        Uri uri = Uri.parse('https://celaya.tecnm.mx');
    if (await canLaunchUrl(uri) ){
          launchUrl(uri);
    } 
  }
  callPhone() async{
    Uri uri = Uri.parse('tel:4131155811');
      if( await canLaunchUrl(uri)){
        launchUrl(uri);
      }
    }
  sendSMS() async{
      Uri uri = Uri.parse('sms:4131155811');
      if( await canLaunchUrl(uri)){
        launchUrl(uri);
      }
  }
  sendEmail() async{
      Uri uri = Uri(
            scheme: 'mailto',
            path: '21031190@itcelaya.edu.mx',
            query: 'sublect=Hola mundo!!)%body=van a pasar)'
      );

      if ( await canLaunchUrl(uri) ) {
        launchUrl(uri);
        
      }
     
  }

  Widget intentCar({required String title,required IconData icon, double sizeLetter = 25, Function()? actionFunction}){
    return GestureDetector(
      onTap: actionFunction,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
            color: Colors.blueAccent[100]
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 80,),
            Text(title,style: TextStyle(fontSize: sizeLetter),)
          ],
        ),
      ),
    );
  }


}