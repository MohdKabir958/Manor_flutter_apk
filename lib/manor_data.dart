import 'package:flutter/material.dart';

class ManorImages {
  // Reference photographs of Mahogany Manor from public travel listings.
  // Replace with the client's approved, exact room photography before handoff.
  static const exterior = 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/23/8b/a7/mahogany-manor-bed-and.jpg?h=500&s=1&w=900';
  static const bedroomBlue = 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/a4/7e/fc/habitacion.jpg?h=1200&s=1&w=1200';
  static const bedroomBay = 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/23/52/f6/df/caption.jpg?h=1100&s=1&w=1100';
  static const bedroomRose = 'https://content.skyscnr.com/available/2123884335/2123884335_WxH.jpg';
  static const dining = 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/19/4e/76/ad/photo1jpg.jpg?h=-1&s=1&w=1200';
  static const reading = 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/1b/23/81/8b/mahogany-manor-bed-and.jpg?h=-1&s=1&w=700';
  static const gallery = [exterior, bedroomBay, dining, bedroomBlue, bedroomRose, reading];
}

class ManorRoom {
  final String name, category, subtitle, description, bed, image, slug;
  final int sampleRate;
  const ManorRoom({required this.name,required this.category,required this.subtitle,required this.description,required this.bed,required this.image,required this.slug,required this.sampleRate});
}
const allRooms=<ManorRoom>[
 ManorRoom(name:'Silhouette',category:'Standard',slug:'silhouette',sampleRate:130,bed:'Queen four-poster bed',image:ManorImages.bedroomRose,subtitle:'A haven of quiet and antique charm',
 description:'The antique four-poster mahogany queen-sized bed is the focal point, creating an intimate haven. Silhouette takes its name from the north-facing double windows and the changing play of natural light throughout the day. The room has a private ensuite bathroom with shower.'),
 ManorRoom(name:'Garden Chamber',category:'Standard',slug:'garden-chamber',sampleRate:130,bed:'Queen bed',image:ManorImages.bedroomBlue,subtitle:'Sunlight, garden views and timeless character',
 description:'Gleaming hardwood floors and sunlight filtered through a mature maple tree welcome you to the Garden Chamber. Antique mahogany furniture surrounds a comfortable queen-sized bed. The private ensuite shower features a custom-designed ceramic tile floor.'),
 ManorRoom(name:'Mahogany Rest',category:'Deluxe',slug:'mahogany-rest',sampleRate:140,bed:'King bed',image:ManorImages.bedroomBay,subtitle:'A spacious retreat with a beautiful bay window',
 description:'Natural light streams through the twelve-foot-wide bay window, highlighting antique chairs and calming Saint John Street Blue walls. A king-sized bed, classic furnishings and a private ensuite shower complete this peaceful deluxe room.'),
 ManorRoom(name:'Cranberry Wine',category:'Deluxe',slug:'cranberry-wine',sampleRate:140,bed:'Queen bed · garden deck',image:ManorImages.bedroomRose,subtitle:'Romance, heritage and a private outdoor escape',
 description:'A romantic queen room with south-facing windows, antique details and a private ensuite shower. Step out to an intimate deck overlooking the front garden and enjoy a peaceful moment together.'),
];

const aboutText='Mahogany Manor Bed & Breakfast is set within a lovingly restored 1905 house on a quiet residential street in Saint John. Each uniquely decorated guestroom features antique furnishings and a private bathroom with shower. Guests can enjoy the garden, cedar deck and a freshly prepared breakfast with homemade jams and seasonal fruits. From the manor, Saint John City Market and Imperial Theatre are only a short walk away.';
const propertyAddress='220 Germain Street, Saint John, NB, Canada E2L 2G4';
const propertyEmail='mmanorbb@nbnet.nb.ca';
const propertyPhone='+1 800-796-7755';
const reviews=<({String name,String text})>[
 (name:'Madelaine',text:'Absolutely everything about our stay was beyond amazing—every detail was perfect, the experience unforgettable, the ambiance enchanting, the hospitality unmatched, and we can’t wait to return for more magical memories!'),
 (name:'PJ',text:'Excellent location in beautiful old house in the centre of old St. John. Carl and Jim were very welcoming and attentive and gave good guidance to the city.'),
 (name:'Arnaud',text:'The kindness of the hosts truly touched our hearts, making us feel so welcome and at home. The breakfast was an absolute delight.'),
];
const amenityItems=<({IconData icon,String label})>[
 (icon:Icons.wifi_rounded,label:'Free Wi-Fi'),
 (icon:Icons.deck_outlined,label:'Deck & gardens'),
 (icon:Icons.local_laundry_service_outlined,label:'Laundry'),
 (icon:Icons.local_parking_outlined,label:'Parking'),
 (icon:Icons.free_breakfast_outlined,label:'Breakfast'),
 (icon:Icons.bed_outlined,label:'Ensuite rooms'),
];
