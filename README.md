[README.md](https://github.com/user-attachments/files/34033490/README.md)
# Automated API Testing Suite for Swagger Petstore (`pet story`)

This repository contains an automated test suite designed for the public **Swagger Petstore (v2)** REST API. The project demonstrates advanced end-to-end (E2E) testing workflows, query integration, dynamic data generation, and command-line automation.

## 🚀 Key Features
* **End-to-End (E2E) Testing Workflow:** Covers the entire lifecycle of a pet entity—from dynamic creation to validation, updating, and final deletion.
* **Dynamic Data Passing:** Automatically extracts the newly created pet's ID from the server response (`response.id`) and stores it as a collection variable (`PetID`) to feed subsequent requests.
* **Data Driven / Dynamic Inputs:** Utilizes built-in Postman dynamic variables (`$randomInt`, `$randomFirstName`) to ensure completely unique test data on every single run, eliminating record duplication conflicts.
* **One-Click Local Execution:** Features a cross-platform Bash automation script that triggers the entire suite locally via a single command.
* **Advanced Interactive Reporting:** Integrated with an HTML reporter to generate structured, production-ready graphical dashboards.

## 🛠 Tech Stack
* **Postman** — Test design, authoring, and collection structuring.
* **JavaScript (Chai.js / Postman Sandbox)** — Writing functional assertions and runtime scripts.
* **Node.js & Newman** — CLI collection runner for executing tests outside the Postman GUI environment.
* **Newman Reporter Htmlextra** — Extended plugin for generating high-fidelity HTML report summaries.
* **Bash** — Shell scripting for command-line automation.

## 📁 Collection Structure & Test Coverage
All test cases are organized inside the `New Folder` directory, containing the following validation types for each respective endpoint:

1. **`GET : Find Pet Status (200)`** — Validates the pet filtration system. Asserts HTTP 200 OK status and verifies that server response time falls within performance limits (< 300ms).
2. **`GET : Find Pet Status (400)`** — A negative test case designed to evaluate the server's behavior when handling unexpected or missing query parameters.
3. **`POST : Add a new pet to the store`** — Registers a new pet utilizing a randomized ID and name. Extracts `response.id` to set the `PetID` runtime variable. Verifies HTTP 200 status, ensures the presence of the mandatory `Content-Type: application/json` header, and evaluates response latency.
4. **`GET : Find pet by ID`** — Retrieves the freshly created pet by its dynamically stored `{{PetID}}`. Verifies query success and response latency.
5. **`PUT : Update а pet`** — Modifies the existing pet object's properties (updates the name to a new randomized value). Asserts HTTP 200 status and tracks response time.
6. **`DELETE : delete`** — Purges the pet record from the database by its ID. Runs a final structural check for an HTTP 200 OK confirmation.

> *Note: Due to the high public load on the open Swagger Petstore sandbox, response times might occasionally exceed the strict 300ms threshold. This latency spike is expected behavior for this specific shared training environment.*

## 💻 Local Installation & Usage
To run these automated tests locally, you need **Node.js** and a Unix-like terminal (such as **Git Bash** for Windows) installed on your machine.

1. Clone this repository or download the project files into a local directory.
2. Open your terminal and install the required dependencies globally:
   ```bash
   npm install -g newman newman-reporter-htmlextra
   ```
3. Run the automation shell script:
   ```bash
   ./run_tests.sh
   ```

## 📊 Test Reports & Analytics
Upon script execution, Newman processes the entire collection, creates an isolated `newman` folder in your root directory, and builds a comprehensive `final_report.html` file. The script will automatically launch this file in your default web browser.

The generated report features:
* Interactive pie charts outlining passed vs. failed test cases.
* Complete logs of all HTTP request/response Headers and Bodies.
* Detailed failure diagnostics under a dedicated "Failed Tests" tab for effortless debugging.
