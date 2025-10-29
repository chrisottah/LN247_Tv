### 📄 **README.md**

```markdown
# 📺 LN247 TV

LN247 TV is a Flutter-based mobile application for **live video streaming**, built for the **LN247 News Network**.  
The app delivers a clean UI and seamless video playback.

---

## 🚀 Features

- 🎥 **Livestream support** using HLS (`.m3u8`) links  
- 📰 **Auto-updating news feed** (syncs with WordPress backend)  
- 🧭 **Intuitive navigation and modern UI**  
- 🌙 **Light/Dark mode ready**  
- ⚙️ **Optimized for Android (release-ready build)**  
- 💡 **Custom splash screen and app icon**

---

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-------------|
| Frontend | Flutter 3.x |
| Video Player | [Better Player (custom build)](https://github.com/jhomlala/betterplayer) |
| Backend | WordPress REST API |
| Languages | Dart, Kotlin (for Android integration) |
| Build System | Gradle (Android) |

---

## 📦 Folder Structure

```

ln247_tv/
├── android/                # Native Android files (Gradle, Kotlin)
├── assets/                 # Icons, thumbnails, background videos
├── lib/                    # Flutter app source code
├── better_player_fixed/    # Local fork of Better Player
├── pubspec.yaml            # Flutter dependencies
└── README.md               # This file

````

---

## 🔧 Build Instructions

### 1. Clone the repository
```bash
git clone https://github.com/chrisottah/ln247_Tv.git
cd ln247_tv
````

### 2. Get Flutter packages

```bash
flutter pub get
```

### 3. Build for Android

```bash
flutter build apk --release
```

You’ll find your APK under:

```
build/app/outputs/flutter-apk/app-release.apk
```

---

## 🖼️ Screenshots (optional)

You can include a few screenshots of your app UI here later:

```
![Home Screen](screenshots/home.png)
![Livestream Player](screenshots/player.png)
```

---

## 📬 Contact

**Developer:** Christian Ottah
**Email:** [chrisottah@gmail.com](mailto:chrisottah@gmail.com)

---

⭐ **If you like this project, give it a star on GitHub!**

```

---

Would you like me to include a short **installation section for iOS** (for future builds, even if you're not targeting it yet)? It makes the repo look more professional.
```
