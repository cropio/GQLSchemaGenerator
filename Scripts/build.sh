#!/bin/bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null && pwd )"

# remove build folder
rm -rf ${DIR}/../build

#runing build
xcodebuild -project ${DIR}/../GQLSchemaGenerator.xcodeproj -scheme GQLSchemaGenerator | xcpretty

#file path
GENERATOR_PATH="$(eval find ${DIR}/../build/ -type f -name "GQLSchemaGenerator")"
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'

if [ -z "$GENERATOR_PATH" ]; then
echo -e "${RED}error: Couldn't find ${BLUE}GQLSchemaGenerator ${RED}file"
exit 1
fi

echo -e "${GREEN}** BUILD SUCCEEDED ** ${BLUE}${GENERATOR_PATH}"
