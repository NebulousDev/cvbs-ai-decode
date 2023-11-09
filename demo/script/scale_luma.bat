@echo off
ffmpeg -loop 1 -t 2 -hide_banner -loglevel error -i %~1 -pix_fmt y16 -vf pad=910:526,il=l=d:c=d:a=d -c:v rawvideo -f rawvideo - | ld-chroma-decoder.exe - --input-json "%~dp0scaling.json" --ffrl 1 --lfrl 526 -f mono --luma-nr 0 --chroma-nr 0 --chroma-gain 0 --chroma-phase 1 -p y4m - | ffmpeg -hide_banner -loglevel error -y -i - -vf crop=910:525:0:1 -pix_fmt y8 %~dp1%~n1_scaled.png