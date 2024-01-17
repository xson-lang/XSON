#!/bin/bash
# 'docs' folder needs to be set as the working directory

# Declare arrays
declare -a titles
declare -a keys

# Special characters that are used for refactoring
dash=$(echo -e "\xE2\x80\x90")
dash_url="%E2%80%90"
colon=$(echo -e "\xEA\x9E\x89")
colon_url="%EA%9E%89"

# Output colors
cyan="\033[1;36m"
green="\033[1;32m"
reset="\033[0m"

# Store the file name and id for each extension
# Also refactor the file names
cd Extensions
for file in XLE-*.md; do
    id=$(grep -oP "XLE-\K[0-9]+" <<< ${file%.md})
    name=$(grep -oP "XLE-([0-9]+)=\K.*" <<< ${file%.md})
    keys[$id]=$(sed -e "s/-/$dash/g" -e "s/_/-/g" <<< $name)
    titles[$id]=$(sed "s/_/ /g" <<< $name)
    echo -e "${cyan}Found '${green}XLE-$id${cyan}: ${titles[$id]}' ${reset}(Refactoring to '${keys[$id]}')"
    mv $file "XLE$dash$id$colon-${keys[$id]}.md"
done

# Refactor extension set file names
cd ../Extension\ Sets
extset_list=""
extset_list_macro='\${EXTSET_LIST}'
for file in *.md; do
    name=$(grep -oP '\`\K(.*?)(?=\`)' <<< "$file")
    renamed=$(sed -e "s/-/$dash/g" -e "s/_/-/g" <<< "${file%.md}")
    extset_list="$extset_list[$name](Extension-Set-$renamed)\n\n"
    echo -e "${cyan}Found extension set \`${green}$name${cyan}\` ${reset}(Renaming to 'Extension-Set-$renamed')"
    mv $file "Extension-Set-$renamed.md"
done

# Replace ${XLE-#}, ${XLE-#_LINK}, and ${XLE-#_NAME} macros in each file
cd ..
for file in ./Extensions/*.md ./Extension\ Sets/*.md; do
    for id in $(grep -oP '\${XLE-\K([0-9]+)(?=.*?})' "$file" | sort -u); do
        macro_prefix='\${XLE-'$id
        link="XLE$dash_url$id$colon_url-${keys[$id]}"
        name="${titles[$id]}"
        sed -i \
            -e "s|${macro_prefix}}|[XLE-$id: $name]($link)<br\/>|g" \
            -e "s|${macro_prefix}_LINK}|$link|g" \
            -e "s|${macro_prefix}_NAME}|$name|g" \
        "$file"
    done;
done

# Replace ${XLE_LIST} and ${EXTSET_LIST}in _Sidebar.md
ext_list=""
ext_list_macro='\${XLE_LIST}'
for id in "${!titles[@]}"; do
    ext_list="$ext_list[XLE-$id: ${titles[$id]}](XLE$dash_url$id$colon_url-${keys[$id]}) <br\/>\n"
done
sed -i \
    -e "s|$ext_list_macro|$ext_list|g" \
    -e "s|$extset_list_macro|$extset_list|g" \
"_Sidebar.md"