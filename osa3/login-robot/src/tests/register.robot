*** Settings ***
Resource  resource.robot
Test Setup  Create User And Input New Command

*** Test Cases ***
Register With Valid Username And Password
    Input Credentials  jorma  salainensana123
    Output Should Contain  New user registered

Register With Already Taken Username And Valid Password
    Input Credentials  kalle  salainensana123
    Output Should Contain  Username already taken    

Register With Too Short Username And Valid Password
    Input Credentials  aa  salainensana123
    Output Should Contain  Username is too short

Register With Enough Long But Invalid Username And Valid Password
    Input Credentials  jorma!  salainensana123
    Output Should Contain  Username must only contain letters a-z

Register With Valid Username And Too Short Password
    Input Credentials  jaska  aa
    Output Should Contain  Password is too short

Register With Valid Username And Long Enough Password Containing Only Letters
    Input Credentials  einari  salainen
    Output Should Contain  Password must contain non letter characters

*** Keywords ***
Create User And Input New Command
    Create User  kalle  kalle123
    Input New Command