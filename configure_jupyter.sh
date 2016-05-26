# script name:     configure_jupyter.sh
# last modified:   2016/04/17
# sudo:            no

if [ $(id -u) = 0 ]
then
   echo "to be run as jns"
   exit 1
fi

# generate config and create notebook directory
jupyter notebook --generate-config
cd $home
mkdir notebooks

target=~/.jupyter/jupyter_notebook_config.py

# set up dictionary of changes for jupyter_config.py
declare -A arr
app='c.NotebookApp'
arr+=(["$app.open_browser"]="$app.open_browser = False")
arr+=(["$app.ip"]="$app.ip ='*'")
arr+=(["$app.port"]="$app.port = 9090")
arr+=(["$app.enable_mathjax"]="$app.enable_mathjax = True")
arr+=(["$app.notebook_dir"]="$app.notebook_dir = '/home/jns/notebooks'")
arr+=(["$app.password"]="$app.password = 'sha1:5815fb7ca805:f09ed218dfcc908acb3e29c3b697079fea37486a'")

# arr+=(["$app.server_extensions.append"]="$app.server_extensions.append('ipyparallel.nbextension')")

# NOTE:
# in Notebook 4.2 c.NotebookApp.server_extensions = [] is deprecated
# 
# you can run ipcluster nbextension enable but you will see 
# messages about deprecation in the server log

# apply changes to jupyter_notebook_config.py

# change or append
for key in ${!arr[@]};do
    if grep -qF $key ${target}; then
        # key found -> replace line
        sed -i "/${key}/c ${arr[${key}]}" $target
    else
        # key not found -> append line
        echo "${arr[${key}]}" >> $target
    fi
done
