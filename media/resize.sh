#! /bin/bash

INPUT_PATH=$1
OUTPUT_PATH=$2
OUTPUT_WIDTH=${3:-1200}
QUALITY=${4:-82}

OIFS=$IFS
IFS=$'\n'

for dirname in `find $INPUT_PATH -type d`; do
  outname=${dirname/$INPUT_PATH/$OUTPUT_PATH}
  if [ ! -d "$outname" ]; then
    mkdir "$outname"
  fi
  
  mogrify -path "$outname" -filter Triangle -define filter:support=2 \
    -thumbnail $OUTPUT_WIDTH\> -unsharp 0.25x0.25+8+0.065 -dither None \
    -posterize 136 -quality $QUALITY -define jpeg:fancy-upsampling=off \
    -define png:compression-filter=5 -define png:compression-level=9 \
    -define png:compression-strategy=1 -define png:exclude-chunk=all \
    -interlace none -colorspace sRGB -strip "$dirname/*"
done

IFS=$OIFS
