# import requests
import firebase_admin
from firebase_admin import credentials
from firebase_admin import firestore

token="$2y$10$FAIEorvAA7Z7V/pDrVON7.w7LMRfcNak/SjyfvtEnhptKcXM3IgMy"
url="https://telematics.transtrack.id/api/get_devices?user_api_hash=${token}"
response = requests.get(url)
data = response.json()

cred = credentials.Certificate("path/to/serviceAccountKey.json")
firebase_admin.initialize_app(cred)

db = firestore.client()
doc_ref = db.collection(u'test').document(u'deives')
doc_ref.set(data)