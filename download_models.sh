#!/usr/bin/env bash
# Downloads the face-api.js model files needed for emotion detection.
# Run once before pushing to GitHub: bash download_models.sh

set -e

BASE_URL="https://raw.githubusercontent.com/justadudewhohacks/face-api.js/master/weights"
MODELS_DIR="$(dirname "$0")/models"

mkdir -p "$MODELS_DIR"

FILES=(
  "tiny_face_detector_model-weights_manifest.json"
  "tiny_face_detector_model-shard1"
  "face_expression_recognition_model-weights_manifest.json"
  "face_expression_recognition_model-shard1"
)

echo "Downloading models into $MODELS_DIR ..."

for FILE in "${FILES[@]}"; do
  echo "  ↓ $FILE"
  curl -fsSL "$BASE_URL/$FILE" -o "$MODELS_DIR/$FILE"
done

echo ""
echo "Done. Model files are in: $MODELS_DIR"
