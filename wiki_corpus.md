## The Wikipedia Corpus of Estonian

1. Content

The [Wikipedia Corpus of Estonian](https://entu.keeleressursid.ee/api2/file-24762?key=G3qonxL3kavZ1NGJ79jk7eIamFRkoLZBMkHCc8jVgudimdUDeSZC5XKrn6U0wxhj) consists of selected Wikipedia articles in Estonian.

2. Processing

2.1 Tags, interpunctuation, numericals etc. were removed.

```python
# Clean wiki corpus of tags, interpunctuation, numericals etc.

# Lines in corpus
counter1 = 0
# Lines written
counter2 = 0

with open('nc21_Wikipedia_2021.vert', 'r', encoding='utf-8') as file_in:
    with open('clean_wiki_corpus.txt', 'w', encoding='utf-8') as file_out:
        start_sentence = False
        for row in file_in:
            counter1 += 1
            if '<s>' in row:
                start_sentence = True
            if '</s>' in row:
                start_sentence = False

            first_string = row.strip().split(('\t'), 1)[0].lower()

            if start_sentence == True and first_string[0].isalpha():
                file_out.write(row)
                counter2 += 1

print(f"Number of lines in corpus: {counter1}")
print(f"Number of lines written to file: {counter2}")
```

2.2 Counting the verb forms, writing results to a .txt file.

```python
# Counting different verb form occurencies in corpus, writing results to .txt file

tag_counts = {}

with open('clean_wiki_corpus.txt', 'r', encoding='utf-8') as file:
    for line in file:
        tokens = line.strip().split('\t')
        if len(tokens) > 2:
            if tokens[1][:2] == 'V.':
                tag = tokens[8]
                tag_counts[tag] = tag_counts.get(tag, 0) + 1

total_count = sum(tag_counts.values())

sorted_counts = sorted(tag_counts.items(), key=lambda x: x[1], reverse=True)

with open('wiki_corpus_summary.txt', 'w', encoding='utf-8') as output_file:
    for tag, count in sorted_counts:
        relative_frequency = count / total_count
        output_file.write(f"{tag:50}\t{count:6}\t{relative_frequency:.6f}\n")

print(f"Total verb count: {total_count}\n")
```

3. Verbs

From 8 618 382 words in the corpus there are 1 371 876 verbs (weight = 0.159180).

The verbforms are represented as follows:

| *Form tag* | *Count* | *Weight* |
| --- | ---: | --- |
| mod_indic_pres_ps3_sg_ps_af                   | 413 314 | 0.301277     |
| mod_indic_impf_ps3_sg_ps_af                   | 344 420 | 0.251058     |
| mod_inf                                       | 104 269 | 0.076005     |
| mod_indic_impf_ps_neg                         | 79 586  | 0.058013     |
| mod_indic_impf_imps_af                        | 75 933  | 0.055350     |
| mod_indic_impf_ps3_pl_ps_af                   | 52 679  | 0.038399     |
| mod_indic_pres_ps3_pl_ps_af                   | 51 159  | 0.037291     |
| mod_indic_impf_imps_neg                       | 43 668  | 0.031831     |
| mod_indic_pres_imps_af                        | 38 302  | 0.027919     |
| aux_neg                                       | 38 019  | 0.027713     |
| mod_sup_ps_ill                                | 30 991  | 0.022590     |
| mod_indic_pres_ps_neg                         | 30 848  | 0.022486     |
| mod_ger                                       | 25 618  | 0.018674     |
| mod_cond_pres_ps_neg                          | 11 785  | 0.008590     |
| aux_imper_pres_ps2_sg_ps_neg                  | 6091   | 0.004440     |
| mod_sup_ps_in                                 | 3305   | 0.002409     |
| mod_indic_pres_ps1_pl_ps_af                   | 3189   | 0.002325     |
| mod_indic_pres_ps1_sg_ps_af                   | 2490   | 0.001815     |
| mod_sup_ps_abes                               | 2470   | 0.001800     |
| mod_cond_pres_ps3_pl_ps_af                    | 2102   | 0.001532     |
| mod_quot_pres_ps_neg                          | 2039   | 0.001486     |
| mod_indic_pres_imps_neg                       | 1679   | 0.001224     |
| aux_indic_impf_ps_neg                         | 1186   | 0.000865     |
| mod_sup_ps_tr                                 | 1032   | 0.000752     |
| mod_indic_pres_ps2_sg_ps_af                   | 949    | 0.000692     |
| mod_indic_impf_ps1_sg_ps_af                   | 761    | 0.000555     |
| mod_sup_ps_el                                 | 750    | 0.000547     |
| mod_cond_pres_imps_neg                        | 510    | 0.000372     |
| mod_imper_pres_ps2_pl_ps_neg                  | 385    | 0.000281     |
| aux_cond_pres_ps_neg                          | 351    | 0.000256     |
| mod_imper_pres_ps3_pl_ps_neg                  | 334    | 0.000243     |
| mod_indic_pres_ps2_pl_ps_af                   | 324    | 0.000236     |
| mod_indic_impf_ps1_pl_ps_af                   | 293    | 0.000214     |
| mod_cond_pres_ps1_pl_ps_af                    | 233    | 0.000170     |
| mod_cond_pres_ps1_sg_ps_af                    | 192    | 0.000140     |
| mod_cond_past_ps_neg                          | 190    | 0.000138     |
| mod_sup_imps                                  | 77     | 0.000056     |
| mod_partic_pres_ps                            | 44     | 0.000032     |
| aux_imper_pres_ps2_pl_ps_neg                  | 43     | 0.000031     |
| mod_quot_pres_imps_neg                        | 42     | 0.000031     |
| mod_partic_pres_imps                          | 40     | 0.000029     |
| mod_imper_pres_ps1_pl_ps_neg                  | 38     | 0.000028     |
| mod_cond_past_imps_neg                        | 32     | 0.000023     |
| mod_indic_impf_ps2_pl_ps_af                   | 27     | 0.000020     |
| aux_quot_pres_ps_neg                          | 27     | 0.000020     |
| mod_cond_pres_ps2_pl_ps_af                    | 16     | 0.000012     |
| mod_imper_pres_imps_neg                       | 15     | 0.000011     |
| aux_imper_pres_ps3_pl_ps_neg                  | 10     | 0.000007     |
| neg_tud                                       | 9      | 0.000007     |
| mod_cond_past_ps3_pl_ps_af                    | 2      | 0.000001     |
| aux_cond_past_ps_neg                          | 2      | 0.000001     |
| mod_cond_past_ps1_sg_ps_af                    | 2      | 0.000001     |
| mod_cond_past_ps1_pl_ps_af                    | 1      | 0.000001     |
| mod_quot_past_imps_neg                        | 1      | 0.000001     |
| aux_imper_pres_ps1_pl_ps_neg                  | 1      | 0.000001     |
| neg_me                                       | 1      | 0.000001     |

The .txt file can be downloaded [here](https://github.com/ahtokiil/ids_2023/blob/main/wiki_corpus_summary.txt).
