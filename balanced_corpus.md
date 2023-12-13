## The Balanced Corpus of Estonian

1. Content

The [Balanced Corpus of Estonian](https://www.cl.ut.ee/korpused/grammatikakorpus/index.php?lang=en) is compiled in order to enable the comparison of the three main text classes of the written language: fiction, journalistic and scientific writing.

The corpus consists of journalistic texts, works of fiction and science texts. The Balanced Corpus of Estonian is a subpart or a subcorpus of the big Mixed Corpus of Estonian.

2. Processing

2.1 Tags, interpunctuation, numericals etc. were removed.

```python
# Clean balanced corpus of tags, interpunctuation, numericals etc.

# Lines in corpus
counter1 = 0
# Lines written
counter2 = 0

with open('nc19_Balanced_Corpus.vert', 'r', encoding='utf-8') as file_in:
    with open('clean_balanced_corpus.txt', 'w', encoding='utf-8') as file_out:
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

with open('clean_balanced_corpus.txt', 'r', encoding='utf-8') as file:
    for line in file:
        tokens = line.strip().split('\t')
        if len(tokens) > 2:
            if tokens[1][:2] == 'V.':
                tag = tokens[8]
                tag_counts[tag] = tag_counts.get(tag, 0) + 1

total_count = sum(tag_counts.values())

sorted_counts = sorted(tag_counts.items(), key=lambda x: x[1], reverse=True)

with open('balanced_corpus_summary.txt', 'w', encoding='utf-8') as output_file:
    for tag, count in sorted_counts:
        relative_frequency = count / total_count
        output_file.write(f"{tag:50}\t{count:6}\t{relative_frequency:.6f}\n")

print(f"Total verb count: {total_count}\n")
```

3. Verbs

From 9 377 947 words in the corpus there are 1 864 620 verbs (weight = 0.198830).

The verbforms are represented as follows:

| *Form tag* | *Count* | *Weight* |
| --- | ---: | --- |
| mod_indic_pres_ps3_sg_ps_af                   | 456 384 | 0.244695     |
| mod_indic_impf_ps3_sg_ps_af                   | 294 869 | 0.158097     |
| mod_inf                                       | 199 067 | 0.106732     |
| mod_indic_impf_ps_neg                         | 136 020 | 0.072928     |
| aux_neg                                       | 109 796 | 0.058868     |
| mod_indic_pres_ps_neg                         | 80 645  | 0.043239     |
| mod_indic_pres_ps3_pl_ps_af                   | 68 299  | 0.036619     |
| mod_sup_ps_ill                                | 67 346  | 0.036108     |
| mod_indic_impf_ps3_pl_ps_af                   | 61 462  | 0.032953     |
| mod_indic_impf_imps_neg                       | 46 795  | 0.025090     |
| mod_cond_pres_ps_neg                          | 43 072  | 0.023093     |
| mod_indic_impf_imps_af                        | 35 574  | 0.019073     |
| mod_indic_pres_imps_af                        | 35 522  | 0.019045     |
| mod_ger                                       | 35 393  | 0.018976     |
| mod_indic_impf_ps1_sg_ps_af                   | 33 523  | 0.017974     |
| mod_indic_pres_ps1_sg_ps_af                   | 33 324  | 0.017867     |
| aux_imper_pres_ps2_sg_ps_neg                  | 25 382  | 0.013609     |
| mod_indic_pres_ps1_pl_ps_af                   | 16 805  | 0.009010     |
| mod_indic_pres_ps2_sg_ps_af                   | 14 666  | 0.007863     |
| mod_indic_impf_ps1_pl_ps_af                   | 8192   | 0.004392     |
| mod_sup_ps_in                                 | 7934   | 0.004254     |
| aux_indic_impf_ps_neg                         | 7610   | 0.004080     |
| mod_cond_pres_ps3_pl_ps_af                    | 6294   | 0.003375     |
| mod_sup_ps_abes                               | 5735   | 0.003075     |
| mod_quot_pres_ps_neg                          | 5292   | 0.002837     |
| mod_indic_pres_ps2_pl_ps_af                   | 4896   | 0.002625     |
| mod_imper_pres_ps2_pl_ps_neg                  | 3906   | 0.002094     |
| mod_cond_pres_ps1_sg_ps_af                    | 3278   | 0.001758     |
| mod_indic_pres_imps_neg                       | 3164   | 0.001696     |
| mod_imper_pres_ps3_pl_ps_neg                  | 2612   | 0.001400     |
| aux_cond_pres_ps_neg                          | 2190   | 0.001174     |
| mod_cond_past_ps_neg                          | 1919   | 0.001029     |
| mod_cond_pres_imps_neg                        | 1255   | 0.000673     |
| mod_sup_ps_el                                 | 1134   | 0.000608     |
| mod_sup_ps_tr                                 | 1092   | 0.000585     |
| mod_cond_pres_ps1_pl_ps_af                    | 996    | 0.000534     |
| mod_indic_impf_ps2_pl_ps_af                   | 983    | 0.000527     |
| mod_imper_pres_ps1_pl_ps_neg                  | 691    | 0.000370     |
| aux_imper_pres_ps2_pl_ps_neg                  | 370    | 0.000198     |
| mod_cond_pres_ps2_pl_ps_af                    | 351    | 0.000188     |
| aux_quot_pres_ps_neg                          | 280    | 0.000150     |
| mod_sup_imps                                  | 167    | 0.000090     |
| mod_imper_pres_imps_neg                       | 158    | 0.000085     |
| aux_imper_pres_ps3_pl_ps_neg                  | 114    | 0.000061     |
| mod_quot_pres_imps_neg                        | 105    | 0.000056     |
| mod_cond_past_ps3_pl_ps_af                    | 67     | 0.000036     |
| mod_partic_pres_imps                          | 64     | 0.000034     |
| mod_cond_past_imps_neg                        | 57     | 0.000031     |
| mod_cond_past_ps1_sg_ps_af                    | 50     | 0.000027     |
| aux_cond_past_ps_neg                          | 45     | 0.000024     |
| aux_imper_pres_ps1_pl_ps_neg                  | 44     | 0.000024     |
| neg_me                                        | 44     | 0.000024     |
| mod_partic_pres_ps                            | 38     | 0.000020     |
| mod_cond_past_ps1_pl_ps_af                    | 26     | 0.000014     |
| neg_tud                                       | 12     | 0.000006     |
| mod_quot_past_imps_neg                        | 3      | 0.000002     |
| mod_quot_past_ps_neg                          | 3      | 0.000002     |
| mod_cond_past_ps2_pl_ps_af                    | 1      | 0.000001     |
| neg_da                                        | 1      | 0.000001     |

The .txt file can be downloaded [here](https://github.com/ahtokiil/ids_2023/blob/main/balanced_corpus_summary.txt).
