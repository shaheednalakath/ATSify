# 📄 ATSify — ATS Resume Builder App

> A full-featured Flutter application that helps users build ATS-friendly resumes with real-time preview, multiple templates, PDF/DOCX export, and an admin panel powered by Firebase.

---

## 🚀 Features

### User Features
- **6 Built-in Resume Templates**: Modern, Classic, Fresher, Experience, Skills, Compact
- **Live Resume Preview**: Real-time split-screen view — form on the left, preview on the right
- **Dynamic Template Switching**: Switch between templates without losing form data
- **PDF Export**: Generate ATS-friendly PDF resumes
- **DOCX Export**: Generate Word-compatible resume documents
- **Cloud Save**: Save resume data to Firebase Firestore
- **Skills Management**: Add and remove skills dynamically with chips

### Admin Features
- **Firebase Authentication**: Secure admin login (email/password)
- **Admin Dashboard**: View total user count and user list with last-updated timestamps
- **Template Management**: Add and delete custom templates stored in Firestore
- **Real-time Updates**: StreamBuilder-powered live data sync

---

## 🛠️ Tech Stack

| Layer | Technology |
|---|---|
| Framework | Flutter (Dart) |
| State Management | Provider |
| Backend | Firebase (Auth, Firestore) |
| PDF Generation | pdf + printing |
| DOCX Generation | docx_template |
| File Storage | path_provider |

---

## 📁 Project Structure

```
lib/
├── main.dart
├── firebase_options.dart
├── models/
│   └── resume_model.dart
├── providers/
│   └── resume_provider.dart
├── screens/
│   ├── user/
│   │   ├── template_selection_screen.dart
│   │   └── resume_builder_screen.dart
│   └── admin/
│       ├── admin_login_screen.dart
│       ├── admin_dashboard_screen.dart
│       └── template_manager_screen.dart
├── services/
│   ├── auth_service.dart
│   ├── firestore_service.dart
│   ├── pdf_service.dart
│   └── docx_service.dart
├── templates/
│   ├── modern_template.dart
│   ├── classic_template.dart
│   ├── fresher_template.dart
│   ├── experience_template.dart
│   ├── skills_template.dart
│   └── compact_template.dart
└── widgets/
    ├── resume_form.dart
    ├── resume_preview.dart
    └── template_selector.dart
```

---

## ⚙️ Setup Instructions

### Prerequisites
- Flutter SDK (3.9+)
- Firebase CLI
- FlutterFire CLI

### 1. Clone the Repository
```bash
git clone https://github.com/shaheednalakath/ATSify.git
cd ATSify
```

### 2. Install Dependencies
```bash
flutter pub get
```

### 3. Configure Firebase
```bash
# Install Firebase CLI
npm install -g firebase-tools

# Login to Firebase
firebase login

# Install FlutterFire CLI
dart pub global activate flutterfire_cli

# Configure Firebase for this project
flutterfire configure
```

This will generate the real `lib/firebase_options.dart` with your project credentials.

### 4. Enable Firebase Services
In the [Firebase Console](https://console.firebase.google.com/):
- Enable **Authentication** → Email/Password provider
- Create **Firestore Database** in test mode
- Create an admin user with email: `admin@atsify.com`

### 5. Run the App
```bash
flutter run
```

---

## 🧪 Testing
```bash
flutter test
flutter analyze
```

---

## 📌 Navigation Flow

```
TemplateSelectionScreen (Home)
├── Select Template → ResumeBuilderScreen
│   ├── Fill Form (left panel)
│   ├── Live Preview (right panel)
│   ├── Save to Cloud ☁️
│   ├── Download PDF 📄
│   └── Download DOCX 📝
└── Admin Login → AdminDashboard
    ├── View Users
    └── Manage Templates
```

---

## 🔒 Admin Access
- **Admin Email**: `admin@atsify.com`
- Only this email can access the Admin Dashboard
- Other users are denied access with an error message

---

## 📜 License
This project is for educational purposes.

---

Built with ❤️ using Flutter & Firebase
