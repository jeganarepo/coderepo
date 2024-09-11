#!/usr/bin/python3

import os
import json
import pandas as pd
import argparse

def update_json_file(env, json_file, csv_file):
    """
    :env       - Environment name(prod/dev)
    :json_file - JSON file name
    :csv_file  - CSV file name
    """

    if not os.path.exists(json_file) or not os.path.exists(csv_file):
        print(f"csv_file/json_file doesn't not exit on the current path")
        return
    
    with open(json_file, 'r') as j:
        json_data = json.load(j)

    csv_data_read = pd.read_csv(csv_file)
    csv_data      = csv_data_read.to_dict(orient='records')


    for row in csv_data:
        csv_env = row['ENV']
        if csv_env == env:
            if csv_env in json_data:
                json_data[csv_env]['host']     = row['host']
                json_data[csv_env]['port']     = row['port']
                json_data[csv_env]['dbname']   = row['dbname']
                json_data[csv_env]['user']     = row['user']
                json_data[csv_env]['password'] = row['password']

                print(f"{csv_env} updated in the {json_file}") 
        else:
            print(f"'{csv_env}' not found in the json_file")

    """
    with open(csv_file, newline='') as csvfile:
        csv_data = csv.DictReader(csvfile)
        for row in csv_data:
            csv_env = row['ENV']
            if csv_env == env:  
                if csv_env in json_data:
                    json_data[csv_env]['host']     = row['host']
                    json_data[csv_env]['port']     = row['port']
                    json_data[csv_env]['dbname']   = row['dbname']
                    json_data[csv_env]['user']     = row['user']
                    json_data[csv_env]['password'] = row['password']
                    print(f"{csv_env} updated in the {json_file}") 
            else:
                print(f"'{env}' not found in the json_file")
    """
         
                

    with  open(json_file, 'w') as j:
        json.dump(json_data, j, indent=4)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Update Json block based on environment value from CSV file")
    parser.add_argument("--env", required=True, help="Environment (e.g., prod/dev)")
    parser.add_argument("--json", required=True, help="JSON file name")
    parser.add_argument("--csv", required=True, help="CSV file name")

    args = parser.parse_args()
     
    update_json_file(args.env, args.json, args.csv)
