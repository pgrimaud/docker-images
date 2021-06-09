#!/bin/sh
ls -al
echo $SHOPIFY_PASSWORD
echo $SHOPIFY_STORE_URL
echo $SHOPIFY_THEME_ID
echo $THEME_PATH
theme deploy --password=$SHOPIFY_PASSWORD --store=$SHOPIFY_STORE_URL --themeid=$SHOPIFY_THEME_ID --dir=$THEME_PATH --allow-live $INPUT_ARGS
