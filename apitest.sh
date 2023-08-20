

Black='\e[30m'
Red='\e[31m'
Green='\e[32m'
Yellow='\e[33m'
Blue='\e[34m'
Magenta='\e[35m'
Cyan='\e[36m'
White='\e[37m'
n=1

# example curl
# curl -X GET https://example.com/api/resource
# curl -X POST -H "Content-Type: application/json" -d '{"key1":"value1", "key2":"value2"}' URL
# curl -X PUT -d '{"key":"value"}' https://example.com/api/resource
# curl -X DELETE https://example.com/api/resource

declare -A api    

# declare your api in here
urlBase='http://localhost:8000'

# method: GET, POST, PUT, DELETE
api[1]="url=$urlBase/english/hello method=GET data="
api[2]="url=$urlBase/english/hello method=GET data="

totalApi=2

cat << "EOF"
    __      ______   ___     ________   ______   _______    ________ 
   /  \    |      | |   |   |__    __| |  ____| |  _____|  |__    __|
  /    \   |  |   | |   |      |  |    | |____  |  |____      |  |
 /  __  \  |   ___| |   |      |  |    | |____  |_____  |     |  |
/__/  \__\ |__|     |___|      |__|    |______|  _______|     |__|

EOF

for ((i=1; i<=$totalApi; i++));do
    url=${api[$i]#*url=}
    url=${url%% *}
    method=${api[$i]#*method=}
    method=${method%% *}
    data=${api[$i]#*data=}
    data=${data%% *}

    echo -e $Yellow"$i: $method $url"
    echo -n -e $White
    curl -X $method  $data $url
    echo 
done
