#!/bin/bash

# Azure deployment script for D3 Restaurant App (Python FastAPI + React)

# Variables
RESOURCE_GROUP="d3restaurantapp-rg"
APP_SERVICE_PLAN="d3restaurantapp-plan"
WEB_APP_NAME="d3restaurantapp"
LOCATION="East US"

echo "Creating Azure Resource Group..."
az group create --name $RESOURCE_GROUP --location $LOCATION

echo "Creating App Service Plan..."
az appservice plan create --name $APP_SERVICE_PLAN --resource-group $RESOURCE_GROUP --location $LOCATION --sku B1 --is-linux

echo "Creating Web App (Python FastAPI)..."
az webapp create --resource-group $RESOURCE_GROUP --plan $APP_SERVICE_PLAN --name $WEB_APP_NAME --runtime "PYTHON|3.11"

echo "Configuring Web App settings..."
az webapp config appsettings set --resource-group $RESOURCE_GROUP --name $WEB_APP_NAME --settings SCM_DO_BUILD_DURING_DEPLOYMENT=true

echo "Enabling CORS for Web App..."
az webapp cors add --resource-group $RESOURCE_GROUP --name $WEB_APP_NAME --allowed-origins "https://d3restaurantapp.azurewebsites.net" --max-age 86400

echo "Deployment configuration complete!"
echo "Next steps:"
echo "1. Get your publish profile: az webapp deployment source config-zip --resource-group $RESOURCE_GROUP --name $WEB_APP_NAME"
echo "2. Add AZURE_WEBAPP_PUBLISH_PROFILE to GitHub repository secrets"
echo "3. Push to main branch to trigger deployment"
