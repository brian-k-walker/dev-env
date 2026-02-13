# Auto-configure git credentials if environment variables exist
if [ ! -z "$GIT_PWD" ] && [ ! -z "$GIT_USER" ]; then
    echo "https://${GIT_USER}:${GIT_PWD}@github.com" > ~/.git-credentials
    chmod 600 ~/.git-credentials
fi

alias jupyterstart="jupyter notebook --ip=0.0.0.0 --port=8888 --no-browser --allow-root > /dev/null 2>&1 &"
