docker-karaf
============

karaf container for deploying camel routes


To run this container these prerequisties must be met
1. Boot2docker is running ( if not, the deploy file will not be there)
2. A camel route must be compiled into a OSGI bundle (Docker container with auto-function for building a route based on integration specs is coming)
			a. for now, just copy the compiled jar included in the repo in to the Samba share. For Samba instructions, see next instruction. 
3. Confirm Sambas share is running: docker ps (this container should appear: svendowideit/samba)
4. On main mac screen click on Go
5. Connect to Server -- cifs://192.168.59.103 
6. Connect as a guest -- select the opt/karaf/deploy mount point
7. Copy jar into the folder
8. start the execute.sh script
