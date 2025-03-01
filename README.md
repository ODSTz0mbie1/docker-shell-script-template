# Bash Script Template

This repository contains a template for a Python script that uses `argparse` for command-line argument parsing.

## How to Use `argparse`

The `argparse` module makes it easy to write user-friendly command-line interfaces. The program defines what arguments it requires, and `argparse` will figure out how to parse those out of `sys.argv`.

### Installing the Alias

You can use the provided `install.sh` script to create an alias for running the script more easily.

```sh
./install.sh
```

This will add an alias to your `~/.bash_profile` so you can run the script using the `pytest` command:

```sh
pytest --directory /path/to/directory
```

Make sure to reload your profile to apply the changes:

```sh
source ~/.bash_profile
```

### Running the Script

To run the script with a specific directory:

```sh
python3 main.py --directory /path/to/directory
```

If no directory is specified, the script will use the current working directory by default.

```sh
python3 main.py
```

To run the script using the alias:

```sh
pytest --directory /path/to/directory
```

If no directory is specified, the script will use the current working directory by default.

```sh
pytest
```