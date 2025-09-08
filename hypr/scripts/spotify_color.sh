#!/bin/bash

printf "@import \"colors.css\";\n"

# Obtener la URL de la portada desde DBus
art_url=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify \
  /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get \
  string:"org.mpris.MediaPlayer2.Player" string:"Metadata" 2>/dev/null |
  grep -A 1 "artUrl" | tail -n 1 | cut -d '"' -f2)

# Validar URL
if [[ -z "$art_url" ]]; then
  printf "@define-color spotify @bar;\n@define-color spotify-text @barcolor;"
  exit 0
fi

# Descargar la portada
wget -q "$art_url" -O /tmp/spotify_cover.jpg

# Validar descarga
if [[ ! -f /tmp/spotify_cover.jpg ]]; then
  echo "❌ No se pudo descargar la imagen."
  exit 1
fi

# Redimensionar a 1x1 y extraer color
rgb=$(magick /tmp/spotify_cover.jpg -resize 1x1 txt:- | grep -oE '#[0-9A-Fa-f]{6}' | head -n 1)

# Convertir a decimal RGB
r=$((16#${rgb:1:2}))
g=$((16#${rgb:3:2}))
b=$((16#${rgb:5:2}))

# Determinar si el texto sera blanco o negro
contrast=64
((t = ((r*r + g*g + b*b) > contrast*contrast) * 255))

# Imprimir resultado en formato CSS
printf "@define-color spotify rgb($r, $g, $b);\n@define-color spotify-text rgb($t, $t, $t);"
