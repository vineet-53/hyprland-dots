#!/bin/bash

ARGS=" --no-video --loop-file=inf --loop-playlist=inf"

notification(){
  notify-send "  Playing Now: " "  $@" --icon=media-tape
}

menu(){
  printf "1. Lofi Girl \n"
  printf "2. Viral TikTok Songs \n"
  printf "3. Anime Lofi \n"
  printf "4. Top Music 2024 \n"
  printf "5. Bollywood Hits Mashup Songs\n"
  printf "6. Dreamhop \n"
  printf "7. NDTV 24x7 <news>\n"
  printf "8. WION Live <news>\n"
  printf "9. Coding Lofi\n"
  printf "10. Phle Bhi Mein\n"
  printf "11. Anxiety Motivation by Grand Mother\n"
  printf "12. Lil Baby\n"
  printf "13. Fein\n"
  printf "14. Woah Raat\n"
  printf "15. Teri Yaad\n"
}



main() {

  choice=$(menu |  rofi -dmenu -i -selected-row 1 -p "🎶 Music"| cut -d. -f1)

  case $choice in
    1)
      notification "Lofi Girl ☕️🎶";
      URL="https://www.youtube.com/watch?v=-EY97tZAkNY&ab_channel=CozyNordic"
      ADDITIONAL_ARGS="--volume=65"
      break
      ;;
    2)
      notification "Viral TikTok Songs";
      URL="https://www.youtube.com/watch?v=slKNtk0GFEE&ab_channel=LoveLifeLyrics"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    3)
      notification "Anime Vocal Lofi";
      URL="https://www.youtube.com/watch?v=zavCTwkGseg&ab_channel=TokyoMusic"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    4)
      notification "Top Music 2024";
      URL="https://www.youtube.com/watch?v=uDKrbo1xgvk&ab_channel=LoveLifeLyrics"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    5)
      notification "Bollywood Hits Mashup Songs";
      URL="https://www.youtube.com/watch?v=o4DGQkPRwyY&ab_channel=0125FX"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    6)
      notification "Dreamhop ☕️🎶";
      URL="https://youtu.be/wkhLHTmS_GI"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    7)
      notification "NDTV 24x7 📰";
      URL="https://youtu.be/WB-y7_ymPJ4"
      ADDITIONAL_ARGS=""
      break
      ;;

    8)
      notification "WION Live 📰"
      URL="https://youtu.be/lmZRiDMK3OU"
      ADDITIONAL_ARGS=""
      break
      ;;
    9)
      notification "Coding Lofi ☕️🎶";
      URL="https://www.youtube.com/watch?v=4LIt_ICJyjk&ab_channel=Lofi%EC%BD%94%EB%94%A9"
      ADDITIONAL_ARGS="--volume=79"
      break
      ;;
    10)
      notification "Phle Bhi Mein ";
      URL="https://www.youtube.com/watch?v=kZGpkkfk2lA&list=RDkZGpkkfk2lA&start_radio=1&ab_channel=SRLofi"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    11)
      notification "Anxiety Relief By Yoga Institute";
      URL="https://www.youtube.com/watch?v=td0PSS3lCQ4&ab_channel=TheYogaInstitute"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    12)
      notification "Lil Baby CentralCee";
      URL="https://www.youtube.com/watch?v=pDddlvCfTiw&ab_channel=CentralCee"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    13)
      notification "Fein";
      URL="https://www.youtube.com/watch?v=ZsaGS8q2dvs&ab_channel=DATOX"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    14)
      notification "Woah Raat";
      URL="https://www.youtube.com/watch?v=bvAS1avuOpY&ab_channel=Raftaar"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;
    15)
      notification "Teri Yaad";
      URL="https://www.youtube.com/watch?v=R-sh3kfdHQ4&list=RDGMEM916WJxafRUGgOvd6dVJkeQVMR-sh3kfdHQ4&start_radio=1"
      ADDITIONAL_ARGS="--volume=60"
      break
      ;;

    esac

    mpv $ARGS $URL $ADDITIONAL_ARGS
  }

  pkill -f mpv || pkill -f rofi || main
