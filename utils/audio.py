import os

from .keys import eleven_key
from elevenlabs import set_api_key
from gcloud import storage
from utils import keys
import requests

storage_client = storage.Client()
os.environ["GOOGLE_APPLICATION_CREDENTIALS"] = keys.GOOGLE_APPLICATION_CREDENTIALS


set_api_key(eleven_key)
CHUNK_SIZE = 1024
speech_url = "https://api.elevenlabs.io/v1/text-to-speech/21m00Tcm4TlvDq8ikWAM"


def get_audio(story, audio_name):
    # Request headers for eleven labs API
    headers = {
        "Accept": "audio/mpeg",
        "Content-Type": "application/json",
        "xi-api-key": eleven_key
    }

    audio_data = {
        "text": story.strip("\n\n"),
        "model_id": "eleven_monolingual_v1",
        "voice_settings": {
            "stability": 0.5,
            "similarity_boost": 0.5
        }
    }

    audio_response = requests.post(speech_url, json=audio_data, headers=headers)
    audio = "" + audio_name + ".mp3"
    print(audio)
    with open(audio, 'wb') as f:
        for chunk in audio_response.iter_content(chunk_size=CHUNK_SIZE):
            if chunk:
                f.write(chunk)

    processed_audio_name = audio_name + ".mp3"
    bucket = storage_client.get_bucket("sound_buckets")
    blob = bucket.blob(audio)
    blob.chunk_size = CHUNK_SIZE * CHUNK_SIZE
    blob .upload_from_filename(processed_audio_name)

    return audio_name + ".mp3"
