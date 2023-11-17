import requests

# The API endpoint
url = "http://127.0.0.1:8080/dreambooth/v1/train"

new_data = {
        "model_name": "test_model",
        "user": "atw",
        "images": [
            {
                "filename": "img1.png",
                "base64content": ""
                }
            ],
        "ref_id": 1234,
        }

# A GET request to the API
response = requests.post(url)

# Print the response
response_json = response.json()
print(response_json)
