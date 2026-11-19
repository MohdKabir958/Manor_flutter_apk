import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'manor_data.dart';
import 'manor_style.dart';

void visit(BuildContext c,Widget page)=>Navigator.push(c,MaterialPageRoute(builder:(_)=>page));
Widget copy(String value)=>Text(value,style:ManorStyle.body());

class ManorHome extends StatelessWidget{
 final VoidCallback onRooms,onAbout,onBooking;
 final ValueChanged<String> onCategory;
 final ValueChanged<ManorRoom> onRoom;
 const ManorHome({super.key,required this.onRooms,required this.onAbout,required this.onBooking,required this.onCategory,required this.onRoom});
 @override Widget build(BuildContext c)=>ListView(children:[
 SizedBox(height:405,child:Stack(fit:StackFit.expand,children:[
  const ManorPhoto(url:ManorImages.exterior,height:405),
  const DecoratedBox(decoration:BoxDecoration(gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,colors:[Color(0x70151A1C),Color(0xD51C2729)]))),
  Padding(padding:const EdgeInsets.all(27),child:Column(crossAxisAlignment:CrossAxisAlignment.start,mainAxisAlignment:MainAxisAlignment.end,children:[
   Text('WELCOME TO',style:GoogleFonts.montserrat(fontSize:11,letterSpacing:3,color:Colors.white70,fontWeight:FontWeight.w600)),
   const SizedBox(height:8),Text('MAHOGANY\nMANOR',style:ManorStyle.heading(size:39,color:Colors.white)),
   const SizedBox(height:9),Text('Bed & Breakfast · Saint John, New Brunswick',style:ManorStyle.body(size:11,color:Colors.white)),
   const SizedBox(height:23),ManorCta(label:'EXPLORE OUR ROOMS',icon:Icons.arrow_forward_rounded,onTap:onRooms)
  ]))
 ])),
 Container(padding:const EdgeInsets.all(25),color:Colors.white,child:Column(children:[
  const ManorHeading(kicker:'HERITAGE HOSPITALITY',title:'Welcome to Mahogany Manor',align:TextAlign.center),
  const SizedBox(height:18),Text('Discover the charm of a historic bed & breakfast in the heart of Saint John. Beautiful spaces, thoughtful details and a warm welcome await.',textAlign:TextAlign.center,style:ManorStyle.body()),
  const SizedBox(height:21),ManorCta(label:'DISCOVER OUR STORY',outline:true,onTap:onAbout)
 ])),
 Padding(padding:const EdgeInsets.fromLTRB(20,30,20,18),child:const ManorHeading(kicker:'REST IN COMFORT',title:'Our Rooms')),
 ...['Standard','Deluxe'].map((cat)=>Padding(padding:const EdgeInsets.fromLTRB(15,0,15,15),child:ManorCard(child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
  ManorPhoto(url:cat=='Standard'?ManorImages.bedroomBlue:ManorImages.bedroomBay,height:200),
  Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   Text(cat+' Rooms',style:ManorStyle.heading(size:23)),const SizedBox(height:7),
   Text(cat=='Standard'?'Silhouette · Garden Chamber':'Mahogany Rest · Cranberry Wine',style:ManorStyle.body()),
   const SizedBox(height:9),Text(cat=='Standard'?'FROM CAD \$130 / NIGHT':'FROM CAD \$140 / NIGHT',style:GoogleFonts.montserrat(color:ManorStyle.teal,fontSize:10,fontWeight:FontWeight.bold)),
   const SizedBox(height:15),ManorCta(label:'VIEW '+cat.toUpperCase()+' ROOMS',onTap:()=>onCategory(cat))
  ]))
 ])))),
 Container(color:Colors.white,padding:const EdgeInsets.all(21),child:const Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
  ManorHeading(kicker:'AMENITIES',title:'Feel Right at Home'),SizedBox(height:22),ManorAmenities()
 ])),
 Padding(padding:const EdgeInsets.all(21),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
  const ManorHeading(kicker:'GUEST EXPERIENCES',title:'Kind Words'),const SizedBox(height:20),
  ...reviews.take(2).map((r)=>Padding(padding:const EdgeInsets.only(bottom:12),child:ManorCard(child:Padding(padding:const EdgeInsets.all(16),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   const Text('★★★★★',style:TextStyle(color:ManorStyle.teal,letterSpacing:2)),
   const SizedBox(height:12),Text('“'+r.text+'”',maxLines:4,overflow:TextOverflow.ellipsis,style:ManorStyle.body(size:12)),
   const SizedBox(height:10),Text(r.name,style:GoogleFonts.montserrat(fontWeight:FontWeight.w700,fontSize:11))
  ]))))),
  const SizedBox(height:10),ManorCta(label:'REQUEST YOUR STAY',onTap:onBooking)
 ])),
 const ManorFooter()
 ]);
}

