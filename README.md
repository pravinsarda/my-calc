# mycalc

A tiny calculator package used to learn CI/CD with Docker and GitHub Actions.

## Run locally

```bash
pip install -e ".[dev]"
pytest -v
mycalc add 2 3
```

## Run with Docker

```bash
docker build --target test -t mycalc-test .     # build the test image
docker run --rm mycalc-test                      # run lint + tests

docker build --target runtime -t mycalc .        # build the app image
docker run --rm mycalc add 2 3                   # prints 5.0
```

## CI/CD

`.github/workflows/ci-cd.yml` runs automatically on GitHub:

- **Pull request** -> build test image, run lint + tests
- **Push to main** -> same tests, then build and push the image to `ghcr.io/<you>/<repo>`
