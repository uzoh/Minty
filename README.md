### Minty Mobile Bank
This app is built as a clone of the Mintyn App and can run on both iPhones and iPads with full support for light and dark mode.

### Features
- Login (with mock data)
- Stay logged in by checking the `Remember me` button
- Toggle password visibility 
- Dashboard Designs
- Settings Page
- Legal Page with links to policy documents
- Systems Page with support for Light and Dark Mode
- Logout

### How to install
```sh
git clone https://github.com/uzoh/Minty.git
cd Minty
pod install
```

### Login Credentials
Phone: `08130000000`
Password: `password`

### Testing
- Unit Testing
- Snapshot testing

### Improvements
- Create reusable designs for certain components including (Buttons, TextField, etc)
- Improve design responsveness of the Login page for smaller devices so that no fields are hidden. Options includ:
    - Reducing the size of the navigation cards (Open Account, Contact Support etc) so that the bottom sheet content fits all screens
    - Add a scrollview to the bottom sheet so that it scrolls on smaller devices.