class ManorAbout extends StatelessWidget {
 const ManorAbout({super.key});
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('About Us')),body:ListView(children:[
  const ManorBanner(title:'About Us',subtitle:'The Mahogany Manor story',image:ManorImages.exterior),
  Padding(padding:const EdgeInsets.all(22),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   const ManorHeading(kicker:'HERITAGE & HOSPITALITY',title:'Our Story'),const SizedBox(height:19),copy(aboutText),
   const SizedBox(height:26),const ManorPhoto(url:ManorImages.dining,height:230,radius:BorderRadius.all(Radius.circular(6))),
   const SizedBox(height:28),const ManorHeading(kicker:'YOUR COMFORT',title:'A Memorable Stay'),const SizedBox(height:20),const ManorAmenities()
  ])),
  const ManorFooter()
 ]));
}

class ManorRoomCategories extends StatelessWidget {
 final ValueChanged<String> onCategory;const ManorRoomCategories({super.key,required this.onCategory});
 @override Widget build(BuildContext c)=>ListView(children:[
  const ManorBanner(title:'Our Rooms',subtitle:'Classic character. Modern comfort.',image:ManorImages.bedroomBay),
  Padding(padding:const EdgeInsets.fromLTRB(20,25,20,16),child:const ManorHeading(kicker:'ACCOMMODATION',title:'Rooms & Suites')),
  ...['Standard','Deluxe'].map((cat)=>Padding(padding:const EdgeInsets.fromLTRB(15,0,15,17),child:ManorCard(child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
   ManorPhoto(url:cat=='Standard'?ManorImages.bedroomBlue:ManorImages.bedroomBay,height:220),
   Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
    Text(cat+' Rooms',style:ManorStyle.heading(size:24)),const SizedBox(height:7),
    Text(cat=='Standard'?'Silhouette · Garden Chamber':'Mahogany Rest · Cranberry Wine',style:ManorStyle.body()),
    const SizedBox(height:16),ManorCta(label:'EXPLORE '+cat.toUpperCase()+' ROOMS',onTap:()=>onCategory(cat))
   ]))
  ])))),
  const ManorFooter()
 ]);
}

class ManorCategory extends StatelessWidget {
 final String category;final ValueChanged<ManorRoom> onRoom;
 const ManorCategory({super.key,required this.category,required this.onRoom});
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text(category+' Rooms')),body:ListView(children:[
  ManorBanner(title:category+' Rooms',subtitle:'Explore the collection',image:category=='Standard'?ManorImages.bedroomBlue:ManorImages.bedroomBay),
  Padding(padding:const EdgeInsets.all(21),child:ManorHeading(kicker:'ROOM COLLECTION',title:category=='Standard'?'Classic Comfort':'Timeless Luxury')),
  ...allRooms.where((r)=>r.category==category).map((r)=>Padding(padding:const EdgeInsets.fromLTRB(15,0,15,16),child:ManorRoomCard(room:r,onOpen:()=>onRoom(r)))),
  const ManorFooter()
 ]));
}

