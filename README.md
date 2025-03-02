# Shell Command Template

This repository contains a template for a Python script that uses `argparse` for command-line argument parsing. The application is a functional template, so the code is runnable but doesn't achieve anything in particular.

## How to Use `argparse`

The `argparse` module makes it easy to write user-friendly command-line interfaces. The program defines what arguments it requires, and `argparse` will figure out how to parse those out of `sys.argv`.

## Docker Application

This template is designed to run inside a Docker container. Follow the instructions below to build and run the Docker container.

### Requirements

- Docker installed on your machine.

### Installing the Alias

You can use the provided `install.sh`, `install.ps1`, or `install.cmd` script to build the Docker image and create an alias for running the script more easily.

#### Using install.sh (for Unix-based systems)

```sh
chmod +x install.sh

./install.sh
```

#### Using install.ps1 (for PowerShell)

```powershell
.\install.ps1
```

#### Using install.cmd (for Command Prompt)

```cmd
install.cmd
```

This will build the Docker image and add an alias to your shell config file so you can run the script using the `testscript` command.

Make sure to reload your profile to apply the changes:

```sh
source ~/.bash_profile  # or source ~/.bashrc, source ~/.zshrc depending on your shell
```

### Running the Script

To run the script with a specific directory:

```sh
testscript -d /path/to/directory
OR
testscript --directory /path/to/directory
```

If no directory is specified, the script will use the current working directory by default.

```sh
testscript
```

## License

This project is licensed under the MIT License. See the [LICENSE](./LICENSE) file for details.