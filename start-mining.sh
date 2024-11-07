#!/bin/bash

# Mengunduh file PINGPONG dari URL yang diberikan
echo "Mengunduh file PINGPONG..."
wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG -O PINGPONG

# Memberikan izin eksekusi pada file PINGPONG
echo "Memberikan izin eksekusi pada file PINGPONG..."
chmod +x PINGPONG

# Meminta pengguna untuk memasukkan key
echo -n "Masukkan key Anda: "
read user_key

# Memeriksa apakah key tidak kosong
if [ -z "$user_key" ]; then
  echo "Key tidak boleh kosong. Silakan masukkan key yang valid."
  exit 1
fi

# Menjalankan file PINGPONG dengan key yang diberikan
echo "Menjalankan PINGPONG dengan key yang diberikan..."
./PINGPONG --key="$user_key"

# Menampilkan pesan selesai
echo "Script selesai dijalankan."