<h1>PortInfo</h1>
- A simple tool to get info about which process is occupying what port, and to free up that port.

<br>
<img src="./docs/image.png">
<br>

<h3>How to install/use</h3>

- Download the script from github releases
- Extract it to somewhere
- Run "chmod +x portinfo.sh"
- Optionally install it with "./portinfo.sh --install"
- Done! Now see "./portinfo.sh --help"

- To uninstall, do "portinfo --uninstall"

  Installing is optional, as it just makes it accessible more easily. You can just use fully it as ./porinfo.sh.

<br>

Examples for usage: <br>
portinfo 8080          - Gets info about process occupying the port 8080
<img width="620" height="120" alt="image" src="https://github.com/user-attachments/assets/ace7254d-78e0-4dfb-bfb4-dc557c7ae738" />

portinfo 8080 --kill   - Kills process occupying the port 8080. If it fails, it will ask you if you want to kill it forcefully.
<img width="777" height="61" alt="image" src="https://github.com/user-attachments/assets/035c6cc4-d191-4b27-8ca4-01fa40c9d9dc" />
