## The Fiction Corpus of Estonian

1. Content

The [Fiction Corpus of Estonian](https://entu.keeleressursid.ee/api2/file-24768?key=G3qonxL3kavZ1NGJ79jk7eIamFRkoLZBMkHCc8jVgudimdUDeSZC5XKrn6U0wxhj)) has books from three Estonian publishers, both original Estonian authors and translated works.

2. Processing

2.1 Tags, interpunctuation, numericals etc. were removed.

```python
# Clean fiction corpus of tags, interpunctuation, numericals etc.

# Lines in corpus
counter1 = 0
# Lines written
counter2 = 0

with open('nc21_Fiction.vert', 'r', encoding='utf-8') as file_in:
    with open('clean_fiction_corpus.txt', 'w', encoding='utf-8') as file_out:
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

with open('clean_fiction_corpus.txt', 'r', encoding='utf-8') as file:
    for line in file:
        tokens = line.strip().split('\t')
        if len(tokens) > 2:
            if tokens[1][:2] == 'V.':
                tag = tokens[8]
                tag_counts[tag] = tag_counts.get(tag, 0) + 1

total_count = sum(tag_counts.values())

sorted_counts = sorted(tag_counts.items(), key=lambda x: x[1], reverse=True)

with open('fiction_corpus_summary.txt', 'w', encoding='utf-8') as output_file:
    for tag, count in sorted_counts:
        relative_frequency = count / total_count
        output_file.write(f"{tag:50}\t{count:6}\t{relative_frequency:.6f}\n")

print(f"Total verb count: {total_count}\n")
```

3. Verbs

From 16 444 403 words in the corpus there are 3 897 201 verbs (weight = 0.236993).

The verbforms are represented as follows:

| *Form token* | *Count* | *Weight* |
| --- | ---: | --- |
| mod_indic_impf_ps3_sg_ps_af                   | 934 847 | 0.239877     |
| mod_indic_pres_ps3_sg_ps_af                   | 542 677 | 0.139248     |
| mod_inf                                       | 376 307 | 0.096558     |
| mod_indic_impf_ps_neg                         | 310 738 | 0.079734     |
| aux_neg                                       | 221 675 | 0.056881     |
| mod_indic_impf_ps3_pl_ps_af                   | 167 343 | 0.042939     |
| mod_indic_pres_ps_neg                         | 163 059 | 0.041840     |
| mod_sup_ps_ill                                | 153 982 | 0.039511     |
| mod_indic_impf_ps1_sg_ps_af                   | 134 878 | 0.034609     |
| mod_indic_pres_ps1_sg_ps_af                   | 129 709 | 0.033283     |
| mod_cond_pres_ps_neg                          | 87 744  | 0.022515     |
| mod_ger                                       | 86 013  | 0.022070     |
| mod_indic_pres_ps3_pl_ps_af                   | 78 295  | 0.020090     |
| mod_indic_pres_ps2_sg_ps_af                   | 62 593  | 0.016061     |
| mod_indic_impf_imps_neg                       | 61 066  | 0.015669     |
| aux_imper_pres_ps2_sg_ps_neg                  | 49 715  | 0.012757     |
| mod_indic_pres_ps1_pl_ps_af                   | 45 715  | 0.011730     |
| mod_indic_pres_ps2_pl_ps_af                   | 34 886  | 0.008952     |
| mod_indic_impf_imps_af                        | 33 925  | 0.008705     |
| aux_indic_impf_ps_neg                         | 30 085  | 0.007720     |
| mod_indic_impf_ps1_pl_ps_af                   | 24 291  | 0.006233     |
| mod_indic_pres_imps_af                        | 22 818  | 0.005855     |
| mod_imper_pres_ps2_pl_ps_neg                  | 22 103  | 0.005672     |
| mod_sup_ps_in                                 | 18 148  | 0.004657     |
| mod_cond_pres_ps3_pl_ps_af                    | 16 489  | 0.004231     |
| mod_cond_pres_ps1_sg_ps_af                    | 16 396  | 0.004207     |
| mod_quot_pres_ps_neg                          | 11 120  | 0.002853     |
| mod_sup_ps_abes                               | 10 102  | 0.002592     |
| mod_indic_impf_ps2_pl_ps_af                   | 8862   | 0.002274     |
| aux_cond_pres_ps_neg                          | 8424   | 0.002162     |
| mod_imper_pres_ps3_pl_ps_neg                  | 6410   | 0.001645     |
| mod_cond_pres_ps1_pl_ps_af                    | 4572   | 0.001173     |
| mod_cond_pres_ps2_pl_ps_af                    | 3877   | 0.000995     |
| mod_sup_ps_el                                 | 3770   | 0.000967     |
| mod_cond_past_ps_neg                          | 3275   | 0.000840     |
| mod_indic_pres_imps_neg                       | 2891   | 0.000742     |
| aux_imper_pres_ps2_pl_ps_neg                  | 2333   | 0.000599     |
| mod_cond_pres_imps_neg                        | 2236   | 0.000574     |
| mod_sup_ps_tr                                 | 1211   | 0.000311     |
| mod_imper_pres_ps1_pl_ps_neg                  | 1016   | 0.000261     |
| mod_sup_imps                                  | 264    | 0.000068     |
| mod_cond_past_ps3_pl_ps_af                    | 190    | 0.000049     |
| aux_imper_pres_ps3_pl_ps_neg                  | 189    | 0.000048     |
| aux_quot_pres_ps_neg                          | 173    | 0.000044     |
| mod_quot_pres_imps_neg                        | 123    | 0.000032     |
| mod_imper_pres_imps_neg                       | 120    | 0.000031     |
| mod_cond_past_ps1_sg_ps_af                    | 116    | 0.000030     |
| neg_me                                        | 102    | 0.000026     |
| aux_cond_past_ps_neg                          | 94     | 0.000024     |
| aux_imper_pres_ps1_pl_ps_neg                  | 94     | 0.000024     |
| mod_cond_past_imps_neg                        | 51     | 0.000013     |
| mod_quot_past_ps_neg                          | 29     | 0.000007     |
| mod_partic_pres_ps                            | 16     | 0.000004     |
| mod_cond_past_ps1_pl_ps_af                    | 14     | 0.000004     |
| neg_tud                                       | 14     | 0.000004     |
| mod_partic_pres_imps                          | 7      | 0.000002     |
| mod_quot_past_imps_neg                        | 4      | 0.000001     |
| mod_cond_past_ps2_pl_ps_af                    | 4      | 0.000001     |
| neg_da                                        | 1      | 0.000000     |

The .txt file can be downloaded [here](https://github.com/ahtokiil/ids_2023/blob/main/fiction_corpus_summary.txt).
