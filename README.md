# Zeus
 Zeus is the god of the sky, lightning, and the thunder in Ancient Greek religion and legends, and ruler of all the gods on Mount Olympus. Well.... infrastructure in the cloud! 

 This repo controls everything in the next generation of MakerBot's Cloud Infrastructure. This is a sinlge place to rule them all. The vision is anything in the cloud 
 will be control via Terraform and this code base. 


 ## Current Design
 Sticking with the Beyond Corp model of Zero Trust, We are using a Management Project for controlling all subnets and control planes between projects. This uses
 terragrunt to try to keep the code base DRY. Every environment needs to have the Following, Folder, project, project-stack and env.yaml. Folder is how google perfers that things are organized, project creates a project and project stack setups up the projects networking and base apis. env.yaml contains information about the project. 


## IAM Permissions
We do not assign permissions to a user but to the group. leveraging GSuite groups we control who has access to what. This prevents drifting in the state from happening. 



 ### References
 https://cloud.google.com/beyondcorp
 https://cloud.google.com/vpc/docs/shared-vpc


## Network Layouts per project


