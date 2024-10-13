# 🦅 Pelican Panel Installer

🚀 Automate the installation of Pelican Panel, a powerful game server management platform, on a fresh Ubuntu server.

## ✨ Features

- 🔧 One-click installation of Pelican Panel and all dependencies
- 🌐 Automatic NGINX web server configuration
- 🐘 PHP 8.3 setup with essential extensions
- 🗄️ SQLite database creation
- 🔐 Initial environment configuration
- 🕒 Cron job setup for scheduled tasks
- 📊 Queue service configuration

## 📋 Requirements

- 💻 Fresh Ubuntu server (22.04, 24.04 LTS) or Debian Server (12)
- 🔑 Root access
- 🌍 Active internet connection

## 🛠 Usage

1. Download the installer:

   ```bash
   wget https://raw.githubusercontent.com/xNiicki/pelican-installer/refs/heads/main/panel.sh
   ```

2. Make it executable:

   ```bash
   chmod +x panel.sh
   ```

3. Run the script:

   ```bash
   sudo ./panel.sh
   ```

4. 🧭 Follow the on-screen prompts to complete installation.

## 🔍 What the Script Does

1. 🔄 Updates system packages
2. 📦 Installs dependencies (NGINX, PHP 8.3, etc.)
3. 🔑 Adds Sury PHP repository
4. 📥 Downloads and installs Pelican Panel
5. ⚙️ Configures NGINX
6. 🗃️ Sets up SQLite database
7. 🔨 Runs initial migrations
8. 🌈 Configures Pelican environment
9. 🕰️ Sets up cron job for scheduled tasks
10. 🚦 Configures queue service


## 🎉 Post-installation

Access your new Pelican Panel at ```http://<your-server-ip>/installer```. Follow the on-screen instructions to finalize setup.


## 🐛 Troubleshooting

If issues arise:

- 🔍 Verify server meets minimum requirements

- 📜 Check NGINX logs:
  ```bash
  sudo tail -f /var/log/nginx/error.log
  
- 🔬 Inspect PHP-FPM logs
  ```bash
  sudo tail -f /var/log/php8.3-fpm.log
- 👀 Review Pelican Panel permissions:
  ```bash
  ls -l /var/www/pelican

For more assistance, please open an issue in this repository.

## 🔒 Security Considerations

- 🔐 The script uses HTTP by default. For production, configure SSL/HTTPS.
- 👮 Review and adjust file permissions as needed.
- 🔑 Change default credentials and secure your database post-installation.

## 🤝 Contributing

We welcome contributions! Feel free to submit a Pull Request or open an Issue.

## 📜 License

This project is open-source under the MIT License.

## ⚠️ Disclaimer

This community-maintained installer is not officially associated with Pelican Panel. Use at your own discretion.

## 🌟 Star Us!

If you find this installer helpful, please consider giving us a star on GitHub! It helps others discover the project.

[![GitHub stars](https://img.shields.io/github/stars/xNiicki/pelican-installer.svg?style=social&label=Star)](https://github.com/xNiicki/pelican-installer)
