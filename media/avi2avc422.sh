#! /bin/bash

OIFS="$IFS"
IFS=$'\n'

for file in `find . -type f -name "*.avi"`; do
  ffmpeg -i "$file" -c:v libx264 -preset slower -pix_fmt yuv422p \
    -vf "yadif=1" -c:a aac -b:a 256k -threads 24 -b:v 8M \
    -x264opts deblock=-3,-3:cabac:ref=16:bframes=16:me=umh:\
subme=11:psy-rd=1.00,0.00:merange=48:trellis=2:sar=12/11:\
no-fast-pskip:b-pyramid=2:b-adapt=2:b-bias=0:aq-mode=1:\
aq-strength=0.90:rc-lookahead=70:weightp=0 ${file%.*}-422.mp4
done

IFS="$OIFS"
