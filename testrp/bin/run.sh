#!/bin/bash

TEST_OIDC_ALGO=${TEST_OIDC_ALGO}
RUNNER="./bin/run_$TEST_OIDC_ALGO.sh"

exec $RUNNER
