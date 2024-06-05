# API Automation Project with Robot Framework

## Overview

Test Automation Project with Robot Framework - NOS Automation Testing

## Project Structure

- `config/`: Contains configuration files, including the `package` file which maps the libraries and all project files.
- `data/`: Contains data files, including `endpoints.yaml` with all the API endpoints.
- `resources/`: Contains reusable keywords.
- `results/`: Directory where test reports and logs are saved.
- `tests/`: Contains the test case files.
- `.gitignore`: Specifies files and directories to be ignored by git.
- `README.md`: Project documentation.
- `requirements.txt`: Python dependencies.

## Libraries Used

The following libraries are used in this project:

- **Robot Framework**: A test automation framework for acceptance testing and acceptance test-driven development (ATDD).
- **RequestsLibrary**: A Robot Framework library for making HTTP requests.
- **Collections**: A standard library in Robot Framework for handling lists and dictionaries.
- **JSONLibrary**: A Robot Framework library for manipulating JSON objects.
- **OperatingSystem**: A standard library in Robot Framework for performing operating system related tasks.
- **YAMLLibrary**: A Robot Framework library for reading and writing YAML files.

## Installation

1. **Install Python:**

    Download and install Python from the official website:
    ```bash
    https://www.python.org/downloads/
    ```

2. **Clone the repository:**

    ```bash
    git clone https://github.com/rafaelalmeidasouza/AutomationTestingNOS.git
    ```

3. **Install the required packages:**

    ```bash
    pip install -r requirements.txt
    ```

## Running the Tests

To execute all tests, navigate to the project root directory and run:

```bash
robot tests/
