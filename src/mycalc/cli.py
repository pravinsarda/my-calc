"""Command-line entry point: `mycalc add 2 3` prints 5.0"""

import argparse

from mycalc import core

OPERATIONS = {
    "add": core.add,
    "subtract": core.subtract,
    "multiply": core.multiply,
    "divide": core.divide,
}


def main() -> None:
    parser = argparse.ArgumentParser(prog="mycalc", description="A tiny calculator")
    parser.add_argument("operation", choices=OPERATIONS.keys())
    parser.add_argument("a", type=float)
    parser.add_argument("b", type=float)
    args = parser.parse_args()
    print(OPERATIONS[args.operation](args.a, args.b))


if __name__ == "__main__":
    main()
