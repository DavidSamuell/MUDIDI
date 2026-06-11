#!/usr/bin/env bash
# Stage 1 flat eval: Evenki-Russian page_1 (run directory inference first).
#
# Usage (from repo root): bash examples/evaluation/run_stage1_eval.sh

uv run mudidi eval stage1 \
  -p outputs/evenki-russian/stage-1/page_1/page_1_stage1_flat.txt \
  -g "dataset/mudidi/dictionaries/Evenki-Russian/Stage 1 Gold OCR/page_1/page_1_stage1_GOLD_flat.txt" \
  -o outputs/evenki-russian/eval/stage1