import requests
from api_maytapi import varibles

INSTANCE_URL = varibles.INSTANCE_URL
API_TOKEN = varibles.API_TOKEN
PRODUCT_ID = varibles.PRODUCT_ID

headers = {
    "Content-Type": "application/json",
    "x-maytapi-key": API_TOKEN,
}

def sent_message(message):
    source = message['source']
    destination = message['destination']
    content = message['message']
    type = message['type_message']
    url = INSTANCE_URL + "/" + PRODUCT_ID + "/" + source + "/sendMessage"
    payload = {"to_number": destination, "type": type, "message": content}
    print(payload)
    response = requests.request("POST", url, headers=headers, json=payload)
    result = response.json()
    return result