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
  read user_key

  # Memeriksa apakah key kosong
  if [ -z "$user_key" ]; then
    echo "Key tidak boleh kosong. Silakan masukkan key yang valid."
    continue  # Kembali ke awal loop untuk meminta input ulang
  fi

  # Menjalankan file PINGPONG dengan key yang diberikan
  echo "Menjalankan PINGPONG dengan key yang diberikan..."
  ./PINGPONG --key="$user_key"

  # Memeriksa apakah PINGPONG berhasil dijalankan
  if [ $? -eq 0 ]; then
    # Jika PINGPONG berhasil dijalankan, keluar dari loop
    echo "Key valid, lanjutkan ke langkah berikutnya."
    break
  else
    # Jika PINGPONG gagal (key salah), beri peringatan dan ulangi
    echo "Key salah. Silakan masukkan key yang benar."
  fi
done

# Menampilkan pesan selesai
echo "Script selesai dijalankan."
