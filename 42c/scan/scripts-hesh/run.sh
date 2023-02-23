#! /bin/sh

#create scan v2 config
python3 ./update-config.py -p https://demolabs.42crunch.cloud -n vampi -f ../scanconf_vampiv3.json "api_853ebd01-7598-4ad2-9e3c-74e8a4f33304" "485b3af6-b5b7-448f-affb-df3915c6c703"

#run scan v2
docker run --network="host" -e SCAN_TOKEN=scan_cfc54641-c185-45ce-98a3-b3ac473f3fed -e PLATFORM_SERVICE=services.demolabs.42crunch.cloud:8001 42crunch/scand-agent:v2.0.0-rc02
