#!/bin/bash

for i in "$@"
do
case $i in
    -r=*|--root=*)
    ROOT_PATH="${i#*=}"
    shift # past argument=value
    ;;
    -d*|--destination*)
    DESTINATION_PATH="${i#*=}"
    shift # past argument=value
    ;;
    *)
          # unknown option
    ;;
esac
done

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

find_generator() {
  echo $DIR
    GENERATOR_PATH="$(eval find ${DIR}/../build -type f -name "GQLSchemaGenerator")"
    if [ -z "$GENERATOR_PATH" ]; then
        ${DIR}/build.sh
        find_generator
    fi

}

find_generator

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NO='\033[0m'

echo -e "${GREEN}ROOT PATH${NO} = ${ROOT_PATH}"
echo -e "${GREEN}DESTINATION PATH ${NO} = ${DESTINATION_PATH}"
echo -e "${GREEN}GENERATOR PATH ${NO} = ${GENERATOR_PATH}"

$GENERATOR_PATH --root $ROOT_PATH --destination $DESTINATION_PATH
