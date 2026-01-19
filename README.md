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

### Maximum Likelihood Estimation and Logistic Regression (Q1)

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

### Cox Proportional Hazards Model and Hazard Ratio (Q2)

This presentation covers survival analysis fundamentals and the Cox proportional hazards model for time-to-event data:

#### 1. Survival Analysis Foundations
- Survival time and censoring indicators (right-censoring, left-censoring, interval-censoring)
- The survival function and its estimation (Kaplan-Meier method)
- The hazard function and its interpretation
- Relationship between survival and hazard functions

#### 2. The Cox Proportional Hazards Model
- Model formulation: h(t|X) = h0(t)exp(B1X1 + ... + BkXk)
- Baseline hazard function and its role
- Proportional hazards assumption and its implications
- Interpretation of regression coefficients in the hazard scale

#### 3. Hazard Ratio: Definition and Interpretation
- Mathematical definition of hazard ratio
- Interpretation in epidemiological contexts
- Confidence interval estimation
- Comparison with risk ratio and odds ratio

#### 4. Estimation in the Cox Model
- Partial likelihood formulation
- Handling of censoring in likelihood construction
- Breslow and Efron approximations for tied events
- Variance estimation (sandwich estimator)

#### 5. Model Diagnostics and Assumptions
- Assessment of proportional hazards (Schoenfeld residuals)
- Log-minus-log plots and stratified analysis
- Functional form assessment (Martingale residuals)
- Influence and outlier detection

#### 6. Applications in Public Health and Clinical Research
- Cohort studies with time-to-event outcomes
- Clinical trials with survival endpoints
- Competing risks and multi-state models
- Extensions: time-dependent covariates, stratified Cox model

### Principal Component Analysis for Dimensionality Reduction (Q3)

This presentation explains PCA methodology for reducing high-dimensional clinical data to interpretable principal components:

#### 1. Introduction to Dimensionality Reduction
- The curse of dimensionality in clinical data
- Motivation for dimensionality reduction
- Feature selection vs. feature extraction
- Overview of PCA as a linear dimensionality reduction technique

#### 2. Mathematical Foundations of PCA
- Data standardization and centering
- Covariance matrix computation
- Eigenvalue decomposition of the covariance matrix
- Singular Value Decomposition (SVD) perspective

#### 3. Principal Components: Definition and Properties
- Linear combinations of original variables
- Orthogonality and uncorrelatedness of components
- Variance maximization property
- Selection of the first k components

#### 4. Step-by-Step PCA Implementation
- Step 1: Data standardization (z-score normalization)
- Step 2: Computing the correlation matrix
- Step 3: Eigenvalue and eigenvector calculation
- Step 4: Ranking components by explained variance
- Step 5: Constructing principal component scores

#### 5. Variance Explained: Calculation and Interpretation
- Computing variance explained by each component
- Cumulative variance explained
- The scree plot and elbow method
- Decision criteria for component selection (e.g., >80% variance)

#### 6. Application: Reducing 15 Clinical Indicators to 4 Components
- Motivation for reducing 15 indicators to 4 components
- Interpretation of each principal component
- Clinical meaningfulness of extracted components
- Validation using cross-validation or holdout samples

#### 7. Interpretation of Principal Components
- Loadings and their meaning
- Identifying variables contributing to each component
- Rotation techniques (Varimax) for enhanced interpretability
- Biplots for simultaneous visualization of scores and loadings

#### 8. Limitations and Considerations
- Linear vs. non-linear dimensionality reduction
- Interpretability challenges (components may lack clinical meaning)
- Sensitivity to scaling and outliers
- Loss of information with dimensionality reduction

### Machine Learning Workflow in a Hospital Setting (Q4)

This presentation provides a comprehensive overview of the end-to-end machine learning workflow for clinical applications:

#### 1. Purpose of Machine Learning in Hospital Settings
- Clinical decision support for risk stratification and early warning
- Diagnostic accuracy enhancement through pattern recognition
- Operational efficiency and resource optimization
- Predictive analytics for population health management

