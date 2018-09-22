require 'json'

user = "{\"user_id\":250,\"session_key\":\"_2a_10_j2pAjgjal1P5k88aQhfEP_\"}"

x = JSON.parse(user)

p ().to_json



# curl "https://chitter-backend-api.herokuapp.com/peeps" \
#   -X POST \
#   -H "Authorization: Token token=_2a_10_yab9r_d6nd0gmc9JRv3a6_" \
#   -H "Content-Type: application/json" \
#   -d '{"peep": {"user_id":264, "body":"what?"}}'
