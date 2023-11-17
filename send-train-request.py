import base64
import requests
import os

image_path = os.path.expanduser('~') + '/atw/images/atd_bottle/bottle_with_orange.jpg'

with open(image_path, 'rb') as image_file:
    base64_bytes = base64.b64encode(image_file.read())


# The API endpoint
url = "http://127.0.0.1:8080/dreambooth/v1/train"

new_data = {
        "model_name": "test_model",
        "user": "atw",
        "images": [
            {
                "filename": "img1.png",
                "base64content": base64_bytes.decode('utf-8'),
                }
            ],
        "ref_id": 1234,
        }

# A GET request to the API
response = requests.post(url, json=new_data)

# Print the response
response_json = response.json()
print(response_json)
