# Overview

Use Github Actions to perform an initial **lint**, **test**, and **install** cycle for a Python-based machine learning application using the _Flask_ web framework.

Then, integrate this project with _Azure Pipelines_ to enable Continuous Delivery to _Azure App Service_.

## Project Plan

Check my [Trello board](https://trello.com/b/5pq3f2Fz/udacity-azure-project-2) for the project and the [spreadsheet](https://docs.google.com/spreadsheets/d/1r3H3RASpszz92dc93cNTnuSI9tiBLuNdp57wS8vRjj0/edit?usp=sharing) that includes the original and final project plan.

## Instructions

- Architectural Diagram

  ```mermaid
  flowchart LR
    A[GitHub]-. Commit .-> B[Azure Pipelines]
    subgraph Azure
    B --> C[Azure App Service]
    C --> D[Flask ML API]
    end
  ```

### Provision the target Azure App Service

- In the Cloud Shell, clone the repository using `git clone`. For example use:

  ```bash
  git clone git@github.com:samds/Udacity-Azure-Cloud-DevOps-Project2.git
  cd Udacity-Azure-Cloud-DevOps-Project2
  ```

  ![Git Clone Command Result](/assets/images/GitClone.png)

- Build the code

  ```bash
  python3 -m venv .env
  source .env/bin/activate
  make all
  ```

- All tests shall pass
  ![Lint & Test](/assets/images/makelinttest.png)

- In the Cloud Shell, use `az webapp up` to create an App Service and initially deploy the app.

  ```bash
  az webapp up -n "samuel-flask-sklearn" --location "West Europe" --sku F1 -g "udacity-azure-project2"
  ```

- To check that your App Service is running, visit the URL **https://samuel-flask-sklearn.azurewebsites.net**. You should see
  ![Home Page](/assets/images/Home.PNG)

### Deploy to Azure App Service from Azure Pipelines

- Deploy the project in Azure Pipelines using [the official documentation](https://docs.microsoft.com/en-us/azure/devops/pipelines/ecosystems/python-webapp?view=azure-devops).
  You should end-up with a Yaml file similar to this:
  ![Azure Yaml File](/assets/images/Yaml.PNG)

  You're now ready to run your pipeline!
  ![Azure Pipelines](/assets/images/AzurePipelines.PNG)

- Run Azure App Service from Azure Pipelines automatic deployment
  ![Azure Pipelines Successful Deployment](/assets/images/AzurePieplinesDeploy.PNG)

- Run a prediction

  In the Cloud Shell, go to your app directory and run the following commands

  ```bash
  chmod +x make_predict_azure_app.sh
  ./make_predict_azure_app.sh
  ```

  ![Prediction Result](/assets/images/TestRun.PNG)

  You may need to update the file **make_predict_azure_app.sh** with the name of your app service.

- Output of streamed log files from deployed application.

  In the Cloud Shell, run the command `az webapp log tail`. By example:

  ```bash
  az webapp log tail --resource-group udacity-azure-project2 --name samuel-flask-sklearn
  ```

  ![WebApp Logs](/assets/images/webapplog.PNG)

  >

## Enhancements

- We might introduce a staging phase to test our app before going in production
- Add more tests
- Use Docker and Kubernetes

## Demo

<TODO: Add link Screencast on YouTube>
