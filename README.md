### Tutorial: Creating a Docker Image with Ubuntu and ROS2 Humble-Desktop-Full

This tutorial will guide you through the steps to create a Docker image that runs Ubuntu with ROS2 Humble-Desktop-Full. This image will be compatible with computers running any operating system, allowing you to develop and test ROS2 applications in a consistent environment.

#### Prerequisites
- **Docker**: Ensure Docker is installed on your machine. You can download it from the [Docker website](https://www.docker.com/products/docker-desktop).
- **Basic knowledge**: Familiarity with the command line and basic Docker commands.

#### Step 1: Set Up Your Dockerfile

The Dockerfile is a script that contains instructions to build your Docker image. It starts with a base image, installs necessary packages, and sets up the environment.

#### Step 3: Build the Docker Image

1. **Build your Docker image**:
    Navigate to your project directory and run the following command to build the image:

    ```bash
    docker build -t ros2_humble_desktop_full .
    ```

    This command tells Docker to build an image using the Dockerfile in the current directory (`.`) and tag it as `ros2_humble_desktop_full`.



1. **Start a Docker Container**:
    ```bash
    docker run -it --rm --name ros2_test_container ros2_humble_desktop_full
    ```

