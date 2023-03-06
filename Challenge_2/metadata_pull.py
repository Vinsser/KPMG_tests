import requests
import argparse

## Setting up parser
parser = argparse.ArgumentParser()
parser.add_argument('--data_key', type=str, metavar=None, help='data key to be retrived instead of whole json')
args = parser.parse_args()

api_url = "http://metadata.google.internal/computeMetadata/v1/instance?recursive=true"
headers =  {"Metadata-Flavor":"Google"}
response = requests.get(api_url, headers=headers)


# To print only requested key if present or else display all
if(args.data_key): print(args.data_key, " Val: ", response.json()[args.data_key], "\n")
else: print(response.json(), "\n")

# Print all keys as options
print("All available keys for instance: ")
print(response.json().keys())