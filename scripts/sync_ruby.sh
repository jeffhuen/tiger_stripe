#!/bin/bash
set -euo pipefail

# Download the pinned stripe-ruby SDK for parity comparison.
# Used by diff_ruby.sh and parity_test.exs.

RUBY_DIR="priv/stripe-ruby-master"
REPO="stripe/stripe-ruby"
REF="${STRIPE_RUBY_REF:-$(cat STRIPE_RUBY_VERSION 2>/dev/null || echo master)}"

echo "Fetching stripe-ruby $REF..."

# Clean previous copy
rm -rf "$RUBY_DIR"
mkdir -p "$RUBY_DIR"

# Download and extract master tarball (faster than git clone)
curl -sL --fail "https://github.com/$REPO/archive/$REF.tar.gz" \
  | tar xz --strip-components=1 -C "$RUBY_DIR"

# Verify we got service files
SERVICE_COUNT=$(find "$RUBY_DIR/lib/stripe/services" -name "*_service.rb" 2>/dev/null | wc -l | tr -d ' ')
if [ "$SERVICE_COUNT" -eq 0 ]; then
  echo "ERROR: No service files found in downloaded Ruby SDK." >&2
  rm -rf "$RUBY_DIR"
  exit 1
fi

echo "Downloaded stripe-ruby $REF to $RUBY_DIR ($SERVICE_COUNT service files)"
