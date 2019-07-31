#!/bin/bash

DIR=$(pwd)
GENERATOR_PATH="$(eval find $DIR/.. -type f -name gql_schema_enerator.sh)"
if [ -z "$GENERATOR_PATH" ]; then
    echo -e "error: Couldn't find gql_schema_enerator.sh file"
    exit 1
fi

$GENERATOR_PATH --root="$DIR/GQLSchemaGeneratorTests" --destination="${DIR}/GQLSchemaGeneratorTests/Generated"
