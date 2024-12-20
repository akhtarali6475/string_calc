# String Calculator Rails App


This Rails application provides an API endpoint to perform addition on a string of numbers using a customizable delimiter. The core functionality is implemented in the `StringCalculator` service class, and the `CalculatorsController` exposes it via a web interface.

## Features

1. **Basic Addition**: Add up to two numbers separated by a comma.
2. **Flexible Number Handling**: Supports an unknown number of numbers.
3. **Multi-Line Input**: Handles new lines between numbers in addition to commas.
4. **Custom Delimiters**: Accepts custom delimiters in the format `//[delimiter]\n`.
5. **Negative Numbers Check**: Throws an exception if negative numbers are included.
7. **Delimiters of Any Length**: Support delimiters of any length.
8. **Multiple Delimiters**: Support multiple delimiters.
9. **Long Multiple Delimiters**: Processes multiple delimiters with lengths longer than one character.

## Getting Started

### Prerequisites

- Ruby (version 3.1.4)
- Rails (version 7.0.8)

### Installation

1. **Clone the repository**:

    ```bash
    git clone git@github.com:akhtarali6475/string_calc.git
    cd string_calc
    ```

2. **Install dependencies**:

    ```bash
    bundle install
    ```

3. **Set up the database**:

    If you have a database setup, run:

    ```bash
    rails db:create
    rails db:migrate
    ```

### Running the Application

Start the Rails server:

```bash
rails server
