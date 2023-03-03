get_v() {
qry=$(echo $2 | tr '/' '.')
echo $1 | jq .$qry
}

str1='{"b":{"x":{"y":{"z":"a"}}}}'
keys=b/x/y/z

echo "Json: " $str1
echo "Keys: " $keys
echo "Value: " $(get_v $str1 $keys)

