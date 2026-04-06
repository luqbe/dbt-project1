# dbt-project1

A comprehensive dbt (data build tool) project with **Databricks integration** and structured data transformation workflows.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Development Workflow](#development-workflow)
- [Contributing](#contributing)

## Overview

This dbt project implements a three-layer medallion architecture on **Databricks**:
- **Bronze Layer**: Raw, unmodified data from source systems
- **Silver Layer**: Cleaned, deduplicated intermediate data
- **Gold Layer**: Business-ready analytics and reporting tables

### 🎯 Key Features

- **Databricks Integration** - Native dbt-databricks adapter  
- **Structured Data Layers** - Bronze, Silver, Gold architecture  
- **Documentation Support** - dbt docs generation  

## Project Structure
dbt-project1/
├── .databricks/
│ ├── jobs-pr-validation.yml
│ ├── jobs-deploy.yml
│ └── scripts/
│ ├── dbt-run.py
│ ├── dbt-parse.py
│ ├── yaml-validation.py
│ ├── dbt-docs.py
│ └── slack-notify.py
├── models/
│ ├── bronze/
│ ├── silver/
│ └── gold/
├── macros/
├── tests/
├── seeds/
├── snapshots/
├── analyses/
├── dbt_project.yml
├── profiles.yml
├── requirements.txt
└── README.md


```markdown
# dbt-project1

A comprehensive dbt (data build tool) project with **Databricks integration** and structured data transformation workflows.

## 📋 Table of Contents

- [Overview](#overview)
- [Project Structure](#project-structure)
- [Setup Instructions](#setup-instructions)
- [Development Workflow](#development-workflow)
- [Contributing](#contributing)

## Overview

This dbt project implements a three-layer medallion architecture on **Databricks**:
- **Bronze Layer**: Raw, unmodified data from source systems
- **Silver Layer**: Cleaned, deduplicated intermediate data
- **Gold Layer**: Business-ready analytics and reporting tables

### 🎯 Key Features

- **Databricks Integration** - Native dbt-databricks adapter  
- **Structured Data Layers** - Bronze, Silver, Gold architecture  
- **Documentation Support** - dbt docs generation  

## Project Structure

```
dbt-project1/
├── models/
│   ├── bronze/                 # Raw staging tables
│   ├── silver/                 # Transformed intermediate tables
│   └── gold/                   # Final analytics tables
├── macros/                     # Custom dbt macros
├── tests/                      # Data quality tests
├── seeds/                      # Static reference data (CSV)
├── snapshots/                  # Slowly changing dimensions
├── analyses/                   # Ad-hoc analyses
├── dbt_project.yml            # dbt configuration
├── profiles.yml               # Databricks connection (uses env vars)
├── requirements.txt           # Python dependencies
└── README.md                  # This file
```

## Setup Instructions

### Prerequisites

- Databricks workspace (AWS, Azure, or GCP)
- Python 3.8+ (3.10 recommended)
- dbt-databricks installed
- Personal Access Token for Databricks
- Git

### Local Development Setup

1. **Clone the repository**
   ```bash
   git clone <repository-url>
   cd dbt-project1
````

2. **Create Python virtual environment**

   ```bash
   python -m venv venv
   source venv/bin/activate
   ```

3. **Install dependencies**

   ```bash
   pip install -r requirements.txt
   ```

4. **Configure profiles.yml**

   ```yaml
   dbt-project1:
     target: dev
     outputs:
       dev:
         type: databricks
         host: https://adb-12345.cloud.databricks.com
         token: "{{ env_var('DATABRICKS_TOKEN') }}"
         catalog: main
         schema: analytics_dev
         threads: 8
   ```

5. **Set environment variables**

   ```bash
   export DATABRICKS_HOST="https://adb-12345.cloud.databricks.com"
   export DATABRICKS_TOKEN="your-token"
   ```

6. **Verify setup**

   ```bash
   dbt debug
   dbt parse
   ```

## Development Workflow

### Create Branch

```bash
git checkout -b feature/new-model
```

### Run Models

```bash
dbt run
dbt run --select <model_name>
dbt run --select state:modified+
```

### Run Tests

```bash
dbt test
dbt test --select <model_name>
dbt test --fail-fast
```

### Commit Changes

```bash
git add .
git commit -m "feat: add new model"
git push origin feature/new-model
```

## Contributing

### Checklist Before PR

* ✅ `dbt parse`
* ✅ `dbt run`
* ✅ `dbt test`
* ✅ Update documentation
* ✅ No secrets committed

## Troubleshooting

### Connection Issues

```bash
dbt debug
```

## Additional Resources

* Databricks dbt Adapter Docs
* dbt Documentation
* Medallion Architecture

```
```
