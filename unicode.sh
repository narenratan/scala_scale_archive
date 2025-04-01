#!/bin/bash
set -eu
for f in scalesdir.txt scl/*;
  do FILE=$(file "$f");
  if [[ $FILE == *"ISO-8859"* ]]; then
    echo "$FILE";
    iconv -f ISO-8859-1 -t UTF-8 $f > tmp;
    mv tmp $f;
  fi;
  if [[ $FILE == *"Non-ISO extended-ASCII"* ]]; then
    echo "$FILE";
    iconv -f CP1250 -t UTF-8 $f > tmp;
    mv tmp $f;
  fi;
done;
