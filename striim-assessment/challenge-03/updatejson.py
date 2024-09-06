#!/usr/bin/python3
"""
Script run:
  python3 updatejson.py --env PROD --json ./config.json --csv ./input.csv

The script takes the input as --env DEV --json ./config.json --csv ./input.csv.

It reads the config.json file and stores the data into 'json_data' variable
then reads the input.csv file using csv.DictReader and s
tores the data into the 'csv_data' variable as a dictionary.

It iterates through the data in the 'csv_data' variable and 
retrieves the data for the specified "ENV" from the 'csv_data' variable
based on the 'env' argument.

It checks if the "env" argument name is present in the 'json_data'. 
If present it updates the 'json_data' with the values iterated from 
the 'csv_data' variable. 
Finally it writes the 'json_file' with the updated values from the 'json_data'.

If the "env" argument value is not matcch with 'csv_env' value 
the script exits and does not update the json_file
"""
import os
import json
import csv
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
                

    with  open(json_file, 'w') as j:
        json.dump(json_data, j, indent=4)


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Update Json block based on environment value from CSV file")
    parser.add_argument("--env", required=True, help="Environment (e.g., prod/dev)")
    parser.add_argument("--json", required=True, help="JSON file name")
    parser.add_argument("--csv", required=True, help="CSV file name")

    args = parser.parse_args()
     
    update_json_file(args.env, args.json, args.csv)


ENV,host,port,dbname,user,password
PROD,192.168.0.1,222,rpoot,admin,newpassword123
