import json

f=open("podaci.json")
podaci=json.load(f)
f.close()
podaci=podaci['data']

import csv
import re
import numpy
#FALE KLJUCNE RECI
row_lists=[]
f=open("indirect38.fasta.load", "r")
#f=open("proba.txt", "r")
g=open("regions.txt", "r")
data=f.read()
dataR=g.read()
g.close()

import ast
  
# reading the data from the file
with open('keywordDictionary.txt') as file:
    keywordMap = file.read()
  
keywords = ast.literal_eval(keywordMap)


repeats=re.findall("[A-Z]+\n", data)
ids=re.findall("DP[0-9]+", data)
identifikator=0
for i in range(len(repeats)):
    repeats[i]=repeats[i].strip()

#IZDVAJAMO SAMO ONE ID_PROTEINA KOJI SADRZE PONOVLJENE SEKVENCE-SAMO 258 PROTEINA IMA OVE REGIONE
unique_ids=(set(ids))
#print(len(unique_ids))

data=data.split('\n')

ind_intersect=0
ind_contains=0


with open('datasetIndirectNew.csv', 'a', newline='') as file:
    
    writer = csv.writer(file, delimiter=',')
    row_list=[]
    references=[]
    taxonomy=[]
    disorder_content=[]
    text=[]


    for m in range(len(repeats)):
        row_list.append(repeats[m].strip())
        split_data=data[m].split(',')
        for i in range(len(podaci)):
            ids=podaci[i]['disprot_id']
            if ((podaci[i]['disprot_id'] in unique_ids) and podaci[i]['disprot_id']== split_data[0]):
                regions=podaci[i]['regions']
                taksonomija=podaci[i]['taxonomy']
                disorder_content.append(podaci[i]['disorder_content'])
                taxToString=" ".join(taksonomija)
                row_list.append(taxToString)
                row_list.append(podaci[i]['disorder_content'])
        
                for j in range(len(regions)):
                    start=regions[j]['start']
                    end=regions[j]['end']
                    region=range(start, end+1)

        
                    if (((int(split_data[1]) in region) and int((split_data[2]) in region)) or ((int(split_data[3]) in region) and (int(split_data[4]) in region))):
                        ind_contains=1
                        ind_intersect=0
                        row_list.append(ind_intersect)
                        row_list.append(ind_contains)
                        ind_contains=0
                    elif ((int(split_data[1]) in region) or (int(split_data[2]) in region) or (int(split_data[3]) in region) or (int(split_data[4]) in region)):
                        ind_intersect=1
                        ind_contains=0
                        row_list.append(ind_intersect)
                        row_list.append(ind_contains)
                        ind_intersect=0
                    else:
                        row_list.append(0)
                        row_list.append(0)
                    row_list.append(keywords[ids])
                    row_lists.append(row_list)


                    row_list=[]
                    row_list.append(repeats[m].strip())
                    row_list.append(taxToString)
                    row_list.append(podaci[i]['disorder_content'])
        row_list=[]
    writer.writerows(row_lists)