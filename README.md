# NCBI-genome-download

## ncbi-genome-download
参考网站：https://github.com/kblin/ncbi-genome-download/blob/master/README.md

比如说，你想下载全部NCBI的refseq的全体细菌基因组（默认是refseq参考序列数据库），默认的格式为genbank：
ncbi-genome-download bacteria

只要genbank数据库的全体真菌基因组：ncbi-genome-download –section genbank fungi

全体病毒的fasta序列：ncbi-genome-download –format fasta viral

完成且为染色体水平的全体细菌基因组组装ncbi-genome-download –assembly-level complete,chromosome bacteria

大多数情况下，我们也许只是要属于某一个属或种的基因组。那么我们需要指定明确的分类。ncbi-genome-download–genus“Streptomyces coelicolor,Escherichia coli” bacteria

如果你有很多的taxonomy ID，那么可以把它们塞到一个文件里：ncbi-genome-download –taxid my_taxids.txt –assembly-level chromosome vertebrate_mammalian

如果你有一些需要下载基因组的accession ID，你可以将他们放在一个文件idlist里面，每行一个：ncbi-genome-download -A genome_accessions.txt -F fasta bacteria  ##注意一定要加上bacteria

## ncbi-genome-information-fetch
1. install csvtk
```
mamba install csvtk
```
2. install entrez-direct
```
mamba install entrez-direct
```
3. get script
put NCBI-genome-info-fetch.sh in your working directory
```
#转换为可执行文件
chmod +x NCBI-genome-info-fetch.sh
```
3. running example
```
#./NCBI-genome-info-fetch.sh <accession file> <output>
./NCBI-genome-info-fetch.sh genome_accessions.txt Genome_info.txt
```




