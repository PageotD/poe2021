 param (
        [Parameter(Mandatory=$true)]
        [int]$chiffre1,

        [Parameter(Mandatory=$true)]
        [int]$chiffre2,
        
        [Parameter(Mandatory=$true,
        ParameterSetName="Action")]
        [ValidateSet("Addition", "multiplication")]
        [string]$Action
        
    )

switch ($action) {
    "addition" {
        $res = $chiffre1 + $chiffre2
    }
    "Multiplication" {
        $res = $chiffre1 * $chiffre2
    }
}

return $res