### Creating a Small ROS2 Humble Project Run Through a Ubuntu-Based Docker Image  

This tutorial will guide you through the steps to create a Docker image that runs Ubuntu with ROS2 Humble-Desktop-Full and test it with a small "Hello World" project. This image will be compatible with computers running any operating system, allowing you to develop and test ROS2 applications in a consistent environment.

#### Prerequisites
- **Docker**: Ensure Docker is installed on your machine. You can download the desktop version from the [Docker website](https://www.docker.com/products/docker-desktop).
- **Git**: Ensure Git is installed on your machine. You can download it from the [Git website](https://git-scm.com/).

### Step 1: Clone the GitHub Repository

1. **Clone the Repository**:
   First, clone the GitHub repository that contains the ROS2 project files into your home directory:

   ```bash
   git clone https://github.com/Nikil-Shyamsunder/ros-nav-starter.git ~/ros2_ws
   ```
   
   This will create a directory named `ros2_ws` in your home directory with all the necessary files.

### Step 2: Build the Docker Image

1. **Build your Docker image**:
    Navigate to your project directory and run the following command to build the image:

    ```bash
    docker build -t ros2_humble_desktop_full .
    ```

    This command tells Docker to build an image using the Dockerfile in the current directory (`.`) and tag it as `ros2_humble_desktop_full`.

2. **Start a Docker Container**:
    ```bash
    docker run -it --rm --name ros2_test_container ros2_humble_desktop_full
    ```

3. **Make the Scripts Executable:** Ensure the Python scripts are executable:
   ```bash
   chmod +x ~/ros-nav-starter/ros2_ws/src/my_test_package/src/talker.py
   chmod +x ~/ros-nav-starter/ros2_ws/src/my_test_package/src/listener.py
   ```

### Step 3: Set Up and Run the Docker Container

To write the files for the project on your host machine and then run them within the Docker container, you can follow these steps:

1. **Run the Docker Container with a Bind Mount**:
   Start a Docker container that mounts your host’s workspace directory to a directory inside the container:

   ```bash
   docker run -it --rm --name ros2_test_container \
     -v ~/ros-nav-starter/ros2_ws:/home/ros2_user/ros2_ws \
     ros2_humble_desktop_full
   ```

   This command does the following:
   - `-v ~/ros-nav-starter/ros2_ws:/home/ros2_user/ros2_ws`: Mounts the `~/ros2_ws` directory on your host machine to `/home/ros2_user/ros2_ws` inside the Docker container.

2. **Build the ROS2 Workspace Inside the Container**:
   Once inside the container, navigate to the ROS2 workspace and build the package:

   ```bash
   cd /home/ros2_user/ros2_ws
   colcon build
   ```

3. **Source the Workspace**:
   Source the workspace to set up the environment:

   ```bash
   source install/setup.bash
   ```

### Step 4: Run the Nodes in the Docker Container

1. **Run the Publisher Node**:
   In the Docker container, start the publisher node:

   ```bash
   ros2 run my_test_package talker.py
   ```

2. **Open Another Terminal and Attach to the Running Container**:
   On your host machine, open a new terminal and run:

   ```bash
   docker exec -it ros2_test_container bash
   ```

   This opens a new shell in the already running Docker container.

3. **Run the Subscriber Node**:
   In the new terminal, source the workspace and run the subscriber node:

   ```bash
   source /home/ros2_user/ros2_ws/install/setup.bash
   ros2 run my_test_package listener.py
   ```

### Step 5: Verify the Output

- In the first terminal (with the publisher), you should see messages like:

  ```
  Publishing: "Hello World: 0"
  Publishing: "Hello World: 1"
  Publishing: "Hello World: 2"
  ```

- In the second terminal (with the subscriber), you should see:

  ```
  I heard: "Hello World: 0"
  I heard: "Hello World: 1"
  I heard: "Hello World: 2"
  ```

### Summary

By following these steps, you can develop and manage your ROS2 project files directly on your host machine while running and testing them inside a Docker container. This setup allows you to use your preferred development tools while ensuring a consistent runtime environment within Docker.
