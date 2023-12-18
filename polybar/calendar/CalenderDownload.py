import json
import requests

def calendar(year):
    url = f"https://nepalimiti.com/data/{year}-calendar.json"

    payload = {}
    headers = {
    'User-Agent': 'Mozilla/5.0 (X11; Linux x86_64; rv:120.0) Gecko/20100101 Firefox/120.0',
    'Accept': '*/*',
    'Accept-Language': 'en-US,en;q=0.5',
    'Accept-Encoding': 'gzip, deflate, br',
    'Referer': 'https://nepalimiti.com/calendar/{year}/9',
    'DNT': '1',
    'Sec-Fetch-Dest': 'empty',
    'Sec-Fetch-Mode': 'cors',
    'Sec-Fetch-Site': 'same-origin',
    'Sec-GPC': '1',
    'Connection': 'keep-alive'
    }

    response = requests.request("GET", url, headers=headers, data=payload)

    return response.text

def updateCalender(year):
    cal = calendar(year)

    cal = json.loads(cal)

    file_location = f'{year}.json'
    with open(file=file_location,mode='w') as json_file:
        json.dump(cal,json_file,indent=4)

try:
    updateCalender(2080)

except Exception as e:
    print(e)
