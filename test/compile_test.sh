#!/usr/bin/env bash

. ${BUILDPACK_TEST_RUNNER_HOME}/lib/test_utils.sh

testCompile() {
  cat > ${BUILD_DIR}/Aptfile <<EOF
:package:s3cmd
:package:wget
EOF

  compile

  assertCapturedSuccess

  assertCaptured "Fetching .debs for s3cmd"
  assertCaptured "Installing s3cmd_"
  assertCaptured "Fetching .debs for wget"
  assertCaptured "Installing wget_"
}