class ManorRoomCard extends StatelessWidget {
 final ManorRoom room;final VoidCallback onOpen;
 const ManorRoomCard({super.key,required this.room,required this.onOpen});
 @override Widget build(BuildContext c)=>ManorCard(child:Column(crossAxisAlignment:CrossAxisAlignment.stretch,children:[
  ManorPhoto(url:room.image,height:215),
  Padding(padding:const EdgeInsets.all(18),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   Text(room.name,style:ManorStyle.heading(size:23)),const SizedBox(height:8),Text(room.subtitle,style:ManorStyle.body()),
   const SizedBox(height:12),Row(children:[const Icon(Icons.bed_outlined,color:ManorStyle.teal),const SizedBox(width:9),Text(room.bed,style:ManorStyle.body())]),
   const SizedBox(height:9),Text('FROM CAD \$'+room.sampleRate.toString()+' / NIGHT',style:GoogleFonts.montserrat(fontSize:11,fontWeight:FontWeight.w700,color:ManorStyle.teal)),
   const SizedBox(height:15),ManorCta(label:'VIEW ROOM DETAILS',onTap:onOpen)
  ]))
 ]));
}

class ManorRoomDetails extends StatelessWidget {
 final ManorRoom room;const ManorRoomDetails({super.key,required this.room});
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text(room.name)),body:ListView(children:[
  ManorBanner(title:room.name,subtitle:room.category+' Room',image:room.image,height:260),
  Padding(padding:const EdgeInsets.all(22),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   Text(room.subtitle,style:ManorStyle.heading(size:26)),const SizedBox(height:18),copy(room.description),
   const SizedBox(height:22),Container(padding:const EdgeInsets.all(15),color:ManorStyle.pale,child:Row(children:[
    const Icon(Icons.bed_outlined,color:ManorStyle.teal),const SizedBox(width:10),Expanded(child:Text(room.bed,style:ManorStyle.body(size:11,color:ManorStyle.dark))),
    Text('CAD \$'+room.sampleRate.toString(),style:GoogleFonts.montserrat(fontSize:12,fontWeight:FontWeight.w700,color:ManorStyle.teal))
   ])),
   const SizedBox(height:29),const ManorHeading(kicker:'ROOM FEATURES',title:'Amenities'),
   const SizedBox(height:19),const ManorAmenities(compact:true),
   const SizedBox(height:22),Text('Displayed rates are indicative. Live rates and availability are not connected.',style:ManorStyle.body(size:11)),
   const SizedBox(height:15),ManorCta(label:'REQUEST THIS ROOM',icon:Icons.calendar_month_outlined,onTap:()=>visit(c,ManorBooking(room:room)))
  ])),const ManorFooter()
 ]));
}

class ManorGallery extends StatelessWidget {
 const ManorGallery({super.key});
 @override Widget build(BuildContext c)=>ListView(children:[
  const ManorBanner(title:'Photo Gallery',subtitle:'Explore the Manor',image:ManorImages.dining),
  Padding(padding:const EdgeInsets.all(21),child:const ManorHeading(kicker:'OUR BEAUTIFUL SPACES',title:'Life at the Manor')),
  Padding(padding:const EdgeInsets.symmetric(horizontal:12),child:LayoutBuilder(builder:(c,box)=>GridView.builder(
   itemCount:ManorImages.gallery.length,shrinkWrap:true,physics:const NeverScrollableScrollPhysics(),
   gridDelegate:SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount:box.maxWidth>=500?3:2,mainAxisSpacing:8,crossAxisSpacing:8,childAspectRatio:.96),
   itemBuilder:(c,i)=>Material(clipBehavior:Clip.antiAlias,borderRadius:BorderRadius.circular(5),child:InkWell(
    onTap:()=>visit(c,ManorGalleryViewer(index:i)),child:ManorPhoto(url:ManorImages.gallery[i])))))),
  const SizedBox(height:28),const ManorFooter()
 ]);
}
class ManorGalleryViewer extends StatefulWidget {
 final int index;const ManorGalleryViewer({super.key,required this.index});
 @override State<ManorGalleryViewer> createState()=>_ViewerState();
}
class _ViewerState extends State<ManorGalleryViewer>{
 late final PageController pages=PageController(initialPage:widget.index);late int index=widget.index;
 @override void dispose(){pages.dispose();super.dispose();}
 @override Widget build(BuildContext c)=>Scaffold(backgroundColor:Colors.black,appBar:AppBar(backgroundColor:Colors.black,foregroundColor:Colors.white,title:Text('Image '+(index+1).toString()+' of '+ManorImages.gallery.length.toString())),
 body:PageView.builder(controller:pages,onPageChanged:(n)=>setState(()=>index=n),itemCount:ManorImages.gallery.length,itemBuilder:(c,i)=>
 InteractiveViewer(child:Center(child:ManorPhoto(url:ManorImages.gallery[i],fit:BoxFit.contain)))));
}

