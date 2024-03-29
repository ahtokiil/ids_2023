### Morphologically disambiguated corpus

1. Content

The work with the morphological disambiguation of Estonian began in the COPERNICUS-project "Multext-East" (1995-1997). During that project G. Orwell's novel "1984" was disambiguated. 
The main part of this corpus, 400 000 words, has been disambiguated during 2002-2003. This work has been supported by the national program "Eesti keel ja rahvuskultuur" 
(Estonian Language and National Culture). The following researchers have participated in this work: Külli Habicht, Heiki-Jaan Kaalep, Neeme Kahusk, Kadri Muishnek, 
Heili Orav, Andriela Rääbis, Kadri Vider.

The texts belong to the following text classes:

[Texts](https://www.cl.ut.ee/korpused/morfkorpus/index.php?lang=en):

| Text class | Number of words |
|---------------------------------------|---------------:|
| Fiction (Estonian authors) | 104 000 |
| G. Orwell's "1984" | 75 500 |
| Newspaper texts | 111 000 |
| Legal texts | 121 000 |
| Texts from the scientific magazine "Horisont" | 98 000 |
| Reference texts | 4000 |
| Altogether | 513 000 |

2. Processing

2.1 The corpus consists of 128 *.kym files that were concatenated into one .txt file.

```python
import os

# Method to concatenate all *.kym files into one .txt file
def read_kym_files(folder_path):
    text_array = []
    # List all files in the specified folder
    for root, dirs, files in os.walk(folder_path):
        for file in files:
            if file.endswith(".kym"):
                kym_file_path = os.path.join(root, file)

                # Read the content of each .kym file and append to the text_array
                with open(kym_file_path, "r", encoding="utf-8") as kym_file:
                    file_content = kym_file.read()
                    text_array.append(file_content)

    return text_array

# Now result_text_array contains the content of all .kym files in the specified folder

def write_to_single_file(output_file_path, text_array):
    with open(output_file_path, "w", encoding="utf-8") as output_file:
        for text_content in text_array:
            output_file.write(text_content)

# Run method to concatenate all *.kym files
folder_path = "E:\IDS_project_fall2023\Morf_corp_files"
output_file_path = "E:\IDS_project_fall2023\morph_corp.txt"
result_text_array = read_kym_files(folder_path)
write_to_single_file(output_file_path, result_text_array)
```

2.2 Tags, interpunctuation, numericals etc. were removed.

```python
# Clean morph corpus of tags, interpunctuation, numericals etc.

# Lines in corpus
counter1 = 0
# Lines written
counter2 = 0

with open('morph_corp.txt', 'r', encoding='utf-8') as file_in:
    with open('clean_morph_corpus.txt', 'w', encoding='utf-8') as file_out:
        start_sentence = False
        for row in file_in:
            counter1 += 1
            if '<s>' in row:
                start_sentence = True
            if '</s>' in row:
                start_sentence = False

            tokens = row.strip().split()
            first_string = row.strip().split(('\t'), 1)[0].lower()

            if start_sentence == True and first_string[0].isalpha():
                row = '\t'.join(
                    tokens[:3] + [' '.join(tokens[2:])]) if len(tokens) >= 3 else ''
                file_out.write(row + '\n')
                counter2 += 1

print(f"Number of lines in corpus: {counter1}")
print(f"Number of lines written to file: {counter2}")
```

2.3 Counting the verb forms, writing results to a .txt file.

```python
# Counting different verb form occurencies in corpus, writing results to .txt file

tag_counts = {}

with open('clean_morph_corpus.txt', 'r', encoding='utf-8') as file:
    for line in file:
        tokens = line.strip().split('\t')
        if len(tokens) > 2:
            if tokens[2] == '//_V_':
                tag = tokens[3]
                tag_counts[tag] = tag_counts.get(tag, 0) + 1

total_count = sum(tag_counts.values())

sorted_counts = sorted(tag_counts.items(), key=lambda x: x[1], reverse=True)

with open('morph_corpus_summary.txt', 'w', encoding='utf-8') as output_file:
    for tag, count in sorted_counts:
        relative_frequency = count / total_count
        tag = tag[6:-3]
        output_file.write(f"{tag:50}\t{count:6}\t{relative_frequency:.6f}\n")

print(f"Total verb count: {total_count}\n")
```

3. Verbs

From 492 519 words in the corpus there are 96 510 verbs (weight = 0.195952).

The verbforms are represented as follows:

| *Form tag* | *Count* | *Weight* |
| --- | ---: | --- |        
| main indic pres ps3 sg ps af                       | 15 167     | 0.157155     |
| main indic impf ps3 sg ps af                       | 14 779     | 0.153134     |
| main inf                                           | 10 355     | 0.107295     |
| aux neg                                            | 5997      | 0.062139     |
| main partic past ps                                | 4934      | 0.051124     |
| main indic pres ps3 pl ps af                       | 3693      | 0.038265     |
| main sup ps ill                                    | 3623      | 0.037540     |
| main indic pres ps neg                             | 3411      | 0.035343     |
| main indic impf ps3 pl ps af                       | 2916      | 0.030214     |
| main indic pres imps af                            | 2909      | 0.030142     |
| main partic past imps                              | 2791      | 0.028919     |
| aux indic pres ps3 sg ps af                        | 2567      | 0.026598     |
| main indic impf ps neg                             | 2009      | 0.020816     |
| mod indic pres ps3 sg ps af                        | 1943      | 0.020133     |
| main ger                                           | 1803      | 0.018682     |
| main indic impf imps af                            | 1689      | 0.017501     |
| aux indic impf ps3 sg ps af                        | 1541      | 0.015967     |
| main indic impf ps1 sg ps af                       | 1361      | 0.014102     |
| main indic pres ps1 sg ps af                       | 1118      | 0.011584     |
| main cond pres ps3 sg ps af                        | 798       | 0.008269     |
| mod indic impf ps3 sg ps af                        | 637       | 0.006600     |
| main indic pres ps1 pl ps af                       | 598       | 0.006196     |
| aux indic pres ps3 pl ps af                        | 568       | 0.005885     |
| aux indic pres ps neg                              | 541       | 0.005606     |
| mod indic pres ps neg                              | 528       | 0.005471     |
| main indic pres ps2 sg ps af                       | 497       | 0.005150     |
| main sup ps in                                     | 488       | 0.005056     |
| main sup ps abes                                   | 443       | 0.004590     |
| main imper pres ps2 sg ps af                       | 394       | 0.004082     |
| aux cond pres ps3 sg ps af                         | 392       | 0.004062     |
| main indic impf ps1 pl ps af                       | 384       | 0.003979     |
| main indic pres ps2 pl ps af                       | 381       | 0.003948     |
| mod cond pres ps3 sg ps af                         | 358       | 0.003709     |
| aux indic impf ps3 pl ps af                        | 294       | 0.003046     |
| mod indic pres ps3 pl ps af                        | 294       | 0.003046     |
| main indic pres imps neg                           | 280       | 0.002901     |
| main quot pres ps af                               | 261       | 0.002704     |
| aux indic impf ps neg                              | 220       | 0.002280     |
| main imper pres ps2 pl ps af                       | 190       | 0.001969     |
| main cond pres ps neg                              | 166       | 0.001720     |
| mod indic impf ps neg                              | 151       | 0.001565     |
| main cond pres ps3 pl ps af                        | 151       | 0.001565     |
| aux indic pres ps1 sg ps af                        | 149       | 0.001544     |
| main indic impf imps neg                           | 146       | 0.001513     |
| mod partic past ps                                 | 128       | 0.001326     |
| main cond pres ps1 sg ps af                        | 127       | 0.001316     |
| mod indic impf ps3 pl ps af                        | 125       | 0.001295     |
| aux cond pres ps neg                               | 120       | 0.001243     |
| mod indic pres ps1 pl ps af                        | 102       | 0.001057     |
| main imper pres ps3 sg ps af                       | 98        | 0.001015     |
| main indic impf ps2 pl ps af                       | 96        | 0.000995     |
| main sup ps el                                     | 93        | 0.000964     |
| main indic impf ps2 sg ps af                       | 85        | 0.000881     |
| mod indic pres ps1 sg ps af                        | 78        | 0.000808     |
| aux indic impf ps1 sg ps af                        | 76        | 0.000787     |
| main imper pres ps2 sg ps neg                      | 68        | 0.000705     |
| mod cond pres ps3 pl ps af                         | 68        | 0.000705     |
| aux indic pres ps1 pl ps af                        | 66        | 0.000684     |
| aux imper pres ps2 sg ps neg                       | 62        | 0.000642     |
| aux cond pres ps3 pl ps af                         | 60        | 0.000622     |
| aux cond pres ps1 sg ps af                         | 58        | 0.000601     |
| aux indic pres ps2 pl ps af                        | 52        | 0.000539     |
| aux sup ps ill                                     | 51        | 0.000528     |
| aux quot pres ps af                                | 50        | 0.000518     |
| mod cond pres ps neg                               | 48        | 0.000497     |
| mod indic pres ps2 sg ps af                        | 48        | 0.000497     |
| main cond pres imps af                             | 44        | 0.000456     |
| mod indic impf ps1 sg ps af                        | 44        | 0.000456     |
| aux indic pres ps2 sg ps af                        | 44        | 0.000456     |
| main cond past ps3 sg ps af                        | 40        | 0.000414     |
| main sup ps tr                                     | 35        | 0.000363     |
| aux inf                                            | 34        | 0.000352     |
| mod cond pres ps1 sg ps af                         | 34        | 0.000352     |
| main cond pres ps1 pl ps af                        | 32        | 0.000332     |
| mod indic pres ps2 pl ps af                        | 31        | 0.000321     |
| mod indic pres imps af                             | 28        | 0.000290     |
| main imper pres ps1 pl ps af                       | 26        | 0.000269     |
| main cond pres ps2 sg ps af                        | 23        | 0.000238     |
| aux imper pres ps2 pl ps neg                       | 23        | 0.000238     |
| main imper pres ps2 pl ps neg                      | 23        | 0.000238     |
| main imper pres ps3 pl ps af                       | 21        | 0.000218     |
| main quot pres ps neg                              | 20        | 0.000207     |
| main cond pres ps2 pl ps af                        | 19        | 0.000197     |
| mod inf                                            | 19        | 0.000197     |
| aux indic impf ps1 pl ps af                        | 19        | 0.000197     |
| aux cond pres ps2 sg ps af                         | 16        | 0.000166     |
| mod cond past ps3 sg ps af                         | 16        | 0.000166     |
| main quot pres imps af                             | 13        | 0.000135     |
| mod cond pres ps2 sg ps af                         | 13        | 0.000135     |
| mod indic impf imps af                             | 12        | 0.000124     |
| mod cond pres ps1 pl ps af                         | 12        | 0.000124     |
| aux cond pres ps1 pl ps af                         | 12        | 0.000124     |
| aux partic past ps                                 | 10        | 0.000104     |
| aux imper pres ps3 sg ps af                        | 10        | 0.000104     |
| main partic pres ps                                | 9         | 0.000093     |
| aux ger                                            | 9         | 0.000093     |
| main sup imps                                      | 8         | 0.000083     |
| main cond pres imps neg                            | 8         | 0.000083     |
| mod quot pres ps af                                | 8         | 0.000083     |
| aux indic impf imps af                             | 8         | 0.000083     |
| main cond past ps3 pl ps af                        | 7         | 0.000073     |
| mod indic impf ps2 sg ps af                        | 6         | 0.000062     |
| mod sup ps ill                                     | 6         | 0.000062     |
| aux quot pres ps neg                               | 6         | 0.000062     |
| mod indic impf ps1 pl ps af                        | 6         | 0.000062     |
| aux indic impf ps2 sg ps af                        | 5         | 0.000052     |
| mod cond pres ps2 pl ps af                         | 5         | 0.000052     |
| mod indic impf ps2 pl ps af                        | 5         | 0.000052     |
| aux cond pres ps2 pl ps af                         | 5         | 0.000052     |
| main partic pres imps                              | 5         | 0.000052     |
| aux imper pres ps1 pl ps neg                       | 5         | 0.000052     |
| mod imper pres ps2 sg ps neg                       | 3         | 0.000031     |
| aux indic pres imps af                             | 3         | 0.000031     |
| mod cond past ps1 pl ps af                         | 3         | 0.000031     |
| main cond past ps1 pl ps af                        | 3         | 0.000031     |
| main imper pres imps af                            | 3         | 0.000031     |
| aux imper pres ps2 sg ps af                        | 3         | 0.000031     |
| main imper pres ps3 pl ps neg                      | 3         | 0.000031     |
| mod cond past ps3 pl ps af                         | 3         | 0.000031     |
| main quot pres imps neg                            | 2         | 0.000021     |
| mod quot pres ps neg                               | 2         | 0.000021     |
| main imper pres ps3 sg ps neg                      | 2         | 0.000021     |
| main cond past ps1 sg ps af                        | 2         | 0.000021     |
| aux imper pres imps neg                            | 2         | 0.000021     |
| aux imper pres ps3 pl ps neg                       | 2         | 0.000021     |
| main af                                            | 2         | 0.000021     |
| mod cond pres imps af                              | 2         | 0.000021     |
| mod sup ps abes                                    | 1         | 0.000010     |
| aux indic impf imps neg                            | 1         | 0.000010     |
| aux indic impf ps2 pl ps af                        | 1         | 0.000010     |
| mod indic impf imps neg                            | 1         | 0.000010     |
| mod cond past ps1 sg ps af                         | 1         | 0.000010     |
| aux imper pres ps3 pl ps af                        | 1         | 0.000010     |
| mod ger                                            | 1         | 0.000010     |
| main cond past ps neg                              | 1         | 0.000010     |
| mod imper pres ps2 sg ps af                        | 1         | 0.000010     |
| main imper pres imps neg                           | 1         | 0.000010     |
| mod partic past imps                               | 1         | 0.000010     |
| aux cond past ps3 sg ps af                         | 1         | 0.000010     |

The .txt file can be downloaded [here](https://github.com/ahtokiil/ids_2023/blob/main/morph_corpus_summary.txt).

4. Graphs

![Verbforms with weight >= 0.001](morph_corpus_barplot.png)

```python
# Plot the relative frequencies of verbforms in morph corp
import matplotlib.pyplot as plt

with open('morph_corpus_summary.txt', 'r', encoding='utf-8') as file:
    data = file.read()

# Process the data into lists for plotting
lines = data.strip().split('\n')
labels = [line.split('\t')[0].strip() for line in lines]
values = [float(line.split('\t')[-1].strip()) for line in lines]

# Filter out values lower than 0.001
filtered_labels = [label for label, value in zip(
    labels, values) if value > 0.001]
filtered_values = [value for value in values if value > 0.001]

# Create the distribution graph
fig, ax = plt.subplots(figsize=(15, 8))
bars = ax.bar(filtered_labels, filtered_values,
              color='gold', edgecolor='black', linewidth=0.5)
ax.set_xticks(range(len(filtered_labels)))  # Set the tick positions
ax.set_xticklabels(filtered_labels, rotation=45, ha='right',
                   fontsize=10)  # Increase font size
ax.set_ylim(0, 0.175)
ax.set_xlabel('Forms of verb "lugema"', fontsize=12)  # Increase font size
ax.set_ylabel('Frequency', fontsize=12)  # Increase font size
ax.set_title('Distribution of Verb Forms', fontsize=14)  # Increase font size

ax.grid(axis='y', linestyle='--', alpha=0.7)

# Save and display the plot
plt.tight_layout()
plt.savefig('morph_corpus_barplot.png', dpi=600)
plt.show()
```

![Verb 'lugema' forms with weight >= 0.001](Lugema_morph_corpus_barplot.png)

```python
# Plot the relative frequencies of 'lugema' verb in morph corp
import matplotlib.pyplot as plt

with open('Lugema_verbs_morph_corpus.txt', 'r', encoding='utf-8') as file:
    data = file.read()

# Process the data into lists for plotting
lines = data.strip().split('\n')
labels = [line.split('\t')[0].strip() for line in lines]
values = [float(line.split('\t')[-1].strip()) for line in lines]

# Filter out values lower than 0.001
filtered_labels = [label for label, value in zip(
    labels, values) if value > 0.001]
filtered_values = [value for value in values if value > 0.001]

# Create the distribution graph
fig, ax = plt.subplots(figsize=(15, 8))
bar_width = 1.5
bars = ax.bar(filtered_labels, filtered_values,
              color='gold', edgecolor='black', linewidth=.7)
ax.set_xticks(range(len(filtered_labels)))  # Set the tick positions
ax.set_xticklabels(filtered_labels, rotation=45, ha='right',
                   fontsize=12)  # Increase font size
ax.set_xlim(-0.75, len(filtered_labels) - 0.5)
ax.set_ylim(0, 0.175)
ax.set_xlabel('Forms of verb "lugema"', fontsize=14)  # Increase font size
ax.set_ylabel('Frequency', fontsize=14)  # Increase font size
ax.set_title('Distribution of Verb Forms', fontsize=16)  # Increase font size

ax.grid(axis='y', linestyle='--', alpha=0.7)

# Save and display the plot
plt.tight_layout()
plt.savefig('Lugema_morph_corpus_barplot.png', dpi=600)
plt.show()
```
