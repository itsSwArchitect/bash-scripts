# Bash Scripts Collection

This repository contains a growing collection of Bash scripts designed to automate common tasks for DevOps, system administration, and software development workflows.

Each script or script group is stored in its own folder, with detailed instructions and usage examples provided in the respective `README.md` files.

---

## 📂 Available Scripts

### [docker-installer](./docker-installer/README.md)
Install Docker and Docker Compose on supported Linux distributions.  
Useful for setting up container environments quickly.

➡️ See: [docker-installer/README.md](./docker-installer/README.md)

---

## 📁 Repository Structure

```
bash-scripts/
│
├── docker-installer/        # Scripts to install Docker and Docker Compose
│   └── README.md            # Instructions for Docker installer
│
└── README.md                # Main overview of the repository
```

---

## How to Use

1. **Clone the repository:**
   ```bash
   git clone https://github.com/itsSwArchitect/bash-scripts.git
   cd bash-scripts
   ```

2. **Navigate to the desired script folder:**
   ```bash
   cd docker-installer
   ```

3. **Follow the instructions in the folder's `README.md`.**

4. **Make scripts executable and run:**
   ```bash
   chmod +x install-docker.sh
   ./install-docker.sh
   ```

---

## ➕ Adding New Scripts

To contribute or expand this repo:

1. Create a new folder under the root (e.g., `nginx-setup`).
2. Add your Bash script(s) inside.
3. Write a `README.md` inside that folder with:
   - Purpose
   - OS support (if needed)
   - Usage examples
4. Update this root `README.md` to link to the new folder.

---

## License

This repository is open-sourced under the [MIT License](LICENSE).  
Feel free to use and modify the scripts in your own projects.

---

## 🙋‍♂️ Author

**Abid Ali** — [@itsSwArchitect](https://github.com/itsSwArchitect)  
DevOps Engineer | Bash Automation Enthusiast
