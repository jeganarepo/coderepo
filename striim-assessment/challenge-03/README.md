Challenge-03

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
