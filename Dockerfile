# ---------- Stage 1: base (install our package) ----------
FROM python:3.12-slim AS base
WORKDIR /app
COPY pyproject.toml README.md ./
COPY src ./src
RUN pip install --no-cache-dir .

# ---------- Stage 2: test (CI uses this to lint + test) ----------
FROM base AS test
RUN pip install --no-cache-dir pytest ruff
COPY tests ./tests
CMD ["sh", "-c", "ruff check src tests && pytest -v"]

# ---------- Stage 3: runtime (the image we ship) ----------
FROM base AS runtime
# Run as a non-root user (good security habit)
RUN useradd --create-home appuser
USER appuser
ENTRYPOINT ["mycalc"]
CMD ["--help"]
