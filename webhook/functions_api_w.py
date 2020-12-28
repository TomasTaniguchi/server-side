import requests
from api_maytapi import varibles
from functions  import random_code

INSTANCE_URL = varibles.INSTANCE_URL
API_TOKEN = varibles.API_TOKEN
PRODUCT_ID = varibles.PRODUCT_ID

headers = {
    "Content-Type": "application/json",
    "x-maytapi-key": API_TOKEN,
}

def sent_message(source, destination, message):
    source = str(source)
    destination = str(destination)
    message = random_code.white_space(message)
    url = INSTANCE_URL + "/" + PRODUCT_ID + "/" + source + "/sendMessage"
    payload = {"to_number": destination, "type": "text", "message": message}
    response = requests.request("POST", url, headers=headers, json=payload)
    return response

def sent_payload(payload):
    url = "http://localhost:5000/payload_subscription"
    response = requests.request("POST", url, json=payload)
    return response