class ManorTextField extends StatelessWidget {
 final String label;final TextEditingController controller;final bool email,required;final int lines;
 const ManorTextField({super.key,required this.label,required this.controller,this.email=false,this.required=true,this.lines=1});
 @override Widget build(BuildContext c)=>Padding(padding:const EdgeInsets.only(bottom:14),child:TextFormField(
  controller:controller,maxLines:lines,keyboardType:email?TextInputType.email:lines>1?TextInputType.multiline:TextInputType.text,
  decoration:InputDecoration(labelText:label),
  validator:(v){if(required&&(v==null||v.trim().isEmpty))return 'Please enter '+label;if(email&&v!=null&&!RegExp(r'^[^@\s]+@[^@\s]+\.[^@\s]+$').hasMatch(v.trim()))return 'Enter a valid email';return null;}
 ));
}

class ManorContact extends StatefulWidget{const ManorContact({super.key});@override State<ManorContact> createState()=>_ContactState();}
class _ContactState extends State<ManorContact>{
 final key=GlobalKey<FormState>(),name=TextEditingController(),email=TextEditingController(),subject=TextEditingController(),message=TextEditingController();
 @override void dispose(){name.dispose();email.dispose();subject.dispose();message.dispose();super.dispose();}
 @override Widget build(BuildContext c)=>Form(key:key,child:ListView(children:[
  const ManorBanner(title:'Contact Us',subtitle:'We would love to hear from you',image:ManorImages.exterior),
  Padding(padding:const EdgeInsets.all(21),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   const ManorHeading(kicker:'GET IN TOUCH',title:'Send Us a Message'),const SizedBox(height:18),
   copy('Use the form below to preview a contact enquiry. Nothing will be sent to the hotel.'),
   const SizedBox(height:20),ManorTextField(label:'Full name',controller:name),
   ManorTextField(label:'Email address',controller:email,email:true),
   ManorTextField(label:'Subject',controller:subject),
   ManorTextField(label:'Your message',controller:message,lines:4),
   ManorCta(label:'SEND DEMO MESSAGE',icon:Icons.send_outlined,onTap:(){
    if(key.currentState!.validate())visit(c,const ManorSuccess(title:'Message Preview',message:'Your sample enquiry was submitted. No actual message was sent.'));
   }),
   const SizedBox(height:28),const ManorHeading(kicker:'VISIT US',title:'Find the Manor'),const SizedBox(height:17),
   copy(propertyAddress),copy(propertyPhone),copy(propertyEmail),
  ])),const ManorFooter()
 ]));
}

