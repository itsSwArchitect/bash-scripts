# Bash Scripts Collection

This repository contains a growing collection of Bash scripts designed to automate common tasks for DevOps, system administration, and software development workflows.

Each script or script group is organized into its own folder. Detailed usage instructions are provided in each folder's `README.md`.

---

## 📂 Available Scripts

### [docker-installer](./docker-installer/README.md)
Install Docker and Docker Compose on supported Linux distributions.

➡️ See: [docker-installer/README.md](./docker-installer/README.md)

### [common-packages](./common-packages/README.md)

➡️ See: [common-packages/README.md](./common-packages/README.md)

### [system-init](./system-init/README.md)

➡️ See: [system-init/README.md](./system-init/README.md)

---

## How to Use

### Method 1: Clone the Repository

```bash
git clone https://github.com/itsSwArchitect/bash-scripts.git
cd bash-scripts
cd folder-name  # Replace with the actual script folder
chmod +x your-script.sh
./your-script.sh
```

### Method 2: Run Directly from GitHub (one-liner)

You can run most scripts directly from GitHub without cloning:

```bash
curl -fsSL https://raw.githubusercontent.com/itsSwArchitect/bash-scripts/main/<folder-name>/<script-name>.sh | bash
```

Replace `<folder-name>` and `<script-name>.sh` with the desired script path.

**Example:**

```bash
curl -fsSL https://raw.githubusercontent.com/itsSwArchitect/bash-scripts/main/docker-installer/install-docker.sh | bash
```

> ⚠️ Use this method only for trusted scripts. Always review code before piping to `bash`.

---

## 📁 Repository Structure

```
bash-scripts/
│
├── docker-installer/        # Docker and Docker Compose installer
│   └── install-docker.sh    # The script
│   └── README.md            # Instructions
│
├── another-script/          # More scripts coming soon
│
└── README.md                # This file
```

---

## ➕ Adding New Scripts

1. Create a new folder under the root (e.g., `nginx-setup/`).
2. Add your Bash script(s) inside.
3. Include a `README.md` in that folder with:
   - Purpose
   - OS support (if needed)
   - Usage instructions
4. Update this root `README.md` under **Available Scripts**.

---

## License

This repository is open-sourced under the [MIT License](LICENSE).  
You are free to use, share, and modify these scripts.

---

## 🙋‍♂️ Author

**Abid Ali** — [@itsSwArchitect](https://github.com/itsSwArchitect)  
Developer | DevOps Engineer | ML Researcher
