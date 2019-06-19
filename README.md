# Cloud Run Talk
This repository contains example code I used for a talk on Google Cloud Run in Toronto.

## Running It Yourself
If you'd like to run through this example yourself, there are a few things you've gotta do first.

1. Make sure you've got a Google Cloud account, and have set up the gcloud command line tool.
2. Make sure you have the Docker CE installed running on your local development machine.
3. Go into the makefile and edit the `IMAGE_NAME` variable to use your project name. `radical-sloth` should be replaced with whatever the Google Cloud project you use is.

### Getting Set Up
As long as you've got all the requirements listed above, you should be able to clone the repository, `cd` into it, and run the following command to build and tag the image (it may take a minute to install dependencies).

```bash
make build
```

Confirm the app is working by running the following command and visiting `0.0.0.0:5000`, you should see the web page in your browser displaying some cat facts. Use `Ctrl-C` to stop the server.

```bash
make run
```

### Deployment
Once you've got a local version built and tagged on your machine, and you've ensured it can function correctly, you can then push your built image to the Google Container Registry (GCR), and deploy a cloud run service from there with the following two commands.

```bash
# Push your latest built image to gcr.io
make push
```

```bash
# Deploy the image from gcr.io to production (Cloud Run)
# Follow any instructions it may ask, like if you want to authenticate it to everyone
make deploy
```

That's it. Your service should be deployed. For any code changes, make your changes, run `make build`, then `make push` and `make deploy` for an easy deployment process.
