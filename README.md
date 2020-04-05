<!-- <include a CircleCI status badge, here> -->

[![<CircleCI>](https://circleci.com/gh/xr71/Devops-Project-Operationalize-ML-Microservices.svg?style=svg)](https://circleci.com/gh/xr71/Devops-Project-Operationalize-ML-Microservices)

## Project Overview

In this project, you will apply the skills you have acquired in this course to operationalize a Machine Learning Microservice API.

You are given a pre-trained, `sklearn` model that has been trained to predict housing prices in Boston according to several features, such as average rooms in a home and data about highway access, teacher-to-pupil ratios, and so on. You can read more about the data, which was initially taken from Kaggle, on [the data source site](https://www.kaggle.com/c/boston-housing). This project tests your ability to operationalize a Python flask app—in a provided file, `app.py`—that serves out predictions (inference) about housing prices through API calls. This project could be extended to any pre-trained machine learning model, such as those for image recognition and data labeling.

### Project Tasks

Your project goal is to operationalize this working, machine learning microservice using [kubernetes](https://kubernetes.io/), which is an open-source system for automating the management of containerized applications. In this project you will:

- Test your project code using linting
- Complete a Dockerfile to containerize this application
- Deploy your containerized application using Docker and make a prediction
- Improve the log statements in the source code for this application
- Configure Kubernetes and create a Kubernetes cluster
- Deploy a container using Kubernetes and make a prediction
- Upload a complete Github repo with CircleCI to indicate that your code has been tested

You can find a detailed [project rubric, here](https://review.udacity.com/#!/rubrics/2576/view).

**The final implementation of the project will showcase your abilities to operationalize production microservices.**

---

## Setup the Environment

- Create a virtualenv and activate it

```
make setup
source ~/.devops/bin/activate
```

- Run `make install` to install the necessary dependencies (including pylint)

```
make install
```

### Running `app.py`

1. Standalone: `python app.py`
2. Run in Docker: `./run_docker.sh` or `sudo bash run_docker.sh` if you need sudo priviledges to run docker
3. Run in Kubernetes: `./run_kubernetes.sh` or `sudo bash run_kubernetes.sh`
4. Run predictions `./make_prediction.sh`

### Kubernetes Steps

- Setup and Configure Docker locally

```
sudo docker build . -t TAGNAME
```

- Setup and Configure Kubernetes locally
  - start up `minikube`
  - run `./run_kubernetes.sh`
- Create Flask app in Container
  - same as `./run_kubernetes.sh`
- Run via kubectl
  - `kubectl create deployment NAME --image=$dockerpath`

## Files in Repository

- `config.yml` is the definition file for the CICD pipeline to be run after each commit in CircleCI (see link in the first line for more information)
- `docker_out.txt` shows the console log output from the docker run
- `kubernetes_out.txt` shows the console log output from the kubernetes run
- `requirements.txt` lists all of the python library dependencies to be installed
- `app.py` is the actual Flask application serving the API endpoints
- `Dockerfile` contains the container build definition for this app
- `Makefile` defines all of the commands for setting up, installing, and running this app
- `make_prediction.sh` helper shell script for posting a JSON to the prediction API in Flask
- `run_docker.sh` helper shell script that builds and runs the app in Docker
- `upload_docker.sh` helper shell script that pushes the local Docker image to the cloud at Docker Hub
- `run_kubernetes.sh` helper shell script that deploys the packaed app from Docker Hub into a Kubernetes cluster
