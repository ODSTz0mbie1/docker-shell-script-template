#!/usr/bin/env python3

import os
import argparse

def main():
    # argparse is a module for parsing command-line arguments.
    # It allows you to define what arguments your program requires, and handles parsing those arguments from sys.argv.
    parser = argparse.ArgumentParser(description="A script template with argument parsing.")
    parser.add_argument('-d', '--directory', type=str, help='Directory to process', default=os.getcwd())
    args = parser.parse_args()
    current_directory = args.directory
    print(f"Processing directory: {current_directory}")

if __name__ == "__main__":
    main()
