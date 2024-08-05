# Meteorite Cleaning Project

## Overview

The Meteorite Cleaning Project involves importing and cleaning a dataset of historical meteorite landings into a SQLite database. The dataset, originally provided as a CSV file, contains several data issues that need to be addressed to ensure accuracy and usability for further analysis by NASA engineers.

## Problem Statement

As a data engineer at NASA, your task is to:

1. Import the CSV data into a SQLite database.
2. Clean the data by handling empty values, rounding decimal values, and excluding specific meteorite types.
3. Ensure the data is sorted and indexed appropriately for analysis.

## Solution Approach

To address the problem, the following steps were implemented:

1. **Temporary Table Import**:
   - Imported the CSV data into a temporary SQLite table for initial cleaning.

2. **Data Cleaning**:
   - Converted empty values in the CSV to `NULL` in the database.
   - Rounded decimal values (e.g., mass, latitude, and longitude) to the nearest hundredths place.
   - Excluded meteorites with the `nametype` "Relict."

3. **Data Transformation**:
   - Created a new table, `meteorites`, in `meteorites.db` with cleaned data.
   - Updated meteorite IDs to start at 1, ensuring sequential ordering by year and name.

4. **Data Sorting**:
   - Sorted the data by year and name to provide a logically ordered dataset.

## Files

- `meteorites.csv`: The original CSV file with meteorite landing data.
- `import.sql`: SQL script to import and clean data, transforming it into the `meteorites` table.
- `meteorites.db`: The SQLite database file containing the cleaned and organized meteorite data.

## Usage

To execute the SQL script and create the database, use the following command:

```sh
cat import.sql | sqlite3 meteorites.db
