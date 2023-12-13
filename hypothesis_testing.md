## Hypothesis testing

1. The weight of verbs in morphologically disambiguated corpus was set as H0; difference is statistically significant in all other corpora. Hypothesis was rejected.

```python
import numpy as np
import statsmodels.api as sm

# Data from corpora (verbs, total words)
observed_data = np.array([[96512, 524335],
                          [1865120, 9401274],
                          [3897201, 16444403],
                          [1371876, 8618382]])

# Counts of verbs (obs_1) and total counts (obs_2) for H0
obs_1_h0 = observed_data[0, 0]
obs_2_h0 = observed_data[0, 1]
p_h0 = obs_1_h0 / obs_2_h0

# Set alpha levels to test
alpha_levels = [0.001, 0.01, 0.05, 0.1, 0.2]

# Increase precision for printing
np.set_printoptions(precision=16)

# Compare H0 against H1, H2, and H3 using Z-tests
for alpha in alpha_levels:
    print(f"\nFor alpha = {alpha}:")

    for i in range(1, observed_data.shape[0]):
        obs_1 = observed_data[i, 0]
        obs_2 = observed_data[i, 1]

        # Perform Z-test for proportions
        z_stat, z_p_val = sm.stats.proportions_ztest(
            count=obs_1, nobs=obs_2, value=p_h0, alternative='two-sided')

        # Print results
        print(f"\nComparison of H{i} against H0:")
        print(f"Z-score: {z_stat}")
        print(f"P-value: {z_p_val:.2e}")

        # Compare p-value to current alpha level
        if z_p_val < alpha:
            print("Reject the null hypothesis (H0)")
        else:
            print("Fail to reject the null hypothesis (H0)")
```
