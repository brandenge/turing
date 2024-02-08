import requests
import json
import openai
from .settings import OPENAI_API_KEY
from .settings import MIDJ_API_KEY
import time


def gpt_response(prompt, model="gpt-4"):
    openai.api_key = OPENAI_API_KEY
    messages = [{"role": "system", "content": "You are an API endpoint. Please respond as a JSON field"},
                {"role": "user", "content": prompt}]
    response = openai.ChatCompletion.create(
        model=model,
        messages=messages,
        temperature=1.0,
        max_tokens=3000,
        n=1,
        stop=None,
    )
    return response.choices[0].message.content.strip()


def dalle_image(prompt):
    openai.api_key = OPENAI_API_KEY
    response = openai.Image.create(
        prompt=prompt,
        n=1,
        size="1024x1024"
    )
    image_url = response['data'][0]['url']
    return image_url


def imagine(ref, prompt):
    url = "https://api.thenextleg.io/v2/imagine"

    payload = json.dumps({
        "msg": prompt,
        "ref": ref,
        "webhookOverride": "",
        "ignorePrefilter": "false"
    })
    headers = {
        'Authorization': f'Bearer {MIDJ_API_KEY}',
        'Content-Type': 'application/json'
    }

    response = requests.request("POST", url, headers=headers, data=payload)

    try:
        return json.loads(response.text)
    except json.JSONDecodeError:
        print(f"Error: Response could not be parsed as JSON. Response status code: {response.status_code}, response text: {response.text}")
        return None


def get_progress(msgid):
    url = f'https://api.thenextleg.io/v2/message/{msgid}'

    headers = {
    'Authorization': f'Bearer {MIDJ_API_KEY}',
    }

    response = requests.request("GET", url, headers=headers)

    try:
        return json.loads(response.text)
    
    except json.JSONDecodeError:
        print(f"Error: Response could not be parsed as JSON. Response status code: {response.status_code}, response text: {response.text}")
        return None
    
def upscale_img(id, attempt=1, max_attempts=3):
    url = f'https://api.thenextleg.io/upscale-img-url?buttonMessageId={id}&button=U1'

    headers = {
        'Authorization': f'Bearer {MIDJ_API_KEY}',
    }

    response = requests.request("GET", url, headers=headers)

    if response.status_code == 400:
        print(f"Error: {response.status_code}. Response: {response.text}")
        if attempt < max_attempts:
            print(f"Retrying in {attempt * 2} seconds...")
            time.sleep(attempt * 2)
            return upscale_img(id, attempt + 1, max_attempts)
        else:
            raise Exception(f'Failed to upscale image after {max_attempts} attempts.')

    return response.json()["url"]