# Create-ADUserCSV

A Powershell script to create multiple AD users with a csv file.

=====================================================================================
#### Notes:

Users will be added to the default Users OU.

Can only be run in Powershell 5.1 because of the defunct password generator command.

#### CSV file format:

first,last,dept,jobtitle,email

#### Example Usage:

import-module <script filepath>

CreateADUserCSV -csvpath <csv file path>

=====================================================================================
