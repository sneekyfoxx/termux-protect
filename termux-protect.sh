#!/bin/bash

# Locations
root="/data/data/com.termux/files";
location="/sdcard/termux-protected.tgz";

# Colors
red="\e[1;31m";
green="\e[1;32m";
blue="\e[1;34m";
cyan="\e[1;36m";
reset="\e[0m";

# Generate termux-protect help
_help() {
  echo -en "${blue}usage${reset}: ${green}termux-protect${reset} ";
  echo -e "[${cyan}help${reset}] <${cyan}protect${reset}|${cyan}release${reset}>\n";
  echo -e "${blue}Options${reset}\n-------";
  echo -e "  ${cyan}help${reset}        show termux-protect help\n";
  echo -e "  ${cyan}protect${reset}     create a termux backup\n";
  echo -e "  ${cyan}release${reset}     restore a termux backup\n";
  return 0;
}

# Creates a tar.gz archive backup
protect() {
  if [ -f "${location}" ]; then
    echo -e "\n${green}Removing${reset}";
    echo -e "  • (${red}old${reset}) ${blue}${location}${reset}";
    rm -rf "${location}";
  fi

  echo -e "\n${green}Protecting${reset}";
  echo -e "  • ${blue}${HOME}/${reset}";
  echo -e "  • ${blue}${PREFIX}/${reset}";

  tar -zcf "${location}" -C "${root}" ./home ./usr

  echo -e "\n${green}Protected Successfully!${reset}";
  echo -e "  → ${green}${location}${reset}";
  return 0;
}

# Restores the tar.gz backup
release() {
  if [ ! -f "${location}" ]; then
    echo -e "\n${red}${location}${reset} not found";
    return 1;
  else
    echo -e "\n${green}Releasing${reset}";
    echo -e "  • ${blue}${location}${reset}";

    tar -zxf "${location}" -C "${root}" --recursive-unlink --preserve-permissions;

    echo -e "\n${green}Released Successfully!${reset}";
    echo -e "  → ${green}${location}${reset}";
    return 0;
  fi
}

main() {
  local opt="$1";

  case "${opt}" in
    'help') _help;;
    'protect') protect;;
    'release') release;;
    *)
      echo -e "${red}Invalid Option${reset}: '${opt}'"
      return 1;;
  esac
  return 0;
}

main $1;
