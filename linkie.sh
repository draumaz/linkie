#!/bin/sh -e

cd ${CONFIG_DOTS_REPO}

git add *; git commit -m \
  "automatically updated by linkie" > /dev/null 2>&1 && \
    git push

printf "[plasma_linker] relinking... "

for SYM in `find $PWD -maxdepth 1 -not -name "*.git*" -and -not -path "$PWD" | sed "s|$PWD||g"`; do
  ORIGIN="${CONFIG_DOTS_REPO}/${SYM}"; DEST="${HOME}/.config/${SYM}"
  rm -rf ${DEST} || true; ln -sf ${ORIGIN} ${DEST}
done

echo "done"
