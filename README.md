# Robot Framework Automation Demo
Here, I have developed sample test cases for a sample web site (https://www.saucedemo.com/).

This project is developed to demontrate Web UI automation using Robot Framework and Selenium Library.

Test cases are in `tests` directory and covers all functionality.

## Prerequsite
1. Download and Install [Python](https://www.python.org/downloads/ "Python").
2. Check Python installation
    `python3 -V`
3. Install [pip](https://pip.pypa.io/ "pip").
    `pip3 -V`
4. Install Robot Framework.
    `pip3 install robotframework`
5. Install Selenium Library.
    `pip3 install robotframework-seleniumlibrary`
6. Download and install VSCode [VSCode](https://code.visualstudio.com/docs/?dv=osx "VSCode").
7. Install [Robot Code](https://marketplace.visualstudio.com/items?itemName=d-biehl.robotcode "Robot Code") extension from VSCode's Marketplace
8. Install Browser Drivers 
    `pip3 install webdrivermanager`


## Usage
Starting from Robot Framework 3.0, tests are executed from the command line
using the ``robot`` script or by executing the ``robot`` module directly

The basic usage is giving a path to a test (or task) file or directory as an
argument with possible command line options before the path

    robot -d results tests/.

***-d***" refers to the test results. The location to save the test results can be specified here.


Run ``robot --help`` and ``rebot --help`` for more information about the command
line usage. For a complete reference manual see [Robot Framework User Guide](https://robotframework.org/robotframework/latest/RobotFrameworkUserGuide.html "Robot Framework User Guide").
