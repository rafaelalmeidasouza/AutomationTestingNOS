*** Settings ***
Documentation       Arquivo de Mapeamento

Library             Collections
Library             OperatingSystem
Library             String
Library             JSONLibrary
Library             RequestsLibrary
Library             yaml

Variables           ../data/endpoints.yaml

Resource            ../resources/add_new_user.resource
Resource            ../resources/delete_user.resource
Resource            ../resources/get_user.resource
Resource            ../resources/update_user.resource
Resource            ../resources/requests_actions.resource


*** Variables ***
${URL}      https://gorest.co.in