class ManorBooking extends StatefulWidget{final ManorRoom? room;const ManorBooking({super.key,this.room});@override State<ManorBooking> createState()=>_BookingState();}
class _BookingState extends State<ManorBooking>{
 final key=GlobalKey<FormState>(),name=TextEditingController(),email=TextEditingController(),phone=TextEditingController(),notes=TextEditingController();
 DateTime? checkin,checkout;ManorRoom? room;int guests=2;
 @override void initState(){super.initState();room=widget.room;}
 @override void dispose(){name.dispose();email.dispose();phone.dispose();notes.dispose();super.dispose();}
 Future<void> choose(bool first)async{
  final now=DateUtils.dateOnly(DateTime.now());
  final earliest=first?now:(checkin??now).add(const Duration(days:1));
  final last=now.add(const Duration(days:730));
  final d=await showDatePicker(context:context,firstDate:earliest,lastDate:last,initialDate:earliest);
  if(d!=null)setState((){if(first){checkin=d;if(checkout!=null&&!checkout!.isAfter(d))checkout=null;}else{checkout=d;}});
 }
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Booking Enquiry')),body:Form(key:key,child:ListView(children:[
  const ManorBanner(title:'Plan Your Stay',subtitle:'Booking enquiry · Demo only',image:ManorImages.bedroomBay,height:195),
  Padding(padding:const EdgeInsets.all(21),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
   const ManorHeading(kicker:'YOUR GETAWAY',title:'Request a Reservation'),const SizedBox(height:13),
   copy('Select your dates and room, then send a sample enquiry. No reservation will be made.'),
   const SizedBox(height:21),
   DropdownButtonFormField<ManorRoom>(value:room,isExpanded:true,decoration:const InputDecoration(labelText:'Preferred room'),
    items:allRooms.map((r)=>DropdownMenuItem(value:r,child:Text(r.name+' · '+r.category,overflow:TextOverflow.ellipsis))).toList(),
    onChanged:(v)=>setState(()=>room=v),validator:(v)=>v==null?'Select a room':null),
   const SizedBox(height:15),
   Row(children:[
    Expanded(child:_dateTile('CHECK-IN',checkin,()=>choose(true))),
    const SizedBox(width:9),
    Expanded(child:_dateTile('CHECK-OUT',checkout,()=>choose(false)))
   ]),
   const SizedBox(height:17),Row(children:[
    Expanded(child:Text('Guests',style:ManorStyle.heading(size:17))),
    IconButton(onPressed:guests>1?()=>setState(()=>guests--):null,icon:const Icon(Icons.remove_circle_outline,color:ManorStyle.teal)),
    Text(guests.toString()),IconButton(onPressed:guests<10?()=>setState(()=>guests++):null,icon:const Icon(Icons.add_circle_outline,color:ManorStyle.teal))
   ]),
   const SizedBox(height:19),ManorTextField(label:'Full name',controller:name),
   ManorTextField(label:'Email address',controller:email,email:true),
   ManorTextField(label:'Phone number',controller:phone),
   ManorTextField(label:'Special requests',controller:notes,lines:3,required:false),
   const SizedBox(height:5),ManorCta(label:'SUBMIT DEMO ENQUIRY',onTap:(){
    if(!key.currentState!.validate())return;
    if(checkin==null||checkout==null||!checkout!.isAfter(checkin!)){
     ScaffoldMessenger.of(c).showSnackBar(const SnackBar(content:Text('Select valid check-in and check-out dates.')));return;}
    visit(c,ManorSuccess(title:'Enquiry Complete',message:'Your sample enquiry for '+room!.name+' was completed. No real booking was made.'));
   })
  ])),const ManorFooter()
 ])));
 Widget _dateTile(String label,DateTime? date,VoidCallback tap)=>Material(color:Colors.white,shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(4),side:const BorderSide(color:ManorStyle.line)),child:InkWell(onTap:tap,child:Padding(padding:const EdgeInsets.all(12),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
  Text(label,style:GoogleFonts.montserrat(fontSize:10,color:ManorStyle.muted,fontWeight:FontWeight.bold)),
  const SizedBox(height:9),Row(children:[const Icon(Icons.calendar_today_outlined,color:ManorStyle.teal,size:16),const SizedBox(width:6),
   Expanded(child:Text(date==null?'Select date':date.day.toString()+'/'+date.month.toString()+'/'+date.year.toString(),maxLines:1,style:GoogleFonts.montserrat(fontSize:10.5,color:ManorStyle.dark)))])
 ]))));
}

