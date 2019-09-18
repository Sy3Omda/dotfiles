#-------cloudant-------#

cloudant(){
read -p 'CLOUDANT_Username: ' username ;
read -p 'CLOUDANT_password: ' password ;
read -p 'CLOUDANT_host    : ' host ;
read -p 'CLOUDANT_db      : ' db ;
curl -sX GET "https://$username:$password@$host/$db" | jq "."
}

#-------Slack-------#

Slack-API-token(){
read -p 'Token: ' Token ;
curl -sX POST "https://slack.com/api/auth.test?token=xoxp-$Token&pretty=1" | jq "."
}

#-------SauceLabs-------#

SauceLabs(){
read -p 'USERNAME: ' USERNAME ;
read -p 'ACCESS_KEY: ' ACCESS_KEY ;
curl -u $USERNAME:$ACCESS_KEY https://saucelabs.com/rest/v1/users/$USERNAME | jq "."
}

#-------facebook-------#

facebook-Access-Token(){
read -p 'ACCESS TOKEN: ' token ;
https://developers.facebook.com/tools/debug/accesstoken/?access_token=$token&version=v3.2  | jq "."
}

#-------github-token-------#

github-token(){
read -p 'UserName: ' user ;
read -p 'API Key: ' apikey ;
curl -s -u "$user:$apikey" https://api.github.com/user | jq "."
}

#-------github-client-------#

github-client-secret(){
read -p 'Client ID: ' id ;
read -p 'Client Secret: ' secret ;
curl -s 'https://api.github.com/users/whatever?client_id=$id&client_secret=$secret' | jq "."
}

#-------google-------#

google-cloud(){
read -p 'API Key: ' apikey ;
curl -s -X POST --header "Authorization: key=$apikey" --header "Content-Type:application/json" 'https://gcm-http.googleapis.com/gcm/send' -d '{"registration_ids":["1"]}' | jq "."
}

#-------twitter-api-------#


twitter-api(){
read -p 'ACCOUNT SID: ' SID ;
read -p 'AUTH TOKEN: ' TOKEN ;
curl -X GET 'https://api.twilio.com/2010-04-01/Accounts.json' -u $SID:$TOKEN | jq "."
}

#-------twitter-bearer-------#

twitter-bearer(){
read -p 'TOKEN: ' TOKEN ;
curl --request GET --url https://api.twitter.com/1.1/account_activity/all/subscriptions/count.json --header 'authorization: Bearer $TOKEN' | jq "."
}

#-------deviant-secret-------#

deviant-art-secret(){
read -p 'Client ID: ' ID ;
read -p 'Client Secret: ' secret ;
curl -s https://www.deviantart.com/oauth2/token -d grant_type=client_credentials -d client_id=$ID -d client_secret=$secret | jq "."
}

#-------deviant-token-------#

deviant-access-token(){
read -p 'Access Token: ' token ;
curl https://www.deviantart.com/api/v1/oauth2/placebo -d access_token=$token | jq "."
}

#-------pendo-------#

pendo-integration-key(){
read -p 'x-pendo-integration-key: ' KEY ;
curl -sX GET https://app.pendo.io/api/v1/feature -H 'content-type: application/json' -H 'x-pendo-integration-key:$KEY' | jq "."
}

#-------sendgrid-------#

sendgrid-api(){
read -p 'SENDGRID TOKEN: ' token ;
curl -sX "GET" "https://api.sendgrid.com/v3/scopes" -H "Authorization: Bearer $token" -H "Content-Type: application/json" | jq "."
}

#-------dropbox-------#

dropbox-api(){
read -p 'TOKEN: ' token ;
curl -sX POST https://api.dropboxapi.com/2/users/get_current_account --header "Authorization: Bearer $token" | jq "."
}

#-------awskeyid-------#

awskeyid(){
read -p 'ID: ' ID ;
read -p 'KEY: ' KEY ;
AWS_ACCESS_KEY_ID=$ID AWS_SECRET_ACCESS_KEY=$KEY aws sts get-caller-identity | jq "."
}

#-------mailgun-------#

mailgun-private-key(){
read -p 'API: ' api ;
read -p 'KEY: ' PRIVATEKEYHERE ;
curl --user '$api:key-$PRIVATEKEYHERE' "https://api.mailgun.net/v3/domains" | jq "."
}

#-------microsoft-------#

microsoft-azure-tenant(){
read -p 'CLIENT_ID: ' CLIENT_ID ;
read -p 'CLIENT_SECRET: ' CLIENT_SECRET ;
read -p 'TENANT_ID: ' TENANT_ID ;
curl -X POST -H "Content-Type: application/x-www-form-urlencoded" -d 'client_id=<$CLIENT_ID>&scope=https%3A%2F%2Fgraph.microsoft.com%2F.default&client_secret=<$CLIENT_SECRET>&grant_type=client_credentials' 'https://login.microsoftonline.com/<$TENANT_ID>/oauth2/v2.0/token' | jq "."
}

