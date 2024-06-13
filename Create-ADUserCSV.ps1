#Create a function to call from the command line
function Create-ADUserCSV {
	
	#Require a csv file path when calling the function by creating a parameter
	param([Parameter(Mandatory)][String]$csvpath)

    	#Setup the environment
	Import-module ActiveDirectory

    	#Ingest data from the formatted csv file
    	$csvdata = Import-csv -Path $csvpath

	    #Try-Catch to create an error handling system
	    try{
	
		#Loop through each row of data
		foreach ($user in $csvdata){
		    #Create password
		    $pass = [System.Web.Security.Membership]::GeneratePassword((Get-Random -Minimum 20 -Maximum 32), 3)
		    $securestring = ConvertTo-SecureString -String $pass -AsPlainText -Force
	
		    #Format data from csv to Active Directory properties
		    $username = "$($user.first).$($user.last)"
		    $name = ("$($user.first) $($user.last)").toUpper()
		    $dept = $user.dept.toUpper()
		    $given = $user.first.toUpper()
		    $sur = $user.last.toUpper()
		    $title = $user.jobtitle.toUpper()
		    $email = $user.email.toUpper()
	
	
		    #User account data in a hashtable
		    $ADUserDetails = @{
			Name = $name
			UserPrincipleName = $name
			displayName = $name
			samAccountName = $username
			GivenName = $given
			SurName = $sur
			Department = $dept
			Description = $title
			title = $title
			EmailAddress = $email
			AccountPassword = $securestring
			Enabled = $true
		    }
		    
		}
	
		#Create User
		New-ADUser @ADUserDetails
	    }
	    catch{
		Write-Error -Message $_.Exception.Message
	    }
	
}
