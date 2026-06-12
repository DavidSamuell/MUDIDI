#!/usr/bin/env bash
# PDF mode on a full dictionary scan (requires pdftk).
#
# Place your downloaded dictionary PDF under inputs/ and adjust --dict-pages,
# --intro-pages, and --parse-rules-page for your volume. This example uses the
# Carolinian-English dictionary bundled at inputs/Carolinian-English-Dictionary.pdf.
#
# Usage (from repo root): bash examples/inference/run_pdf_mode.sh

uv run mudidi run \
  --pages inputs/Carolinian-English-Dictionary.pdf \
  --dict-pages 50-52 \
  --intro-pages 1-3 \
  --parse-rules-page 50 \
  --output-dir outputs/carolinian-english \
  --stage all \
  --strategy two_stage \
  --stage1-mode flat \
  --stage-1-model gemini/gemini-3-flash-preview \
  --stage-2-pass-1-model gemini/gemini-3.1-pro-preview \
  --stage-2-pass-2-model gemini/gemini-3.1-pro-preview \
  --stage2-reasoning high
