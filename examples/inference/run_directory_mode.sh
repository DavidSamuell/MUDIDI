#!/usr/bin/env bash
# Directory mode on Evenki-Russian from the MUDIDI benchmark dataset.
# Requires dataset/mudidi/ (download from Hugging Face — see examples/README.md).
#
# Usage (from repo root): bash examples/inference/run_directory_mode.sh

uv run mudidi run \
  --pages "dataset/mudidi/dictionaries/Evenki-Russian/Dictionary pages" \
  --alphabet "dataset/mudidi/dictionaries/Evenki-Russian/Alphabet list/alphabet.txt" \
  --dictionary-languages "dataset/mudidi/dictionaries/Evenki-Russian/dictionary_languages.yaml" \
  --parse-rules-page page_1 \
  --output-dir outputs/evenki-russian \
  --stage all \
  --strategy two_stage \
  --stage1-mode flat \
  --stage-1-model gemini/gemini-3-flash-preview \
  --stage-2-pass-1-model gemini/gemini-3.1-pro-preview \
  --stage-2-pass-2-model gemini/gemini-3.1-pro-preview \
  --stage2-reasoning high
