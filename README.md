# OracleCloudInfrastructure

# Get Image ID in Windows PowerShell
$compartmentId = "<your_compartment_id>"

oci compute image list --compartment-id $compartmentId --all | 
    ConvertFrom-Json | 
    Select-Object -ExpandProperty data | 
    Where-Object { 
        $_."operating-system" -eq "Oracle Linux" -and 
        $_."operating-system-version" -eq "8" 
    } | 
    Select-Object -First 1 | 
    Select-Object id, "display-name"

# OCI CLI
oci compute image list --compartment-id ocid1.tenancy.oc1..aaaaaaaah5sadgcgkfkaub3ghdgt6w5nuonrndkdb2dcupyoh3j7cxvy4goa --all


# Get free eligible OCI images
# Define the compartment ID
$compartmentId = "<your-compartment-id>"

# Get the list of images
$imageList = oci compute image list --compartment-id $compartmentId --all | ConvertFrom-Json

oci compute image list --compartment-id $compartmentId --all | 
    ConvertFrom-Json | 
    Select-Object -ExpandProperty data | 
    Where-Object { 
        $_."display-name" -like "*Free*" 
    } | 
    Select-Object -First 1 | 
    Select-Object id, "display-name"
