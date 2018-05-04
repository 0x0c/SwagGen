#!/bin/bash
set -e

SPEC_NAME=$(basename $1)
SPEC_PATH=$1
SWAGGER_SPEC=$1/spec.yml

if [ -f "${SWAGGER_SPEC}" ]
then
	SWAGGER_SPEC=$SPEC_PATH/spec.yml
else
	SWAGGER_SPEC=$SPEC_PATH/spec.json
fi

rm -f ${SPEC_PATH}/generated/Swift/Package.resolved

echo "📦  Generating $SPEC_PATH"
swift run swaggen generate ${SWAGGER_SPEC} --template Templates/Swift/template.yml --destination $SPEC_PATH/generated/Swift --option name:$SPEC_NAME --clean all

echo "📦  Building $SPEC_PATH"
swift build --package-path ${SPEC_PATH}/generated/Swift --build-path Specs/.build -c release

rm -f ${SPEC_PATH}/generated/Swift/Package.resolved
