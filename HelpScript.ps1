# Define the compartment ID
$compartmentId = "ocid1.tenancy.oc1..aaaaaaaaghzw42sb2zfbc4kgvuv3vi64dyv2q5bdl5s3rmoqocyvqxz5heeq"

# Get the list of shapes
$shapeList = oci compute shape list --compartment-id $compartmentId --all | ConvertFrom-Json

# Display shape details
Write-Output "Shape Details:"
$shapeList.data | ForEach-Object {
    Write-Output ("Shape Name: " + $_.shape)
    Write-Output ("Memory (in GB): " + $_."memory-in-gbs")
    Write-Output ("OCpus: " + $_.ocpus)
    Write-Output ("-------------------------")
}

# Get the list of images
$imageList = oci compute image list --compartment-id $compartmentId --all | ConvertFrom-Json

# Display image details
Write-Output "Image Details:"
$imageList.data | ForEach-Object {
    Write-Output ("Image ID: " + $_.id)
    Write-Output ("Display Name: " + $_."display-name")
    Write-Output ("Operating System: " + $_."operating-system")
    Write-Output ("Operating System Version: " + $_."operating-system-version")
    Write-Output ("-------------------------")
}
