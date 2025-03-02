#!/usr/bin/env python3

import os
import argparse
import pandas as pd # type: ignore

def processing(process_directory):
    df = pd.DataFrame()
    df['A'] = [1, 2, 3]
    df['B'] = [4, 5, 6]
    df['C'] = [7, 8, 9]
    df.to_csv(os.path.join(process_directory, "output.csv"), index=False)
    print("Dataframe saved to output.csv")
    return

def main():
    # argparse is a module for parsing command-line arguments.
    # It allows you to define what arguments your program requires, and handles parsing those arguments from sys.argv.
    parser = argparse.ArgumentParser(description="A script template with argument parsing.")

    # Add arguments
    parser.add_argument('-d', '--directory', type=str, help='Sets the directory to process', default=os.getcwd())

    # Parse the arguments
    args = parser.parse_args()


    process_directory = args.directory
    processing(process_directory)
    


if __name__ == "__main__":
    try:
        os.chdir("/app/data")
        main()
    except Exception as e:
        print(f"An error occurred: {e}")
        exit(1)
    finally:
        print("Script finished.")
