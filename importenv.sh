#!/bin/bash
SETTINGSFILE=/DeezSpot_bot/.deez_settings.ini
#LINK=/data/Songs
#if [ ! -f "$SETTINGSFILE" ]; then
#    cp /DeezSpot_bot/.deez_settings.ini /data
#fi
#if [ ! -L "$LINK" ]; then
#    cd /data
#    ln -s /Songs Songs
#fi
#crudini --set "$SETTINGSFILE" login token $DEEZER_ARL_COOCKIE
crudini --set "$SETTINGSFILE" deez_login mail "$DEEZER_MAIL"
crudini --set "$SETTINGSFILE" deez_login pwd "$DEEZER_PASSWORD"
crudini --set "$SETTINGSFILE" spot_login mail "$SPOTIFY_MAIL"
crudini --set "$SETTINGSFILE" spot_login pwd "$SPOTIFY_PASSWORD"
crudini --set "$SETTINGSFILE" pyrogram api_id "$PYROGRAM_ID"
crudini --set "$SETTINGSFILE" pyrogram api_hash "$PYROGRAM_HASH"
crudini --set "$SETTINGSFILE" pyrogram bot_token "$TELEGRAM_BOT_TOKEN"
crudini --set "$SETTINGSFILE" telegram bot_token "$TELEGRAM_BOT_TOKEN"
crudini --set "$SETTINGSFILE" telegram user_errors_channel "$TELEGRAM_USER_ERROR_CHANNEL"
crudini --set "$SETTINGSFILE" telegram bunker_channel "$TELEGRAM_BUNKER_CHANNEL"
crudini --set "$SETTINGSFILE" telegram owl_channel "$TELEGRAM_OWL_CHANNEL"
crudini --set "$SETTINGSFILE" acrcloud key "$ACRCLOUD_KEY"
crudini --set "$SETTINGSFILE" acrcloud secret "$ACRCLOUD_SECRET"
crudini --set "$SETTINGSFILE" acrcloud host "$ACRCLOUD_HOST"
crudini --set "$SETTINGSFILE" formatting output_folder "$OUTPUT_FOLDER"
crudini --set "$SETTINGSFILE" formatting method_save "$METHOD_SAVE"
crudini --set "$SETTINGSFILE" formatting keep_files "$KEEP_FILES"
#sed -i '/	arl = __arl_token,/d' /DeezloaderBIB_bot/configs/set_configs.py
