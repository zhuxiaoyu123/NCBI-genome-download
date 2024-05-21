# NCBI-genome-download

## ncbi-genome-download
参考网站：https://github.com/kblin/ncbi-genome-download/blob/master/README.md

比如说，你想下载全部NCBI的refseq的全体细菌基因组（默认是refseq参考序列数据库），默认的格式为genbank：
```
ncbi-genome-download bacteria
```

只要genbank数据库的全体真菌基因组：
```
ncbi-genome-download –section genbank fungi
```

全体病毒的fasta序列：
```
ncbi-genome-download –format fasta viral
```

完成且为染色体水平的全体细菌基因组组装:
```
ncbi-genome-download –assembly-level complete,chromosome bacteria
```

大多数情况下，我们也许只是要属于某一个属或种的基因组。那么我们需要指定明确的分类:
```
ncbi-genome-download–genus“Streptomyces coelicolor,Escherichia coli” bacteria
```

如果你有很多的taxonomy ID，那么可以把它们塞到一个文件里：
```
ncbi-genome-download –taxid my_taxids.txt –assembly-level chromosome vertebrate_mammalian
```

如果你有一些需要下载基因组的accession ID，你可以将他们放在一个文件idlist里面，每行一个：
```
ncbi-genome-download -A genome_accessions.txt -F fasta bacteria  ##注意一定要加上bacteria
```

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
```
#把脚本下载到服务器上，并转换其为可执行文件
chmod +x NCBI-genome-info-fetch.sh
```
3. running example
```
#./NCBI-genome-info-fetch.sh <accession file> <output>
./NCBI-genome-info-fetch.sh genome_accessions.txt Genome_info.txt
```
4. output
```
Accession       GCA_003008415.2 GCA_003008475.2 GCA_014191595.1 GCA_027587255.1 GCA_037029465.1 GCF_000422365.1 GCF_019904215.1
Organism        Mesoflavibacter sp. HG96        Mesoflavibacter sp. HG37        Mesoflavibacter zeaxanthinifaciens subsp. sabulilitoris Mesoflavibacter profundi       Mesoflavibacter sp. CH_XMU1404-2        Mesoflavibacter zeaxanthinifaciens DSM 18436    Mesoflavibacter sp. SCSIO 43206
strain  HG96    HG37    CECT 8597       MTRN7   CH_XMU1404-2    DSM 18436       SCSIO 43206
collection_date 2015-12 2015-12 missing 2016-01 2018-12-30      2005-07-27      2018-10
depth   300m    30m     missing 8727 m  missing missing missing
env_biome       marine biome    marine biome    missing missing missing missing missing
env_feature     sea     sea     missing missing missing missing missing
env_material    sea water       sea water       missing missing missing missing missing
geo_loc_name    Pacific Ocean: Western Pacific Ocean    Pacific Ocean: Western Pacific Ocean    missing Pacific Ocean: Mariana Trench   not applicable missing China: Hainan Island
isol_growth_condt       marine broth at 35 centigrade   marine broth at 35 centigrade   missing missing missing 17276025        https://doi.org/10.1007/s11430-019-9388-3
lat_lon 8 N 132 E       1.2 N 130 E     missing missing missing 35.30038 N 139.4999 E   18.24 N 109.36 E
num_replicons   not applicable  not applicable  missing missing missing missing 1
ref_biomaterial not applicable  not applicable  missing missing missing DSM 18436       https://doi.org/10.1007/s11430-019-9388-3
Type Strain     missing missing missing missing missing Yes     missing
env_broad_scale missing missing missing missing missing missing ENVO:01000320
type-material   missing missing type strain of Mesoflavibacter sabulilitoris    missing missing type strain of Mesoflavibacter zeaxanthinifaciens      missing
```



