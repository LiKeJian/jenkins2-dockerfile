#!/usr/bin/python3
# -*- coding: UTF-8 -*-#/bin/bash

import os
import sys
import subprocess
import operator

def print_directory_description():
    print('''
    *************************
    ***git merge branch***
    *************************

    The root directory is the directory where the file is located.The project structure must be the following:
    ../build/spring-build-parent

    ../component/component-config-server
    ../component/component-eureka-server
    ../component/component-management-gateway

    ../service/service-file
    ../service/service-message
    ../service/service-pbms
    ../service/service-ulms

    ../service-common/service-common-api
    ../service-common/service-common-base
    ../service-common/service-common-model
    ../service-common/service-common-util
    ''')

def print_separate():
    print('\n-------------------------\n')

project_test_branch = {'component/component-config-server': '2.0', 
                        'component/component-eureka-server': '2.0', 
                        'component/component-management-gateway': '1.0', 
                        'service/service-file': '1.0', 
                        'service/service-message': '1.0', 
                        'service/service-pbms': '1.0', 
                        'service/service-ulms': '1.0', 
                        'service-common/service-common-api': 'dev', 
                        'service-common/service-common-base': 'dev', 
                        'service-common/service-common-model': 'dev', 
                        'service-common/service-common-util': 'dev', 
                        'build/spring-build-parent': 'dev'}

def print_project_branch():
    print('the name of project branch in test environment:')
    for item in project_test_branch.items():
        print(item)

dev_branch = 'dev'
master_branch = 'master'
person_branch = 'mayuhan'
test_branch = 'release/'

branch_type = {'P': person_branch, 'D': dev_branch, 'R': test_branch, 'M': master_branch}

checkout = 'checkout'
merge = 'merge'

operation_type = {'C': checkout, 'M': merge}

def exit(msg=None):
    '''exit the Process, print message'''
    try:
        sys.exit(0)
    except:
        if msg:
            print(msg)
        else:
            print('python process end...')

def git_operation(operation, branch, directory):
    '''exec git commands according to operation and branch'''
    print('start', operation, directory, '...')
    '''current python script directory'''
    current_script_directory = os.path.split(os.path.realpath(__file__))[0]
    os.chdir(current_script_directory)
    os.chdir('../' + directory)
    if operator.eq(operation, checkout):
        command = 'git checkout ' + branch
    elif operator.eq(operation, merge):
        command = 'git -c core.quotepath=false -c log.showSignature=false merge ' + branch
    subprocess.call(command, shell=True)
    print('finish', operation, directory, '\n')


if __name__ == "__main__":
    print_directory_description()
    print_separate()
    print_project_branch()
    print_separate()

    input_operation = input('Enter operation [C/M]: C:checkout, M:merge. Ignore case. End with a carriage return.\n')

    try:
        operation = operation_type[input_operation.upper()]
    except:
        exit('input operation type is empty...')

    input_type = input('Enter environment [P/D/R/M]: P:yourself, D:dev, R:release/*, M:master. Ignore case. End with a carriage return.\n')

    try:
        branch = branch_type[input_type.upper()]
    except:
        exit('input environment type is empty...')

    for directory in project_test_branch.keys():
        git_operation(operation, branch, directory)

    end = input('Press entry key to exit . . .')

    print('Bye ~')
