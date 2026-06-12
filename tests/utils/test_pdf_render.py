"""Tests for PDF rasterization helpers."""

from __future__ import annotations

import pytest

from mudidi.utils.pdf_render import needs_pdf_rasterization, run_needs_pdf_rasterization


@pytest.mark.parametrize(
    ("model", "expected"),
    [
        ("gemini/gemini-3-flash-preview", False),
        ("google/gemini-2.0-flash", False),
        ("openrouter/qwen/qwen3-vl-235b-a22b-instruct", True),
        ("openrouter/anthropic/claude-3.5-sonnet", True),
    ],
)
def test_needs_pdf_rasterization(model: str, expected: bool) -> None:
    assert needs_pdf_rasterization(model) is expected


def test_run_needs_pdf_rasterization_when_default_gemini_only() -> None:
    assert (
        run_needs_pdf_rasterization(
            "gemini/gemini-3-flash-preview",
            "gemini/gemini-3-flash-preview",
            "gemini/gemini-3-flash-preview",
        )
        is False
    )


def test_run_needs_pdf_rasterization_when_stage_override_uses_openrouter() -> None:
    assert (
        run_needs_pdf_rasterization(
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
        )
        is True
    )


def test_run_needs_pdf_rasterization_uses_stage_models_not_default_model() -> None:
    """Stage-specific overrides must trigger rasterization even if --model is Gemini."""
    assert (
        run_needs_pdf_rasterization(
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
        )
        is True
    )
    assert (
        run_needs_pdf_rasterization(
            "gemini/gemini-3-flash-preview",
            "openrouter/qwen/qwen3-vl-235b-a22b-instruct",
            "gemini/gemini-3-flash-preview",
        )
        is True
    )
