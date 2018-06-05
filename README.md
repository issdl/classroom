# International Summer School on Deep Learning - Classroom environment
## Introduction
This repository contains a deployable copy of environment that will be available during the International Summer School on Deep Learning. Both speakers and students can use it to reproduce provided environment locally, to test and verify prepared lectures.

## Instruction for Speakers
The purpose of this repository is to provide speakers with configured environment to test their code for classes. Similar deployment will be used and available to all ISSDL attendees. After testing please let us know what additional packages/datasets you require. Also, please send us prepared notebooks/code that you want us to include in the final deployment for participants use.

Please send any requirements and prepared classes codes to Maciej Szankin \<maciej.szankin@intel.com\>.

In the classrooms during ISSDL a JupyterHub instance will be used to provide students with pre-configured environment. JupyterHub is a multi-user service that allows each user to run a seperate session of Jupyter Notebook.

## Getting started
### Installation & Usage
To deploy classroom environment on your own machine we recommend using Docker to seperate installed packages and configuration from the host.

This approach uses a Docker container for deployment. It has less impact on host operating system. Requirements are:
* Host operating system supporting Docker containers. Linux/OS X recommended for using helper scripts (tested on Ubuntu 16.04).
* docker-ce (tested version: 18.03.1\~ce-0~ubuntu). How to install Docker: https://docs.docker.com/install/

Once Docker is installed, the installation procedure is limited to running following commands:
```
sudo mkdir -p /opt/issdl/students/ /opt/issdl/core/ /opt/issdl/data/ /opt/issdl/classes/
```
This will create necessary directories that will be shared between container and host machine. The purpose of directories:
* /opt/issdl/students/ - contains user directories. Each user has his own private space.
* /opt/issdl/data/ - contains datasets that students will use during classes. Please let us know what dataset you will need during the lectures. We will include them in the final classroom deployment. Datasets are not shipped with this container due to the size.
* /opt/issdl/classes/ - contains copies of lectures prepared by speakers. At the startup this directory is copied to each user's private space in order to provide students with base to work on.
```
sudo docker run -p 8000:8000 -v /opt/issdl/students/:/home/:rw -v $(pwd):/opt/issdl/core/:ro -v /opt/issdl/data:/opt/issdl/data:ro -v /opt/issdl/classes:/opt/issdl/classes:ro -tid nand/classroom /root/startup.sh
```
This command will download already provisioned container and run JupyterHub service on port 8000 of your local machine.

In our setup we created ten exemplary accounts: from "training01" to "training10", all with password "test".  Please open the web browser and go to http://localhost:8000 to verify the installation and log in with any of these credentials.

Once logged in, you can test your Jupyter notebooks by adding them using web interface or copying them to the /opt/issdl/classes directory before starting the container. If the contaier is already running, you can also copy the files directly to the home directory of the user that you are currently logged in as (/opt/issdl/students/USERNAME where USERNAME is the name of your user - training01-training10).


## Questions?
If you have any questions related to the content of this repository, please feel free to contact :
* Maciej Szankin \<maciej.szankin@intel.com\>

In case of questions related to the organization of International Summer School on Deep Learning, please contact:
* Alicja Kwasniewska \<alicja.kwasniewska@intel.com\>
* Jacek Ruminski \<jacek.ruminski@pg.edu.pl\>
