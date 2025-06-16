#!/bin/bash

# Function to check and install ffmpeg
install_ffmpeg_if_needed() {
    if ! command -v ffmpeg &> /dev/null; then
        echo "FFmpeg is not installed. Installing now..."
        if [ -f /etc/debian_version ]; then
            sudo apt update && sudo apt install -y ffmpeg
        elif [ -f /etc/redhat-release ]; then
            sudo yum install -y epel-release
            sudo yum install -y ffmpeg ffmpeg-devel
        else
            echo "Unsupported distribution. Please install ffmpeg manually."
            exit 1
        fi
    else
        echo "FFmpeg is already installed."
    fi
}

# Function to read compression percentage
get_compression_percentage() {
    read -rp "Enter how much % you want to compress (e.g., 30): " compress_pct

    if ! [[ "$compress_pct" =~ ^[0-9]+$ ]] || [ "$compress_pct" -lt 1 ] || [ "$compress_pct" -ge 100 ]; then
        echo "Invalid input. Please enter a number between 1 and 99."
        exit 1
    fi

    compression_ratio=$(echo "scale=2; (100 - $compress_pct)/100" | bc)
    echo "Compression ratio will be $compression_ratio (Target size: ${compress_pct}% smaller)"
}

# Batch convert videos in current directory
batch_compress_videos() {
    mkdir -p compressed_output

    for file in *.{mp4,mkv,avi,flv,webm,wmv,3gp,mov}; do
        [ -f "$file" ] || continue

        filename="${file%.*}"
        extension="${file##*.}"
        output_file="compressed_output/${filename}_compressed.${extension}"

        echo "Compressing $file -> $output_file"

        # Use CRF (Constant Rate Factor) to reduce quality based on estimated percentage
        # Lower CRF = higher quality. Range: 18–28 is good.
        target_crf=$(echo "scale=0; 23 + (($compress_pct - 30) / 10)" | bc)
        if [ "$target_crf" -lt 18 ]; then target_crf=18; fi
        if [ "$target_crf" -gt 32 ]; then target_crf=32; fi

        ffmpeg -i "$file" -vcodec libx264 -crf "$target_crf" -preset slow -acodec aac -b:a 128k "$output_file"
    done

    echo "All videos compressed and saved in 'compressed_output/'"
}

# === Main ===
install_ffmpeg_if_needed
get_compression_percentage
batch_compress_videos
