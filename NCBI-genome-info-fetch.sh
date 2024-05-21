#!/bin/bash

# 读取输入文件中的每个访问号并循环处理
for accession in $(cat $1); do
    echo "Processing accession: $accession" >&2
    
    # 使用 esearch 和 elink 获取 biosample ID
    biosample_id=$(esearch -db assembly -query "$accession" | elink -target biosample | esummary | xtract -pattern DocumentSummary -element Accession)
    
    if [ -n "$biosample_id" ]; then
        echo "Found biosample ID: $biosample_id" >&2
        
        # 使用 esearch 和 esummary 获取详细的 biosample 信息
        biosample_info=$(esearch -db biosample -query "$biosample_id" | esummary | xtract -pattern DocumentSummary \
            -element Organism \
            -block Attribute -sep "||" -element Attribute@attribute_name,Attribute)
        
        # 打印或保存 biosample 信息
        echo -e "Accession||$accession\t$biosample_info" | csvtk transpose -t -T -H | sed '2s/^/Organism||/' | sed 's/||/\t/g' > $accession.out
    else
        echo "No biosample information found for accession: $accession" >&2
    fi
done

#合并基因组信息
csvtk join -t -T -H -O --na missing GC*out > $2
rm -rf GC*out
