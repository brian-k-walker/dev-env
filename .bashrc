# Auto-configure git credentials if environment variables exist
if [ ! -z "$GIT_PWD" ] && [ ! -z "$GIT_USER" ]; then
    echo "https://${GIT_USER}:${GIT_PWD}@github.com" > ~/.git-credentials
    chmod 600 ~/.git-credentials
fi
# Set Project ID for gcloud
gcloud auth application-default set-quota-project gen-lang-client-0161327526
gcloud config set project gen-lang-client-0161327526

alias jupyterstart="jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root  --NotebookApp.token='abc123' > /dev/null 2>&1 &"
alias glogin="gcloud auth application-default login --scopes='https://www.googleapis.com/auth/spreadsheets,https://www.googleapis.com/auth/drive,https://www.googleapis.com/auth/cloud-platform'"
