# kasm-warp
Application build to run Warp terminal in KASM.
# Known bugs
Warp has issues when opend in full screen inside Kasm VM. That's why the container was set to leave 5px padding. App window will resize automatically when manipulated.

# Details
Base image: `kasmweb/core-ubuntu-focal:1.15.0`

Features:
- Warp 2024.05.07.08.02.stable
- sshpass
- Nano
- app window auto resize script
  
# Installation:

## Standalone
`sudo docker run --rm -it --shm-size=512m -p 6901:6901 -e VNC_PW=password pinionless/kasm-warp:latest`

The container is now accessible via a browser : https://IP_OF_SERVER:6901

User : kasm_user Password: password

## Kasm Workspaces
- Log in to your Kasm Workspaces administration panel.
- Navigate to the "Workspaces" section.
- Click the "Add Workspace" button.
- Select workspace type: "Container"
- In the "Docker Image" section paste `registry.hub.docker.com/pinionless/kasm-warp:latest`
- In the "Docker Registry" section paste `https://index.docker.io/v1/`
- Configure other workspace settings like name, description, and resource allocation as needed.
- Click "Save" to add the workspace.
### Recomended: Add Persistent Profile Path
`/profiles_folder/{image_id}/{user_id}`

## Get Warp auth link from:
https://app.warp.dev/logged_in/

If you have issues pasting auth link resize the application window (not your browser running kasm, only Warp app inside virtual machine).