class ManorAccount extends StatelessWidget {
 final String? email;final VoidCallback onLogin,onLogout,onAbout;
 const ManorAccount({super.key,required this.email,required this.onLogin,required this.onLogout,required this.onAbout});
 @override Widget build(BuildContext c)=>ListView(children:[
  const ManorBanner(title:'Guest Account',subtitle:'A welcoming experience',image:ManorImages.bedroomBay,height:180),
  Padding(padding:const EdgeInsets.all(22),child:Column(children:[
   const CircleAvatar(radius:42,backgroundColor:ManorStyle.pale,child:Icon(Icons.person_outline,color:ManorStyle.teal,size:43)),
   const SizedBox(height:20),Text(email==null?'Welcome, Guest':'Welcome Back',style:ManorStyle.heading(size:24)),
   const SizedBox(height:12),Text(email??'Preview our guest sign-in experience.',style:ManorStyle.body()),
   const SizedBox(height:23),ManorCta(label:email==null?'LOGIN / SIGN UP':'LOG OUT',onTap:email==null?onLogin:onLogout),
   const SizedBox(height:13),ManorCta(label:'ABOUT MAHOGANY MANOR',outline:true,onTap:onAbout),
   const SizedBox(height:18),Text('Demo only — no credentials are stored.',style:ManorStyle.body(size:11))
  ])),const ManorFooter()
 ]);
}

class ManorAuth extends StatefulWidget{
 final ValueChanged<String> onSuccess;const ManorAuth({super.key,required this.onSuccess});
 @override State<ManorAuth> createState()=>_AuthState();
}
class _AuthState extends State<ManorAuth>{
 final key=GlobalKey<FormState>(),name=TextEditingController(),email=TextEditingController(),password=TextEditingController();
 bool signup=false,hide=true;
 @override void dispose(){name.dispose();email.dispose();password.dispose();super.dispose();}
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:Text(signup?'Create Account':'Login')),body:Form(key:key,child:ListView(padding:const EdgeInsets.all(22),children:[
  const Center(child:ManorLogo(size:47)),const SizedBox(height:28),
  Text(signup?'Create Demo Account':'Welcome Back',textAlign:TextAlign.center,style:ManorStyle.heading(size:25)),
  const SizedBox(height:12),Text('Preview the guest experience.',textAlign:TextAlign.center,style:ManorStyle.body()),
  const SizedBox(height:27),if(signup)ManorTextField(label:'Full name',controller:name),
  ManorTextField(label:'Email address',controller:email,email:true),
  Padding(padding:const EdgeInsets.only(bottom:17),child:TextFormField(controller:password,obscureText:hide,
   decoration:InputDecoration(labelText:'Password',suffixIcon:IconButton(icon:Icon(hide?Icons.visibility_off_outlined:Icons.visibility_outlined),onPressed:()=>setState(()=>hide=!hide))),
   validator:(v)=>v==null||v.length<6?'Enter at least 6 characters':null)),
  ManorCta(label:signup?'CREATE DEMO ACCOUNT':'SIGN IN',onTap:(){if(key.currentState!.validate()){widget.onSuccess(email.text.trim());Navigator.pop(c);}}),
  const SizedBox(height:9),TextButton(onPressed:()=>setState(()=>signup=!signup),child:Text(signup?'Already registered? Login':'New guest? Sign Up')),
  const SizedBox(height:16),Text('Demo only. No account is created and no password is transmitted or saved.',textAlign:TextAlign.center,style:ManorStyle.body(size:11))
 ])));
}

class ManorSuccess extends StatelessWidget{
 final String title,message;const ManorSuccess({super.key,required this.title,required this.message});
 @override Widget build(BuildContext c)=>Scaffold(appBar:AppBar(title:const Text('Confirmation')),body:Center(child:SingleChildScrollView(padding:const EdgeInsets.all(25),child:Column(mainAxisSize:MainAxisSize.min,children:[
  const Icon(Icons.check_circle_outline_rounded,color:ManorStyle.teal,size:92),
  const SizedBox(height:22),Text(title,style:ManorStyle.heading(size:26),textAlign:TextAlign.center),
  const SizedBox(height:15),Text(message,style:ManorStyle.body(),textAlign:TextAlign.center),
  const SizedBox(height:28),ManorCta(label:'GO BACK',onTap:()=>Navigator.pop(c))
 ]))));
}
