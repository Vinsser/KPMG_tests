cache_dict={}

## comvert string to list for managing keys
def get_list(str): return list(str.replace("/", ""))

## extracting value for recuring loop
def ext_val(obj):
    for k, v in obj.items(): return v

## func to except nested object and keys to return respective value
def get_v(obj, keys):
    for i in get_list(keys):
        tmp = ext_val(obj)
        obj = tmp
        cache_dict[i] = obj
    return cache_dict[get_list(keys)[-1]]


##MAIN##
Json_obj={"k":{"t":{"f":{"d":"c"}}}}
Keys='k/t'
print("Json Object: ", Json_obj)
print("Keys: ", Keys)
print("Value :", get_v(Json_obj, Keys))

