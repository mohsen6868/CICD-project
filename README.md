This repository contains the necessary files and instructions to build, tag, push, and deploy the SafirSite application using Docker and Kubernetes. Below is a detailed description of each file and its role in the deployment process.

Dockerfile:

The Dockerfile is used to build the Docker image for the SafirSite application. Here’s a breakdown of each step in the file:

Base Image: The image is based on Node.js 20.9.0-alpine.

Dependencies: Installs necessary dependencies including python3, make, g++, sharp, and node-sass.

Build: Copies the source code and builds the application.

Run: Exposes port 3000 and starts the application using npm run start.


Jenkins Pipeline:

The Jenkins pipeline (Jenkinsfile) automates the process of building, tagging, pushing the Docker image, and deploying the application to Kubernetes.

Environment Variables: Sets the VERSION variable using the build number and Git commit hash.

Stages:

Clean Workspaces: Cleans up the workspace.

Checkout Stage: Checks out the code from the Git repository.

Docker Build: Builds the Docker image.

Tag and Push Docker Image: Tags and pushes the Docker image to the repository.

Deploy to Kubernetes: Deploys the application to the Kubernetes cluster.

Kubernetes Configuration:

The Kubernetes configuration files (safirsite-kubernetes.yaml) define the services and deployment for the SafirSite application.

Services:

ClusterIP Service: Internal service that routes traffic within the cluster.

NodePort Service: Exposes the application on a specific port (32412) on each node in the cluster.
Deployment:
Deployment Configuration: Deploys the SafirSite application, specifying resource requests and limits, environment variables, and image pull policy.
