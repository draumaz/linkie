#!/bin/sh -e

case ${LINKIE_REPO} in
  "") echo "=> [export a LINKIE_REPO (e.g. ~/repo.git) and try again]"; exit 1 ;;
  *)  echo "=> LINKIE_REPO: [${LINKIE_REPO}]" ;;
esac

case ${LINKIE_PATH} in
  "") echo "=> [export a LINKIE_PATH (e.g. ~/.config) and try again]"; exit 1 ;;
  *)  echo "=> LINKIE_PATH: [${LINKIE_PATH}]" ;;
esac

case ${LINKIE_BIN_PATH} in "") LINKIE_BIN_PATH="/usr/bin" ;; esac
case "${@}" in --verbose|-v) V="-v" ;; esac

about() { ls -l "${LINKIE_BIN_PATH}/linkie"; }

go() {
  cd "${LINKIE_REPO}"

  git add *
  git commit -m "<linkie [`date -Is`]" && git push

  printf "[linkie] linking... "

  for SYM in `find "${PWD}" \
    -maxdepth 1 \
    -not -name "*.git*" \
    -and -not -name "README.md" \
    -and -not -path "${PWD}" | \
    sed "s|$PWD||g" | cut -c2-`; do
      ORIGIN="${LINKIE_REPO}/${SYM}"; DEST="${LINKIE_PATH}/${SYM}"
      rm -rf "${DEST}" || true; ln -s ${V} -f "${ORIGIN}" "${DEST}" || { echo "${MSG_RELINK_FAIL} ${ORIGIN}" && exit 1; }
  done

  echo "done."
}

selfup() {
  about; curl -sL https://github.com/draumaz/linkie/archive/refs/heads/main.tar.gz | \
    sudo tar ${V} -xpzf - \
      --strip-components=1 \
      -C ${LINKIE_BIN_PATH} \
      linkie-main/linkie; about
}

case $1 in
  about) about ;;
  selfup) selfup ;;
  *) go ;;
esac
