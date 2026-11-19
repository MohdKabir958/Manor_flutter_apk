import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'manor_data.dart';

abstract final class ManorStyle {
  static const dark=Color(0xFF252C2D);
  static const teal=Color(0xFFC77A63);
  static const tealDeep=Color(0xFFA55D49);
  static const paper=Color(0xFFFAFAF8);
  static const pale=Color(0xFFF2F4F3);
  static const line=Color(0xFFE4E7E5);
  static const muted=Color(0xFF717A79);
  static ThemeData theme(){
    final base=ThemeData(useMaterial3:true,brightness:Brightness.light,
      colorScheme:ColorScheme.fromSeed(seedColor:teal,primary:teal,surface:paper),
      scaffoldBackgroundColor:paper);
    return base.copyWith(
      textTheme:GoogleFonts.montserratTextTheme(base.textTheme).apply(bodyColor:dark,displayColor:dark),
      appBarTheme:AppBarTheme(backgroundColor:paper,foregroundColor:dark,elevation:0,scrolledUnderElevation:0,titleTextStyle:GoogleFonts.montserrat(fontSize:17,fontWeight:FontWeight.w600,color:dark)),
      inputDecorationTheme:InputDecorationTheme(
        filled:true,fillColor:Colors.white,contentPadding:const EdgeInsets.symmetric(horizontal:16,vertical:17),
        border:OutlineInputBorder(borderRadius:BorderRadius.circular(5),borderSide:const BorderSide(color:line)),
        enabledBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(5),borderSide:const BorderSide(color:line)),
        focusedBorder:OutlineInputBorder(borderRadius:BorderRadius.circular(5),borderSide:const BorderSide(color:teal,width:1.5))),
      navigationBarTheme:NavigationBarThemeData(backgroundColor:Colors.white,indicatorColor:teal.withValues(alpha:.12),labelTextStyle:WidgetStatePropertyAll(GoogleFonts.montserrat(fontSize:10,fontWeight:FontWeight.w600,color:dark))),
    );
  }
  static TextStyle heading({double size=29,Color color=dark})=>GoogleFonts.montserrat(fontSize:size,height:1.22,color:color,fontWeight:FontWeight.w700,letterSpacing:-.6);
  static TextStyle body({double size=13.5,Color color=muted})=>GoogleFonts.montserrat(fontSize:size,height:1.8,color:color);
}
class ManorPhoto extends StatelessWidget {
  final String url;final double? height;final BorderRadius? radius;final BoxFit fit;
  const ManorPhoto({super.key,required this.url,this.height,this.radius,this.fit=BoxFit.cover});
  @override Widget build(BuildContext context){
    Widget errorPhoto()=>Container(color:ManorStyle.dark,alignment:Alignment.center,child:const Icon(Icons.bedroom_parent_outlined,size:56,color:Colors.white70));
    final Widget picture=url.startsWith('assets/')
      ? Image.asset(url,fit:fit,errorBuilder:(_,__,___)=>errorPhoto())
      : Image.network(url,fit:fit,
         loadingBuilder:(c,child,progress)=>progress==null?child:Container(color:ManorStyle.pale,alignment:Alignment.center,child:const CircularProgressIndicator(strokeWidth:2,color:ManorStyle.teal)),
         errorBuilder:(_,__,___)=>errorPhoto());
    final view=SizedBox(height:height,width:double.infinity,child:picture);
    return ClipRRect(borderRadius:radius??BorderRadius.zero,child:view);
  }
}
class ManorLogo extends StatelessWidget {
 final bool light;final double size;const ManorLogo({super.key,this.light=false,this.size=29});
 @override Widget build(BuildContext c)=>Column(mainAxisSize:MainAxisSize.min,crossAxisAlignment:CrossAxisAlignment.start,children:[
 Text('Mahogany Manor',maxLines:1,overflow:TextOverflow.ellipsis,style:GoogleFonts.greatVibes(fontSize:size,color:light?Colors.white:ManorStyle.dark,height:1.12)),
 Text('BED & BREAKFAST',style:GoogleFonts.montserrat(fontSize:7.5,fontWeight:FontWeight.w700,letterSpacing:2.1,color:light?Colors.white70:ManorStyle.muted)),
 ]);
}
class ManorTopBar extends StatelessWidget {
 final VoidCallback onMenu;final VoidCallback onBook;const ManorTopBar({super.key,required this.onMenu,required this.onBook});
 @override Widget build(BuildContext c)=>Container(height:69,color:Colors.white,child:Padding(padding:const EdgeInsets.symmetric(horizontal:15),child:Row(children:[
 IconButton(onPressed:onMenu,tooltip:'Open menu',icon:const Icon(Icons.menu_rounded,color:ManorStyle.dark)),
 const Expanded(child:Center(child:ManorLogo(size:28))),
 InkWell(onTap:onBook,borderRadius:BorderRadius.circular(4),child:Container(padding:const EdgeInsets.symmetric(horizontal:11,vertical:10),color:ManorStyle.teal,child:Text('BOOK',style:GoogleFonts.montserrat(color:Colors.white,fontSize:10,fontWeight:FontWeight.bold,letterSpacing:.8))))
 ])));
}
class ManorCta extends StatelessWidget {
 final String label;final VoidCallback onTap;final bool outline;final IconData? icon;final bool expand;
 const ManorCta({super.key,required this.label,required this.onTap,this.outline=false,this.icon,this.expand=true});
 @override Widget build(BuildContext c){
 final child=Padding(padding:const EdgeInsets.symmetric(horizontal:16,vertical:16),child:Row(mainAxisSize:MainAxisSize.min,mainAxisAlignment:MainAxisAlignment.center,children:[
 if(icon!=null)...[Icon(icon,size:16,color:outline?ManorStyle.teal:Colors.white),const SizedBox(width:9)],
 Flexible(child:Text(label,maxLines:1,overflow:TextOverflow.ellipsis,style:GoogleFonts.montserrat(fontWeight:FontWeight.w700,fontSize:11,letterSpacing:.7,color:outline?ManorStyle.teal:Colors.white)))]));
 final button=Material(color:outline?Colors.white:ManorStyle.teal,shape:RoundedRectangleBorder(side:BorderSide(color:outline?ManorStyle.teal:Colors.transparent),borderRadius:BorderRadius.circular(4)),clipBehavior:Clip.antiAlias,child:InkWell(onTap:onTap,child:child));
 return expand?SizedBox(width:double.infinity,child:button):button;
 }
}
class ManorBanner extends StatelessWidget {
 final String title,subtitle,image;final double height;
 const ManorBanner({super.key,required this.title,required this.image,this.subtitle='',this.height=220});
 @override Widget build(BuildContext c)=>SizedBox(height:height,child:Stack(fit:StackFit.expand,children:[
 ManorPhoto(url:image,height:height),
 const DecoratedBox(decoration:BoxDecoration(gradient:LinearGradient(begin:Alignment.topCenter,end:Alignment.bottomCenter,colors:[Color(0x99090F12),Color(0xB3212A2E)]))),
 Padding(padding:const EdgeInsets.all(20),child:Column(mainAxisAlignment:MainAxisAlignment.center,children:[
 const SizedBox(height:4),Container(height:1,width:43,color:Colors.white70),const SizedBox(height:16),
 Text(title,textAlign:TextAlign.center,style:ManorStyle.heading(size:title.length>30?23:29,color:Colors.white)),
 if(subtitle.isNotEmpty)...[const SizedBox(height:10),Text(subtitle,textAlign:TextAlign.center,style:ManorStyle.body(size:11.5,color:Colors.white70))],
 const SizedBox(height:17),Container(height:1,width:43,color:Colors.white70)
 ]))
 ]));
}
class ManorHeading extends StatelessWidget {
 final String kicker,title;final TextAlign align;const ManorHeading({super.key,required this.title,this.kicker='',this.align=TextAlign.left});
 @override Widget build(BuildContext c)=>Column(crossAxisAlignment:align==TextAlign.center?CrossAxisAlignment.center:CrossAxisAlignment.start,children:[
 if(kicker.isNotEmpty)...[Text(kicker.toUpperCase(),style:GoogleFonts.montserrat(color:ManorStyle.teal,fontSize:10.5,fontWeight:FontWeight.bold,letterSpacing:2.4)),const SizedBox(height:9)],
 Text(title,textAlign:align,style:ManorStyle.heading()),const SizedBox(height:12),Container(width:47,height:2,color:ManorStyle.teal)]);
}
class ManorCard extends StatelessWidget {
 final Widget child;const ManorCard({super.key,required this.child});
 @override Widget build(BuildContext c)=>Container(decoration:BoxDecoration(color:Colors.white,borderRadius:BorderRadius.circular(7),border:Border.all(color:ManorStyle.line),boxShadow:[BoxShadow(color:Colors.black.withValues(alpha:.025),blurRadius:19,offset:const Offset(0,9))]),clipBehavior:Clip.antiAlias,child:child);
}
class ManorAmenities extends StatelessWidget{
 final bool compact;const ManorAmenities({super.key,this.compact=false});
 @override Widget build(BuildContext c)=>Wrap(spacing:12,runSpacing:12,children:amenityItems.take(compact?4:6).map((a)=>Container(width:compact?140:150,padding:const EdgeInsets.symmetric(vertical:12,horizontal:10),decoration:BoxDecoration(border:Border.all(color:ManorStyle.line),borderRadius:BorderRadius.circular(5)),child:Row(children:[Icon(a.icon,size:18,color:ManorStyle.teal),const SizedBox(width:8),Expanded(child:Text(a.label,maxLines:2,style:ManorStyle.body(size:10.5,color:ManorStyle.dark)))]))).toList());
}
class ManorFooter extends StatelessWidget{
 const ManorFooter({super.key});
 @override Widget build(BuildContext c)=>Container(color:ManorStyle.dark,padding:const EdgeInsets.symmetric(horizontal:24,vertical:31),child:Column(crossAxisAlignment:CrossAxisAlignment.start,children:[
 const ManorLogo(light:true,size:38),const SizedBox(height:20),Text('A historic welcome in the heart of Saint John.',style:ManorStyle.body(color:Colors.white70)),
 const SizedBox(height:20),Text(propertyAddress,style:ManorStyle.body(color:Colors.white70,size:11)),
 Text(propertyEmail,style:ManorStyle.body(color:Colors.white70,size:11)),
 Text(propertyPhone,style:ManorStyle.body(color:Colors.white70,size:11)),
 const SizedBox(height:19),Text('© Mahogany Manor  •  Flutter Client Concept',style:ManorStyle.body(size:9.5,color:Colors.white54))
 ]));
}