#-------heroku-------#

heroku-api-key(){
read -p 'API KEY: ' key ;
curl -X POST https://api.heroku.com/apps -H "Accept: application/vnd.heroku+json; version=3" -H "Authorization: Bearer $key" | jq "."
}

#-------mapbox-------#

mapbox-api-key(){
read -p 'Access Token: ' ACCESS_TOKEN ;
curl "https://api.mapbox.com/geocoding/v5/mapbox.places/Los%20Angeles.json?access_token=$ACCESS_TOKEN" | jq "."
}

#-------salesforce-------#

salesforce-api-key(){
read -p 'Access Token: ' access_token_here ;
curl https://instance_name.salesforce.com/services/data/v20.0/ -H 'Authorization: Bearer $access_token_here' | jq "."
}

#-------zapier-------#

zapier-webhook-token(){
read -p 'Name: ' name ;
read -p 'Streaak: ' streaak ;
read -p 'Webhook URL: ' webhook_url_here ;
curl -H "Accept: application/json" -H "Content-Type: application/json" -X POST -d '{"$name":"$streaak"}' "$webhook_url_here" | jq "."
}

#-------pagerduty-------#

pagerduty-api-token(){
read -p 'Token: ' TOKEN_HERE ;
curl -H "Accept: application/vnd.pagerduty+json;version=2"  -H "Authorization: Token token=$TOKEN_HERE" -X GET  "https://api.pagerduty.com/schedules" | jq "."
}

#-------browserStack-------#

browserStack-access-key(){
read -p 'Username: ' USERNAME ;
read -p 'Acess Key: ' ACCESS_KEY ;
curl -u "$USERNAME:$ACCESS_KEY" https://api.browserstack.com/automate/plan.json | jq "."
}

#-------google-------#

google-maps-api(){
read -p 'API Key: ' apikey ;
curl -s "https://maps.googleapis.com/maps/api/directions/json?origin=Toronto&destination=Montreal&key=$apikey" | jq "."
}

#-------branchio-------#

branchio-key-secret(){
read -p 'KEY: ' KEY_HERE ;
read -p 'SECRET: ' SECRET_HERE ;
curl -s "https://api2.branch.io/v1/app/$KEY_HERE?branch_secret=$SECRET_HERE" | jq "."
}

#-------buildkite-------#

buildkite-access-token(){
read -p 'Token: ' token ;
curl -sH "Authorization: Bearer $token" https://api.buildkite.com/v2/user | jq "."
}

#-------asana-------#

asana-access-token(){
read -p 'ACCESS TOKEN: ' ACCESS_TOKEN ;
curl -H "Authorization: Bearer $ACCESS_TOKEN" https://app.asana.com/api/1.0/users/me | jq "."
}

#-------zendesk-------#

zendesk-access-token(){
read -p 'ACCESS TOKEN: ' ACCESS_TOKEN ;
read -p 'Subdomain: ' subdomain ;
curl -sH "Authorization: Bearer $ACCESS_TOKEN" https://{$subdomain}.zendesk.com/api/v2/tickets.json | jq "."
}

#-------datadog-------#

datadog-api-key(){
read -p 'API Key: ' api_key ;
read -p 'Application key: ' application_key ;
curl -s "https://api.datadoghq.com/api/v1/dashboard?api_key=<$api_key>&application_key=<$application_key>" | jq "."
}

#-------travis-------#

travis-ci-api-token(){
read -p 'TOKEN: ' TOKEN ;
curl -H "Travis-API-Version: 3" -H "Authorization: token <$TOKEN>" https://api.travis-ci.com/user | jq "."
}

#-------wakatime-------#

wakatime-api-key(){
read -p 'API Key: ' api_key ;
curl -s "https://wakatime.com/api/v1/users/current/projects/?api_key=$api_key" | jq "."
}

#-------spotify-------#

spotify-access-token(){
read -p 'ACCESS TOKEN: ' ACCESS_TOKEN ;
curl -sH "Authorization: Bearer <$ACCESS_TOKEN>" https://api.spotify.com/v1/me | jq "."
}

#-------instagram-------#

instagram-access-token(){
read -p 'ACCESS TOKEN: ' ACCESS_TOKEN ;
curl -s https://api.instagram.com/v1/users/self/?access_token=$ACCESS_TOKEN | jq "."
}

#-------gitlab-------#

gitlab-personal-access-token(){
read -p 'ACCESS TOKEN: ' ACCESS_TOKEN ;
curl -s "https://gitlab.example.com/api/v4/projects?private_token=<$ACCESS_TOKEN>" | jq "."
}

#-------paypal-------#

paypal-client-id-key(){
read -p 'Client ID: ' client_id ;
read -p 'Secret: ' secret ;
curl -v https://api.sandbox.paypal.com/v1/oauth2/token \
   -H "Accept: application/json" \
   -H "Accept-Language: en_US" \
   -u "$client_id:secret" \
   -d "grant_type=client_credentials"
}