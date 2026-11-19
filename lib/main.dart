import 'package:flutter/material.dart';
import 'manor_data.dart';
import 'manor_style.dart';
import 'manor_screens.dart';

void main()=>runApp(const ManorApp());

class ManorApp extends StatelessWidget {
 const ManorApp({super.key});
 @override Widget build(BuildContext context)=>MaterialApp(
   debugShowCheckedModeBanner:false,
   title:'Mahogany Manor | Bed & Breakfast',
   theme:ManorStyle.theme(),
   home:const ManorShell(),
 );
}

class ManorShell extends StatefulWidget {
 const ManorShell({super.key});
 @override State<ManorShell> createState()=>_ManorShellState();
}

class _ManorShellState extends State<ManorShell> {
 int selected=0;
 String? signedInEmail;
 void visit(Widget page)=>Navigator.of(context).push(MaterialPageRoute(builder:(_)=>page));
 void room(ManorRoom r)=>visit(ManorRoomDetails(room:r));
 void category(String c)=>visit(ManorCategory(category:c,onRoom:room));
 void booking([ManorRoom? room])=>visit(ManorBooking(room:room));
 void about()=>visit(const ManorAbout());
 void auth()=>visit(ManorAuth(onSuccess:(email)=>setState(()=>signedInEmail=email)));
 void select(int tab){setState(()=>selected=tab);Navigator.of(context).popUntil((route)=>route.isFirst);}
 void menu(){
   showModalBottomSheet<void>(context:context,showDragHandle:true,isScrollControlled:true,backgroundColor:Colors.white,
    builder:(sheet)=>SafeArea(child:Padding(padding:const EdgeInsets.fromLTRB(20,12,20,22),
    child:Column(mainAxisSize:MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.start,children:[
      const ManorLogo(size:38),const SizedBox(height:17),
      ...<({String title,IconData icon,VoidCallback action})>[
        (title:'Home',icon:Icons.home_outlined,action:()=>select(0)),
        (title:'About Us',icon:Icons.info_outline,action:about),
        (title:'Our Rooms',icon:Icons.bed_outlined,action:()=>select(1)),
        (title:'Standard Rooms',icon:Icons.meeting_room_outlined,action:()=>category('Standard')),
        (title:'Deluxe Rooms',icon:Icons.star_border,action:()=>category('Deluxe')),
        (title:'Gallery',icon:Icons.photo_library_outlined,action:()=>select(2)),
        (title:'Contact Us',icon:Icons.mail_outline,action:()=>select(3)),
        (title:'Guest Account',icon:Icons.person_outline,action:()=>select(4)),
      ].map((entry)=>ListTile(leading:Icon(entry.icon,color:ManorStyle.teal,size:21),title:Text(entry.title),
       onTap:(){Navigator.of(sheet).pop();entry.action();})),
      const SizedBox(height:8),ManorCta(label:'REQUEST A RESERVATION',icon:Icons.calendar_month_outlined,onTap:(){Navigator.of(sheet).pop();booking();}),
    ]))));
 }
 @override Widget build(BuildContext context) {
   final pages=<Widget>[
    ManorHome(onRooms:()=>select(1),onAbout:about,onCategory:category,onRoom:room,onBooking:()=>booking()),
    ManorRoomCategories(onCategory:category),
    const ManorGallery(),
    const ManorContact(),
    ManorAccount(email:signedInEmail,onLogin:auth,onAbout:about,onLogout:()=>setState(()=>signedInEmail=null)),
   ];
   return Scaffold(
    body:SafeArea(child:Column(children:[
      ManorTopBar(onMenu:menu,onBook:()=>booking()),
      Expanded(child:IndexedStack(index:selected,children:pages)),
    ])),
    bottomNavigationBar:NavigationBar(
      height:70,selectedIndex:selected,onDestinationSelected:(value)=>setState(()=>selected=value),
      labelBehavior:NavigationDestinationLabelBehavior.alwaysShow,
      destinations:const [
        NavigationDestination(icon:Icon(Icons.home_outlined),selectedIcon:Icon(Icons.home_rounded),label:'Home'),
        NavigationDestination(icon:Icon(Icons.bed_outlined),selectedIcon:Icon(Icons.bed_rounded),label:'Rooms'),
        NavigationDestination(icon:Icon(Icons.photo_library_outlined),selectedIcon:Icon(Icons.photo_library_rounded),label:'Gallery'),
        NavigationDestination(icon:Icon(Icons.mail_outline),selectedIcon:Icon(Icons.mail_rounded),label:'Contact'),
        NavigationDestination(icon:Icon(Icons.person_outline),selectedIcon:Icon(Icons.person_rounded),label:'Account'),
      ],
    ),
   );
 }
}
