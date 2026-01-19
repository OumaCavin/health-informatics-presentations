# Health Informatics Presentations

This repository contains comprehensive LaTeX Beamer presentations on contemporary challenges and applications in health informatics and quantitative methods, developed as part of the MSc Public Health Data Science programme (SDS6210 - Informatics for Health).

---

## Module 1: Informatics for Health (Thursday)

### Presentation Overview

The first combined presentation covers four critical domains in health informatics:

#### 1. Electronic Health Records (EHRs) in Rural and Resource-Constrained Settings
- Definition and role of EHRs in health systems
- Infrastructure and connectivity challenges
- Human resources and digital skills gaps
- Financial sustainability considerations
- Data quality, security, and privacy
- Governance, policy, and sociocultural factors
- Systems thinking analysis with causal loop diagrams
- Implementation recommendations

#### 2. Health Informatics and Universal Health Coverage (UHC)
- Definition and dimensions of UHC (service coverage, financial protection, equity)
- Health informatics tools: EHRs, DHIS2, mHealth, telemedicine
- Digital health financing and registries
- Mapping to WHO health system building blocks
- Critical analysis of the digital divide
- Real-world examples from LMICs (Rwanda, Ghana, India)
- Policy recommendations for UHC-oriented digital health

#### 3. Digital Transformation and Patient-Centered Care
- Foundations of patient-centered care using established frameworks
- Donabedian's structure-process-outcome model
- Digital transformation in healthcare
- Key digital tools: EHRs, patient portals, telemedicine, wearables, AI
- Impact analysis on patient engagement, quality, and access
- Ethical, privacy, and data protection concerns
- Algorithmic bias and fairness considerations
- Balancing benefits and risks

#### 4. Interoperability in National Health Information Systems
- Definition and levels of interoperability (foundational, structural, semantic, organizational)
- Challenges: fragmented systems, legacy platforms, standards adoption
- International standards: HL7, FHIR, SNOMED CT, ICD, LOINC
- Governance and policy gaps
- Data quality and privacy issues
- Human capacity limitations
- Implications for care continuity and health system performance
- Recommendations for strengthening interoperability

---

## Module 2: Quantitative & Modeling (Monday)

### Maximum Likelihood Estimation and Logistic Regression

This presentation provides a rigorous treatment of Maximum Likelihood Estimation (MLE) and its application in logistic regression for binary outcome modeling:

#### 1. Maximum Likelihood Estimation: Foundational Concepts
- The problem of statistical estimation
- Definition and principles of MLE
- Examples: Bernoulli and Normal distributions
- Log-likelihood transformation and its benefits
- Properties of MLE estimators (consistency, asymptotic normality, efficiency)

#### 2. Logistic Regression: The Binary Outcome Model
- Limitations of linear regression for binary outcomes
- The logistic (sigmoid) function and its properties
- The logistic regression probability model
- Log-odds formulation (logit transformation)
- Assumptions of logistic regression as a GLM

#### 3. Deriving the Likelihood for Logistic Regression
- Data structure and notation
- Individual observation likelihood
- Constructing the full likelihood function
- Log-likelihood derivation step-by-step
- Score function and score equations
- Hessian matrix and curvature information

#### 4. Numerical Optimization for MLE
- Why numerical methods are required
- Newton-Raphson algorithm with update formula
- Fisher Scoring and IRLS interpretation
- Convergence assessment and potential issues
- Variance estimation from Fisher information
- Wald tests and confidence intervals

#### 5. Interpreting Estimated Coefficients
- Log-odds interpretation
- Odds ratios as exponential transformations
- Continuous predictors and unit changes
- Categorical predictors and reference categories
- Interaction terms and their interpretation

#### 6. Applications in Public Health
- Logistic regression in epidemiological study designs
- Risk factor identification and adjusted estimates
- Clinical risk prediction models (Framingham example)
- Advantages and limitations of MLE-based logistic regression
- Extensions: conditional, penalized, and mixed-effects models

---

## Files

### Module 1 (Informatics for Health)
- `combined_presentation.tex` - Complete unified presentation
- `presentation_1_ehr_rural_settings.tex` - EHR implementation challenges
- `presentation_2_health_informatics_uhc.tex` - Health informatics for UHC
- `presentation_3_digital_transformation_patient_care.tex` - Digital transformation
- `presentation_4_interoperability_national_his.tex` - Interoperability challenges

### Module 2 (Quantitative & Modeling)
- `presentation_mle_logistic_regression.tex` - MLE and Logistic Regression

### Compilation Tools
- `compile_presentation.R` - R script with multiple compilation methods
- `compile.bat` - Windows batch file for command-line compilation

---

## Compilation

To compile the presentations, ensure you have a LaTeX distribution installed with the following packages:

```bash
# Required packages (Ubuntu/Debian)
sudo apt-get install texlive-latex-base texlive-fonts-extra texlive-science lmodern

# Compile the presentation
xelatex combined_presentation.tex
xelatex presentation_mle_logistic_regression.tex
```

For R-based compilation, use the provided `compile_presentation.R` script.

---

## Authors

Group 5 Members:
- Cavin Otieno (SDS6/46982/2024)
- Laura Nabalayo Kundu (SDS6/47543/2024)
- John Andrew (SDS6/47659/2024)

---

## Course Information

- **Course:** SDS6210 - Informatics for Health
- **Programme:** MSc Public Health Data Science
- **Institution:** Department of Public Health

---

## License

This presentation is prepared for academic purposes as part of the MSc programme requirements.

---

## Acknowledgments

Content is based on World Health Organization guidelines, peer-reviewed literature, and established health informatics frameworks appropriate for MSc-level analysis.
