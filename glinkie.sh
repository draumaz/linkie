#!/bin/sh -e

printf "===============\n"
case ${LINKIE_REPO} in
  "") echo "=> [export a LINKIE_REPO (e.g. ~/repo.git) and try again]"; exit 1 ;;
  *)  echo "=> LINKIE_REPO: [${LINKIE_REPO}]" ;;
esac

case "${1}" in
  sync|"")
    cd "${LINKIE_REPO}"
    dconf dump /org/gnome/ > gnome.ini
    git add *
    if git commit -m `date -Is`; then git push; fi
  ;;
  restore)
    dconf load /org/gnome/ < gnome.ini
  ;;
  help)
    printf "add the following to your crontab.\n* * * * * $(realpath ${0}) sync\n"
  ;;
esac
