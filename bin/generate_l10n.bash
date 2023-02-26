#!/bin/sh



# search_dir=lib/modules/
# for file in $(ls $search_dir)
# do
#   echo "$file"
# done


# exit 1
# Set Curent PATH
PATH_RELATIVE_DIR=${PWD}/
BASEDIR=${PWD//$HOME/\~}/
Params=($*)
# parent_path=$( cd "$(dirname "${BASH_SOURCE[0]}")" ; pwd -P )

echo "Script location:${HOME} ${BASEDIR} ${PATH_RELATIVE_DIR}"

# exit 1
# template_file=bin/template/pubspec.yaml.tmpl
# PATH_ARB="arbs"
# PATH_GENERATED="generated"
# echo $(cat ${template_file})
# eval "echo \"$(cat "${template_file}")"\" > bin/templates/pubspec.yaml

# BASEDIR=$(dirname $0)
# echo "Script location: ${BASEDIR}"
# echo "the PWD is : ${pwd}"
# exit 1
# DEFI FUNCTION UTILS
generate_intl_module() {
    
    template_file=${PATH_RELATIVE_DIR}bin/templates/pubspec.yaml.tmpl
    
    DIR_L10N=lib/modules/$1/l10n
    
    # echo $DIR_L10N $template_file
    
    
    if [ -d "$PATH_RELATIVE_DIR$DIR_L10N" ]; then
        echo "Generate config:  ${1}"
        
        # CREATE FILE pubspec.yaml
        CLASS_NAME=$(echo ${1} |  perl -pe 's/(^|_)./uc($&)/ge;s/_//g'  )Localizations
        # CLASS_NAME="$(tr '[:lower:]' '[:upper:]' <<< ${1:0:1})${1:1}"Localizations
        PATH_ARB=l10n/arbs
        PATH_GENERATED=l10n/generated
        eval "echo \"$(cat "${template_file}")\"" > lib/modules/${1}/pubspec.yaml
        
        # exit 1
        # generate
        cd ${PATH_RELATIVE_DIR}lib/modules/${1}/
        
        flutter pub global run intl_utils:generate
        
        rm -rf pubspec.yaml pubspec.lock .packages .dart_tool
        
        cd ${PATH_RELATIVE_DIR}
    else
        echo "Error: ${1} not found. Can not continue.PATH: ${DIR_L10N}"
    fi
}

# RUN

if [ 0 -eq "${#Params[@]}" ]; then
    search_dir=lib/modules/
    ListModule=$(ls $search_dir)
else
    ListModule=$Params
fi

echo ----- Generate Start: $ListModule -----
for VARIABLE in $ListModule
do
    generate_intl_module $VARIABLE
done

echo ----- Generate Done -----