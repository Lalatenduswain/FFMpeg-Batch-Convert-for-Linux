# 🎥 FFmpeg Batch Compress - Video Compression Script for Linux

Welcome to **FFmpeg Batch Compress**, a Bash utility for Linux that automatically compresses all video files in a folder based on a user-defined percentage. This script simplifies video compression using `ffmpeg`, reducing size while maintaining good quality — perfect for archival, sharing, or saving storage!

📍 GitHub Repo: [ffmpeg-batch-compress](https://github.com/Lalatenduswain/ffmpeg-batch-compress)

---

## 📌 Features

- ✅ Auto-check and install FFmpeg if not found
- 💡 Asks user for compression percentage (e.g., 30%)
- 🔁 Batch compresses multiple formats (`mp4`, `avi`, `mkv`, `mov`, etc.)
- 🗃️ Output stored in a separate `compressed_output` directory
- ⚙️ Uses CRF (Constant Rate Factor) for controlled quality
- 🐧 Works on Debian/Ubuntu and RHEL/CentOS-based distributions

---

## 📖 Installation Guide

### 🔧 Prerequisites

Ensure the following:

- A Linux system (Ubuntu, Debian, CentOS, RHEL)
- `sudo` privileges (required to install FFmpeg if missing)
- Internet connectivity (for installing FFmpeg if needed)
- `bash` shell

### 📦 Packages Required

- `ffmpeg`
- `bc` (used for basic float calculation)

Install them manually (if not handled by the script):

```bash
# For Debian/Ubuntu
sudo apt update
sudo apt install -y ffmpeg bc

# For RHEL/CentOS
sudo yum install -y epel-release
sudo yum install -y ffmpeg ffmpeg-devel bc
````

---

## 🚀 How to Use

### 🧾 Clone the Repository

```bash
git clone https://github.com/Lalatenduswain/ffmpeg-batch-compress.git
cd ffmpeg-batch-compress
```

### 🔓 Give Execute Permission

```bash
chmod +x ffmpeg_batch_convert.sh
```

### ▶️ Run the Script

```bash
./ffmpeg_batch_convert.sh
```

### 💬 You'll Be Prompted

You’ll be asked:

> `Enter how much % you want to compress (e.g., 30):`

* For example, entering `30` means **reduce size by 30%**.

---

## 📂 Output

All compressed videos will be saved in:

```
compressed_output/
```

Each output file will have `_compressed` appended to the original name.

---

## 🔍 Script Explained

The script does the following:

1. **Checks** if `ffmpeg` is installed.
2. If missing, **installs** it based on the OS.
3. **Prompts** the user for desired compression percentage.
4. **Calculates** the compression ratio.
5. Loops through video files and uses `ffmpeg` with:

   * `libx264` codec
   * Adjustable `CRF` (Constant Rate Factor)
   * AAC audio at 128 kbps
6. Saves output in `compressed_output/` directory.

---

## 💖 Support & Donations

If you find this script useful, consider supporting the work:

☕ [Buy Me a Coffee](https://www.buymeacoffee.com/lalatendu.swain)

---

## 📬 Support or Contact

Encountering issues? Submit an issue at our GitHub:

👉 [GitHub Issues](https://github.com/Lalatenduswain/ffmpeg-batch-compress/issues)

---

## 🛡️ Disclaimer | Running the Script

**Author:** Lalatendu Swain
📌 [GitHub](https://github.com/Lalatenduswain) | 🌐 [Website](https://blog.lalatendu.info/)

This script is provided as-is and may require modifications based on your environment.
The author is not liable for any damages or data loss caused by its usage.
**Use at your own risk. Always back up your data before batch operations.**

---

## 📘 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.
