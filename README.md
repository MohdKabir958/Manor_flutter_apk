# Mahogany Manor — Website-Driven Flutter Client Demo

This is an interactive Android Flutter demo inspired by the public website: https://www.mmanor.ca/.

## Design
- Dark charcoal overlays, clean white sections and teal calls-to-action
- Mobile-friendly header, script-style logotype, hero images and reusable card styles
- Responsive, consistent spacing, readable headings and amenity icons
- Designed as an *adaptation* of the website, not a claim of pixel-exact reproduction

## Covered screens
Home, About Us, Our Rooms, Standard category (Silhouette and Garden Chamber), Deluxe category (Mahogany Rest and Cranberry Wine), room detail, Gallery + image viewer, Contact, dummy Login/Sign Up, and demo booking enquiry.

## Important prototype restrictions
- No backend integration, live booking, payments, login accounts or contact delivery
- Sample prices require confirmation by the property
- Remote property photos used for illustration; some may not match the specific room. Obtain approved exact photographs and branding from the client.
- The source code has not been validated on a device until the CI build and walkthrough pass

## APK build
GitHub Actions → Build Mahogany Manor Demo APK → Run workflow. Download the Mahogany-Manor-Demo-APK artifact after a successful run.

Local Flutter commands:
```bash
flutter create --project-name mahogany_manor_prototype --platforms android .
flutter pub get
flutter build apk --release
```
