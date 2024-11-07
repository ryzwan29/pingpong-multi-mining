#!/bin/bash

# Mengunduh file PINGPONG dari URL yang diberikan
echo "Mengunduh file PINGPONG..."
wget https://pingpong-build.s3.ap-southeast-1.amazonaws.com/linux/latest/PINGPONG -O PINGPONG

# Memberikan izin eksekusi pada file PINGPONG
echo "Memberikan izin eksekusi pada file PINGPONG..."
chmod +x PINGPONG

# Looping untuk meminta key dari pengguna hingga valid
while true; do
  # Meminta pengguna untuk memasukkan key
  echo -n "Masukkan key Anda: "
  read -r user_key

  # Menghapus whitespace (spasi atau karakter newline) di awal dan akhir input key
  user_key=$(echo "$user_key" | xargs)

  # Memeriksa apakah key kosong
  if [ -z "$user_key" ]; then
    echo "Key tidak boleh kosong. Silakan masukkan key yang valid."
    continue  # Kembali ke awal loop untuk meminta input ulang
  fi

  # Jika key valid (tidak kosong dan bukan hanya spasi), keluar dari loop dan lanjutkan
  break
done

# Menjalankan file PINGPONG dengan key yang diberikan
echo "Menjalankan PINGPONG dengan key yang diberikan..."
./PINGPONG --key="$user_key"

# Menampilkan pesan selesai
echo "Script selesai dijalankan."
