if [[ ! -f /usr/local/bin/disable-usb-wake.sh && ! -f /etc/systemd/system/disable-usb-wake.service ]]; then
  echo "Disabling USB wakeup for device XHC0, XHC1, XHC2..."
  # check /proc/acpi/wakeup to validate
  sudo cp disable-usb-wake.sh /usr/local/bin/disable-usb-wake.sh
  sudo chmod +x /usr/local/bin/disable-usb-wake.sh
  sudo cp disable-usb-wakeup.service /etc/systemd/system/disable-usb-wake.service
  sudo systemctl enable disable-usb-wake.service
  sudo systemctl start disable-usb-wake.service
  echo "USB wakeup disabled for device XHC0, XHC1, XHC2."
else
  echo "USB wakeup is already disabled for device XHC0, XHC1, XHC2."
fi
