# Introduction to Data Science - fall 2023/24

## Project D8 - Estonian verb forms

### Goals

1. To analyse the Estonian language corpora’s verb forms’ distribution
2. To prove or reject the hypothesis that weight of verbs in different corpora varies below statistical significance.
3. Long-term goal: to study verb distributions inside a lemma in different corpora and detect anomalies – possible change of word classes (recategorization)

### Corpora

Four different corpora of Estonian were used and each process is described in a separate file:

1. Morphologically disambiguated corpus (also morph-corp for short)
2. The [balanced corpus of Estonian](/https://github.com/ahtokiil/ids_2023/blob/main/balanced_corpus.md).
3. The [Wikipedia corpus in Estonian](https://github.com/ahtokiil/ids_2023/blob/main/balanced_corpus.md).
4. The [Estonian fiction](https://github.com/ahtokiil/ids_2023/blob/main/balanced_corpus.md).

In addition, the [Estonian National Corpus of 2021](/https://github.com/ahtokiil/ids_2023/blob/main/nc21_web_2021.md) was analyzed for future lemma distribution purposes.

### Results

[The hypothesis testing](https://github.com/ahtokiil/ids_2023/blob/main/hypothesis_testing.md) showed that the difference of weight of verbs (total_words/verbs) in four corpora is statistically significant. Therefore, future research will be conducted on a lemma level (comparing the same verb distribution in different corpora; also over time).

### Poster presentation

The work is presented in Delta building on the 14th of December, 2023 (14.15-17, 2nd floor). The poster can be downloaded [here](/https://github.com/ahtokiil/ids_2023/blob/main/AKiil_verb_forms_poster_122023.pdf).
