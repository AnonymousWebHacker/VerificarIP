#Function Ping-Host

##########################
#      Variables         #
##########################

# Header Colors
# Header
$text_color="White"
$back_color="Black"

# Colum Color
$text_color_ok="Green"
$back_color_ok="Black"
$text_color_error="Red"
$back_color_error="Black"


Function Ping-Host
{
    #Parameter Definition
    Param
    (
    [Parameter(position = 0)] $Hosts,
    [Parameter] $ToCsv
    )
        #Funtion to make space so that formatting looks good
        Function Make-Space($l,$Maximum)
        {
        $space =""
        $s = [int]($Maximum - $l) + 1
        1..$s | %{$space+=" "}

        return [String]$space
        }
    #Array Variable to store length of all hostnames
    $LengthArray = @() 
    $Hosts | %{$LengthArray += $_.length}

    #Find Maximum length of hostname to adjust column witdth accordingly
    $Maximum = ($LengthArray | Measure-object -Maximum).maximum
    $Count = $hosts.Count

    #Initializing Array objects 
    $Success = New-Object int[] $Count
    $Failure = New-Object int[] $Count
    $Total = New-Object int[] $Count
    cls
    #Running a never ending loop
    while($true){

    $i = 0 #Index number of the host stored in the array
    $out = "| HOST$(Make-Space 4 $Maximum)| STATUS | SUCCESS  | FAILURE  | ATTEMPTS  |" 
    $Firstline=""
    1..$out.length|%{$firstline+="_"}

    #output the Header Row on the screen
    Write-Host $Firstline 
    Write-host $out -ForegroundColor $text_color -BackgroundColor $back_color

    $Hosts|%{
    $total[$i]++
    If(Test-Connection $_ -Count 1 -Quiet -ErrorAction SilentlyContinue)
    {
    $success[$i]+=1
    #Percent calclated on basis of number of attempts made
    $SuccessPercent = $("{0:N2}" -f (($success[$i]/$total[$i])*100))
    $FailurePercent = $("{0:N2}" -f (($Failure[$i]/$total[$i])*100))

    #Print status UP in GREEN if above condition is met
    Write-Host "| $_$(Make-Space $_.Length $Maximum)| UP$(Make-Space 2 4)  | $SuccessPercent`%$(Make-Space ([string]$SuccessPercent).length 6) | $FailurePercent`%$(Make-Space ([string]$FailurePercent).length 6) | $($Total[$i])$(Make-Space ([string]$Total[$i]).length 9)|" -BackgroundColor $back_color_ok -ForegroundColor $text_color_ok
    }
    else
    {
    $Failure[$i]+=1

    #Percent calclated on basis of number of attempts made
    $SuccessPercent = $("{0:N2}" -f (($success[$i]/$total[$i])*100))
     $FailurePercent = $("{0:N2}" -f (($Failure[$i]/$total[$i])*100))

    #Print status DOWN in RED if above condition is met
    Write-Host "| $_$(Make-Space $_.Length $Maximum)| DOWN$(Make-Space 4 4)  | $SuccessPercent`%$(Make-Space ([string]$SuccessPercent).length 6) | $FailurePercent`%$(Make-Space ([string]$FailurePercent).length 6) | $($Total[$i])$(Make-Space ([string]$Total[$i]).length 9)|" -BackgroundColor $back_back_error -ForegroundColor $text_color_error
    }
    $i++

    }

    #Pause the loop for few seconds so that output 
    #stays on screen for a while and doesn't refreshes

    Start-Sleep -Seconds 4
    cls
    }
}

