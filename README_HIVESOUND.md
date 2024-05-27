# HIVESOUND README

Contains instruction for the specific HIVESOUND build

## Todos

* Add an envrionment file to pass config values 
* Explain how to add the app code
* A list of all required credentials

## Stuff to configure


* Copy or symlink the current hivesound-gateway code to 'stage4/00-install-gateway-app/app/'
* Set credentials in 'stage5/00-apply-config/config/config.alloy
* If you like to have remote logging -> set credentials in 'stage5/00-apply-config/config/logging.yml'
* For mqtt:
** Set correct clientid (aws credentials id) in 'stage5/00-apply-config/config/config.yml'
** Add correct aws credentials, by adding cert files:
*** stage5/00-apply-config/config/hivesound/aws/client-certificate.pem
*** stage5/00-apply-config/config/hivesound/aws/client-private.key
* For ngrok pass the ngrok auth-token as env variable in:
** hivesound_build_all.sh
** hivesound_rebuild_app_and_configs_stage.sh
** hivesound_rebuild_last_stage.sh
