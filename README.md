# GQLSchemaGenerator

Code generator for generating GraphQL schema.

[![Build Status](https://travis-ci.org/Lumyk/GQLSchemaGenerator.svg?branch=master)](https://travis-ci.org/Lumyk/GQLSchemaGenerator) [![codecov](https://codecov.io/gh/Lumyk/GQLSchemaGenerator/branch/master/graph/badge.svg)](https://codecov.io/gh/Lumyk/GQLSchemaGenerator) [![GitHub release](https://img.shields.io/github/release/Lumyk/GQLSchemaGenerator.svg)](https://github.com/Lumyk/GQLSchemaGenerator/releases/latest)

## Instalation

```shell
GENERATOR_PATH="$(eval find $SRCROOT -type f -name gql_schema_enerator.sh)"
if [ -z "$GENERATOR_PATH" ]; then
    echo -e "error: Couldn't find gql_schema_enerator.sh file"
    exit 1
fi

$GENERATOR_PATH --root="$SRCROOT" --destination="${SRCROOT}/Sources/${PROJECT_NAME}"
```
