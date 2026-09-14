#!/bin/bash

CHOICES=(
  "Cursor            AI Code Editor"
  "Doom Emacs        Emacs framework with curated list of packages"
  "PhpStorm          JetBrains' commercial PHP editor (installed by default, use to reinstall/update)"
  "RubyMine          IntelliJ's commercial Ruby editor"
  "Windsurf          Another AI Code Editor"
  "Zed               Fast all-purpose editor"
  "<< Back           "
)

CHOICE=$(gum choose "${CHOICES[@]}" --height 9 --header "Install editor")

if [[ "$CHOICE" == "<< Back"* ]] || [[ -z "$CHOICE" ]]; then
  # Don't install anything
  echo ""
else
  INSTALLER=$(echo "$CHOICE" | awk -F ' {2,}' '{print $1}' | tr '[:upper:]' '[:lower:]' | sed 's/ /-/g')

  case "$INSTALLER" in
  "phpstorm") INSTALLER_FILE="$OMAKUPT_PATH/install/desktop/app-phpstorm.sh" ;;
  *) INSTALLER_FILE="$OMAKUPT_PATH/install/desktop/optional/app-$INSTALLER.sh" ;;
  esac

  source $INSTALLER_FILE && gum spin --spinner globe --title "Install completed!" -- sleep 3
fi

clear
source $OMAKUPT_PATH/bin/omakupt-sub/header.sh
source $OMAKUPT_PATH/bin/omakupt-sub/install.sh
