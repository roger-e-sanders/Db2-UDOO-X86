#!/bin/bash
#-------------------------------------------------------------------------------------------------#
#  NAME:     pp_python_setup.sh                                                                   #
#                                                                                                 #
#  PURPOSE:  This program is designed to install the Python packages that are needed by "Project  #
#            Pollinator."                                                                         #
#                                                                                                 #
#  USAGE:    Log in as the root user and issue the following command from a Linux terminal        #
#            window:                                                                              #
#                                                                                                 #
#                 ./pp_python_setup.sh                                                            #
#                                                                                                 #
#-------------------------------------------------------------------------------------------------#
#                      DISCLAIMER OF WARRANTIES AND LIMITATION OF LIABILITY                       #
#                                                                                                 #
#  (C) COPYRIGHT International Business Machines Corp. 2017, 2018 All Rights Reserved             #
#  Licensed Materials - Property of IBM                                                           #
#                                                                                                 #
#  US Government Users Restricted Rights - Use, duplication or disclosure restricted by GSA ADP   #
#  Schedule Contract with IBM Corp.                                                               #
#                                                                                                 #
#  The following source code ("Sample") is owned by International Business Machines Corporation   #
#  or one of its subsidiaries ("IBM") and is copyrighted and licensed, not sold. You may use,     #
#  copy, modify, and distribute the Sample in any form without payment to IBM, for the purpose of #
#  assisting you in the creation of a simple database that is designed to store humidity and      #
#  temperature data.                                                                              #
#                                                                                                 #
#  The Sample code is provided to you on an "AS IS" basis, without warranty of any kind. IBM      #
#  HEREBY EXPRESSLY DISCLAIMS ALL WARRANTIES, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT       #
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.    #
#  Some jurisdictions do not allow for the exclusion or limitation of implied warranties, so the  #
#  above limitations or exclusions may not apply to you. IBM shall not be liable for any damages  #
#  you suffer as a result of using, copying, modifying or distributing the Sample, even if IBM    #
#  has been advised of the possibility of such damages.                                           #
#-------------------------------------------------------------------------------------------------#
#  HISTORY: 01JAN2018 - Initial Coding                                   roger.sanders@us.ibm.com #
#-------------------------------------------------------------------------------------------------#

# Define All Global Variables Used
CurrentDir=${CurrentDir:=''}                     # Current Directory
TimeStamp=${TimeStamp:=''}                       # Current Date And Time Value
LogFile=${LogFile:=''}                           # Log File Name

# Clear The Screen
clear

# Get The Current System Date And Time
TimeStamp=$(date '+%m-%d-%Y:%H-%M-%S')

# Create A New Log File In The Current Directory And Write Header Information To It
CurrentDir=$(pwd)
LogFile="${CurrentDir}/pp_python_setup.log"

echo "#------------------------------------------------------------------#"  > ${LogFile} 2>&1
echo "#  NAME:    pp_python_setup.log                                    #" >> ${LogFile} 2>&1
echo "#  CREATED: ${TimeStamp}                                    #" >> ${LogFile} 2>&1
echo "#------------------------------------------------------------------#" >> ${LogFile} 2>&1
echo "" >> ${LogFile} 2>&1

# Upgrade The Entire System
echo "" | tee -a ${LogFile}
echo "Running apt-get upgrade - this may take a few minutes." | tee -a ${LogFile}
echo "" >> ${LogFile}
apt-get -y upgrade >> ${LogFile} 2>&1 
echo "" >> ${LogFile}
echo "" | tee -a ${LogFile}

# Install The Python 3 SETUPTOOLS Package
echo "" | tee -a ${LogFile}
echo "Running apt-get -y install python3-setuptools" | tee -a ${LogFile}
echo "" >> ${LogFile}
apt-get -y install python3-setuptools >> ${LogFile} 2>&1 
echo "" >> ${LogFile}

# Install The Python 3 PIP Package
echo "" | tee -a ${LogFile}
echo "Running apt-get -y install python3-pip" | tee -a ${LogFile}
echo "" >> ${LogFile}
apt-get -y install python3-pip >> ${LogFile} 2>&1 
echo "" >> ${LogFile}
echo "" | tee -a ${LogFile}

# Install The Python 3 DEV Package
echo "Running apt-get -y install python3-dev" | tee -a ${LogFile}
echo "" | tee -a ${LogFile}
apt-get -y install python3-dev >> ${LogFile} 2>&1  
echo "" >> ${LogFile}
echo "" >> ${LogFile}

# Install The Python 3 LXML Package
echo "Running apt-get -y install python3-lxml" | tee -a ${LogFile}
echo "" >> ${LogFile}
apt-get -y install python3-lxml >> ${LogFile} 2>&1 
echo "" >> ${LogFile}
echo "" | tee -a ${LogFile}

# Install The GCC Compiler
echo "Running apt-get -y install gcc" | tee -a ${LogFile}
echo "" >> ${LogFile}
apt-get -y install gcc >> ${LogFile} 2>&1 
echo "" >> ${LogFile}
echo "" | tee -a ${LogFile}

# Install The Newest Versions Of All Linux Packages On The System
echo "Running apt-get update" | tee -a ${LogFile}
echo "" | tee -a ${LogFile}
apt-get update >> ${LogFile} 2>&1 
echo "Done" >> ${LogFile}
echo "" >> ${LogFile}
echo "" | tee -a ${LogFile}

# Change Permissions On The Log File And Indicate The Work Is Complete
chmod 777 ${LogFile}
echo "Finished! Refer to the file \"${LogFile}\" for more information."