#### 2. Phase 1: Problem Definition and Clinical Question Formulation
- Translating clinical needs to ML objectives
- Defining prediction targets and time horizons
- Stakeholder engagement and clinical champion identification
- Success metrics and performance threshold definition

#### 3. Phase 2: Data Collection and Preprocessing
- EHR data sources and interoperability (HL7 FHIR)
- Administrative claims and clinical registries
- Handling missing data (imputation strategies)
- Temporal heterogeneity and data quality challenges

#### 4. Phase 3: Feature Engineering and Selection
- Domain-specific clinical features (SOFA, NEWS scores)
- Temporal aggregation and trend extraction
- NLP for clinical notes and unstructured data
- Feature selection strategies (filter, wrapper, embedded methods)

#### 5. Phase 4: Model Selection and Training
- Interpretable models (logistic regression, decision trees)
- Complex models (gradient boosting, deep learning)
- Train-validation-test splits and cross-validation
- Handling class imbalance in rare clinical events

#### 6. Phase 5: Model Validation and Performance Evaluation
- Internal, temporal, and external validation
- Discrimination (AUC-ROC) and calibration assessment
- Decision curve analysis for clinical utility
- Subgroup validation for fairness and bias detection

#### 7. Phase 6: Deployment and Clinical Integration
- Shadow mode deployment and pilot implementation
- Integration with EHR workflows and alert systems
- User interface design and clinician experience
- SMART on FHIR applications for interoperability

#### 8. Model Governance, Monitoring, and Updating
- Model registry and version control
- Data drift and concept drift detection
- Scheduled and triggered retraining strategies
- Quality management and regulatory compliance

#### 9. Data Privacy, Ethics, and Regulatory Considerations
- HIPAA and GDPR compliance requirements
- De-identification and data protection
- Algorithmic fairness and bias mitigation
- FDA SaMD classification and validation requirements

#### 10. Clinical Decision Support Examples
- Sepsis early warning systems
- Radiology image triage with computer vision
- Mortality and readmission risk prediction
- Clinical workflow augmentation and human-in-the-loop design

#### 11. Conclusion: Safety, Reliability, and Sustainability
- Maintaining patient safety as the primary objective
- Reliability across populations and clinical settings
- Sustainable operations and organizational learning
- Responsible AI and ethical deployment principles

---

## Files

### Module 1 (Informatics for Health)
- `combined_presentation.tex` - Complete unified presentation
- `presentation_1_ehr_rural_settings.tex` - EHR implementation challenges
- `presentation_2_health_informatics_uhc.tex` - Health informatics for UHC
- `presentation_3_digital_transformation_patient_care.tex` - Digital transformation
- `presentation_4_interoperability_national_his.tex` - Interoperability challenges

### Module 2 (Quantitative & Modeling)
- `presentation_mle_logistic_regression.tex` - MLE and Logistic Regression (Q1)
- `presentation_cox_ph_model.tex` - Cox Proportional Hazards Model (Q2)
- `presentation_pca_dimensionality_reduction.tex` - PCA for Dimensionality Reduction (Q3)
- `presentation_ml_workflow_hospital.tex` - Machine Learning Workflow in Hospital Setting (Q4)

### Compilation Tools
- `compile_presentation.R` - R script with multiple compilation methods
- `compile.bat` - Windows batch file for command-line compilation

---

## Compilation

To compile the presentations, ensure you have a LaTeX distribution installed with the following packages:

```bash
# Required packages (Ubuntu/Debian)
sudo apt-get install texlive-latex-base texlive-fonts-extra texlive-science lmodern

# Compile the presentations
xelatex combined_presentation.tex
xelatex presentation_mle_logistic_regression.tex
xelatex presentation_cox_ph_model.tex
xelatex presentation_pca_dimensionality_reduction.tex
xelatex presentation_ml_workflow_hospital.tex
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
