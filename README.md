# Pelican Panel Installer

Automate the installation of Pelican Panel, a powerful game server management platform, on a fresh Ubuntu server.

![Pelican Panel Logo](https://your-logo-url-here.com)

## 🚀 Features

- One-click installation of Pelican Panel and all dependencies
- Automatic NGINX web server configuration
- PHP 8.3 setup with essential extensions
- SQLite database creation
- Initial environment configuration

## 📋 Requirements

- Fresh Ubuntu server (22.04, 24.04) or Debian server (12)
- Root access
- Active internet connection

## 🛠 Usage

1. Download the installer:

   ```bash
   wget https://raw.githubusercontent.com/xNiicki/pelican-installer/main/install.sh
   ```

3. Make it executable:

   ```bash
   chmod +x install.sh
   ```

5. Run the script:

   ```bash
   sudo ./install.sh
   ```

7. Follow the on-screen prompts to complete installation.

## 🔧 What the Script Does

1. Updates system packages
2. Installs dependencies (NGINX, PHP 8.3, etc.)
3. Adds Sury PHP repository
4. Downloads and installs Pelican Panel
5. Configures NGINX
6. Sets up SQLite database
7. Runs initial migrations
8. Configures Pelican environment

## 🌟 Post-installation

Access your new Pelican Panel at http://YOUR_SERVER_IP/installer. Follow the on-screen instructions to finalize setup.

## 🔍 Troubleshooting

If issues arise:

- Verify server meets minimum requirements
- Check NGINX logs:
  ```bash
  sudo tail -f /var/log/nginx/error.log
  
- Inspect PHP-FPM logs:
  ```bash
  sudo tail -f /var/log/php8.3-fpm.log
- Review Pelican Panel permissions:
  ```bash
  ls -l /var/www/pelican

For more assistance, please open an issue in this repository.

## 🔒 Security Considerations

- The script uses HTTP by default. For production, configure SSL/HTTPS.
- Review and adjust file permissions as needed.
- Change default credentials and secure your database post-installation.

## 🤝 Contributing

We welcome contributions! Feel free to submit a Pull Request or open an Issue.

## 📜 License

This project is open-source under the MIT License.

## ⚠️ Disclaimer

This community-maintained installer is not officially associated with Pelican Panel. Use at your own discretion.
