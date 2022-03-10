git clone git@github.com:samds/Udacity-Azure-Cloud-DevOps-Project2.git
cd Udacity-Azure-Cloud-DevOps-Project2
python3 -m venv .env
source .env/bin/activate
make all
az webapp up -n "samuel-flask-sklearn" --location "West Europe" --sku F1 -g "udacity-azure-project2"
chmod +x make_predict_azure_app.sh
./make_predict_azure_app.sh
az webapp log tail --resource-group udacity-azure-project2 --name samuel-flask-sklearn
deallocate
