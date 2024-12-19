# Olympic_Medals_2024_v2
# Running the 2024 Olympics Shiny App in Docker

## Overview
This guide explains how to build, run, and access the Shiny app for analyzing the 2024 Paris Olympics medals data using Docker.

By the end of this guide, you will:
- Build the Docker image for the app.
- Run the Docker container.
- Access the app at `http://localhost:3838`.

---

## Prerequisites

### 1. Install Docker
Ensure Docker is installed and running on your machine. You can download Docker from the [official website](https://www.docker.com/).

### 2. Project Files
Ensure the following files are in the same directory as your `Dockerfile`:
- `_targets.R`
- `server.R`
- `ui.R`
- `medals_2024.csv`

---

## Steps to Run the App

### Step 1: Build the Docker Image
Open your terminal, navigate to the directory containing the `Dockerfile`, and run the following command:

```bash
docker build -t olympics_app .
```

This command builds a Docker image named `olympics_app` based on the instructions in the `Dockerfile`.

---

### Step 2: Run the Docker Container
Run the following command to start the Docker container:

```bash
docker run -p 3838:3838 olympics_app
```

Explanation:
- `-p 3838:3838`: Maps the container's port `3838` to your local machine's port `3838`.
- `olympics_app`: The name of the Docker image built in Step 1.

Once the container is running, it will output logs to your terminal. Look for the message:

```
Listening on http://0.0.0.0:3838
```

This confirms the Shiny app is running inside the container.

---

### Step 3: Access the App in Your Browser
Open your browser and go to:

[http://localhost:3838](http://localhost:3838)

You should see the Shiny app interface.

