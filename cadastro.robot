*** Settings ***

Resource    ${EXECDIR}/resources/base.resource

Test Setup    Start session
Test Teardown    Finish session

*** Test Cases ***
Cadastro de Dog Walkers com Sucesso
    [Tags]             happy_pat
    [Documentation]    Cadastro de Dog Walkers com sucesso

    Fill signup form   Alex Bomtempo    alexbomtempo@teste.com    12345678901    12345-678    123    Apt 101
    Submit Form
    Popup have text    Recebemos o seu cadastro e em breve retornaremos o contato.

CPF Incorreto
    [Tags]    cpf_inv
    [Documentation]    Teste de CPF incorreto

    Fill signup form   Alex Bomtempo    alexbomtempo@teste.com    12345678901a    12345-678    123    Apt 101
    Submit Form
    Alert have text    CPF inválido

Email Incorreto
    [Tags]    email_inv
    [Documentation]    Teste de E-mail incorreto

    Fill signup form   Alex Bomtempo    alexbomtempoteste.com    12345678901    12345-678    123    Apt 101
    Submit Form
    Alert have text    Informe um email válido

Campos Obrigatórios
    [Tags]    campos_obrigatorio
    [Documentation]    Teste de Campos Obrigatórios

    Submit Form

    Alert have text    Informe o seu nome completo
    Alert have text    Informe o seu melhor email
    Alert have text    Informe o seu CPF
    Alert have text    Informe o seu CEP
    Alert have text    Informe um número maior que zero
    Alert have text    Adcione um documento com foto (RG ou CHN)