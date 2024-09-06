# pip3 install pandas openpyxl
# https://medium.com/womenintechnology/different-ways-to-compare-two-columns-from-two-different-files-using-pandas-be7ff315ab17

#!/usr/bin/python3

"""
The script prints the records of employee names whose 
details are not available in the device sheet.

The script compares the Employee sheet and the Device sheet
to find the missing device record details for the employees

The 'id' is used colume as a filter to find the missing 
device details for the employees from the Employee sheet 

pip packge installation is needed to run the script
    pip3 install pandas openpyxl
"""
import pandas as pd
import os

def parse_inventory():

    file_name = 'table_data.xlsx'

    if not os.path.exists(file_name):
        print(f"{file_name} file doesn't not exit on the current path")
        return
    
    employee_sheet = pd.read_excel(file_name,'Employees')
    devices_sheet  = pd.read_excel(file_name,'Devices')
   
    emp_missing_device = employee_sheet[~employee_sheet['id'].isin(devices_sheet['id'])]
    #emp_missing_device = employee_sheet['id'].isin(devices_sheet['id'])

    if not emp_missing_device.empty:
        print("Device record missing for emloyee")
        print(emp_missing_device)
    else:
        print("Device record available for all employees")

if __name__ == "__main__":
    parse_inventory()        
