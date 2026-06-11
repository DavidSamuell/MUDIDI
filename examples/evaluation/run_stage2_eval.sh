#!/usr/bin/env bash
# Stage 2 MDF eval: Evenki-Russian page_1 (run directory inference first).
#
# Usage (from repo root): bash examples/evaluation/run_stage2_eval.sh

uv run mudidi eval stage2 \
  -p outputs/evenki-russian/stage-2/page_1/page_1.mdf.txt \
  -g "dataset/mudidi/dictionaries/Evenki-Russian/Stage 2 MDF file/page_1/page_1.mdf.txt" \
  -o outputs/evenki-russian/eval/stage2