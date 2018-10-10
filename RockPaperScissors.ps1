$playerSelect
$aiSelect
$Global:gamesPlayed = 0
$Global:gamesWon = 0
$Global:gamesLost = 0
$Global:gamesTied = 0
$Global:gameRunning = $true


cls
Write-Host "Welcome to the
Rock, Paper Scissors Game
WIT Operating Systems
Press Enter to continue."

function funcRock
{
$playerSelect = 'Rock'
aiRPS
}

function funcPaper
{
$playerSelect = 'Paper'
aiRPS
}

function funcScissors
{
$playerSelect = 'Scissors'
aiRPS
}

function aiRPS
{
$RNG = Get-Random -minimum 1 -maximum 4
if($RNG -eq 1)
{
$aiSelect = 'Rock'
}
if($RNG -eq 2)
{
$aiSelect = 'Paper'
}
if($RNG -eq 3)
{
$aiSelect = 'Scissors'
}
Write-Host "The AI has selected " $aiSelect
funcRoll
}

function funcRoll
{
if($playerSelect -eq 'Paper')
{
if($aiSelect -eq 'Paper'){
$Global:gamesTied = $Global:gamesTied+1
Write-Host "Draw!!!"}
if($aiSelect -eq 'Scissors'){
$Global:gamesLost = $Global:gamesLost+1
Write-Host "Lost!!!"}
if($aiSelect -eq 'Rock'){
$Global:gamesWon = $Global:gamesWon+1
Write-Host "Winner!!!"}
}

if($playerSelect -eq 'Rock')
{
if($aiSelect -eq 'Paper'){
$Global:gamesLost = $Global:gamesLost+1
Write-Host "Lost!!!"}
if($aiSelect -eq 'Scissors'){
$Global:gamesWon = $Global:gamesWon+1
Write-Host "Winner!!!"}
if($aiSelect -eq 'Rock'){
$Global:gamesTied = $Global:gamesTied+1
Write-Host "Draw!!!"}
}

if($playerSelect -eq 'Scissors')
{
if($aiSelect -eq 'Paper'){
$Global:gamesWon = $Global:gamesWon+1
Write-Host "Winner!!!"}
if($aiSelect -eq 'Scissors'){
$Global:gamesTied = $Global:gamesTied+1
Write-Host "Draw!!!"}
if($aiSelect -eq 'Rock'){
$Global:gamesLost = $Global:gamesLost+1
Write-Host "Lost!!!"}
}
$Global:gamesPlayed = $Global:gamesPlayed +1
}

function funcExit
{

Write-Host "Number of games played: " $Global:gamesPlayed
Write-Host "Number of games won: " $Global:gamesWon
Write-Host "Number of games lost: " $Global:gamesLost
Write-Host "Number of games tied: " $Global:gamesTied
$Global:gameRunning = $false
}

function showMenu {
Write-Host Enter one of the following options:
Write-Host ----------------------------------------------------
Write-Host R for Rock
Write-Host P for Paper
Write-Host S for Scissors
Write-Host Q for Quit
Write-Host ----------------------------------------------------
Write-Host Make a move:
}

do
{
 showMenu
 $input = Read-Host "Please make a selection"
 switch ($input)
 {
   'R' {
'You chose option Rock'
 funcRock
 } 'P' {
'You chose option Paper'
 funcPaper
 } 'S' {
'You chose option Scissors'
 funcScissors
 } 'Q' {
 funcExit
 } default {
'Invalid input'
 }
 }
 pause
 cls
}
until ($Global:gameRunning -eq $false) 