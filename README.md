# Kubernetes Continuous Deployment with TravisCI

Prototype of a continuous deployment to Kubernetes pipeline using TravisCI.

## Requirements

To run this small example you'll need to define the following environment variables in TravisCI:

- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`
- `KUBE_CONF`: Encoded Kubernetes configuration file. You can get it running `base64 -w 0 ~/.kube/config`.

## Usage

Just run `git push`! Travis will take care of building, pushing and deploying the image to Kubernetes. Make sure the Kubernetes resource (`cronjob.yaml` in our case) has the same image tag that the image Travis pushes.
