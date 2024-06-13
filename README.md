# Create-ADUserCSV
A Powershell script to create multiple AD users with a csv file.

=====================================================================================
### AD User Creation Script

#### Notes:

Users will be added to the default Users OU.

Can only be run in Powershell 5.1 because of the defunct password generator command.

#### CSV file format:

first,last,dept,jobtitle,email

#### Example Usage:

import-module <script filepath>

Create-ADUserCSV -csvpath <csv file path>

=====================================================================================
