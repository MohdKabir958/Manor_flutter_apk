# Mahogany Manor — Flutter Client Prototype

Interactive Flutter client demo for Mahogany Manor Bed & Breakfast.

Screens: Home, About, Standard/Deluxe rooms, four room details, Gallery, Contact, dummy Login/Sign Up and booking enquiry.

This prototype uses mock content and simulated forms; no bookings, accounts or messages are saved or sent.

## Build APK

Run the GitHub Actions workflow **Build Mahogany Manor Demo APK** on `main`, or use Flutter locally:

```bash
flutter create --project-name mahogany_manor_prototype --platforms android .
flutter pub get
flutter build apk --release
```

See the full README in the project source for implementation details.
